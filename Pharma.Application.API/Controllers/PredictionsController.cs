using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Http;
using AttributeRouting.Web.Http;
using AutoMapper;
using Pharma.Application.API.Models;
using Pharma.Domain.Entities;
using Pharma.Domain.Services;

namespace Pharma.Application.API.Controllers
{
    public class PredictionsController : BaseApiController
    {
        private readonly IReadOnlyRepository _readOnlyRepository;
        private readonly IWriteOnlyRepository _writeOnlyRepository;
        private readonly IMappingEngine _mappingEngine;

        public PredictionsController(IReadOnlyRepository readOnlyRepository, IWriteOnlyRepository writeOnlyRepository,
            IMappingEngine mappingEngine)
        {
            _readOnlyRepository = readOnlyRepository;
            _writeOnlyRepository = writeOnlyRepository;
            _mappingEngine = mappingEngine;
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("users/{userId}/predictions")]
        public List<PredictionGameModel> GetPredictions([FromUri] long userId)
        {
            var user = _readOnlyRepository.FirstOrDefault<Account>(usr => usr.Id == userId);

            if (user == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "There's no user with that Id");

            var predictionData =
                _readOnlyRepository.Query<AccountGamePrediction>(pred => pred.User == user)
                    .Select(pred => new PredictionGameModel
                    {
                        LeagueName = pred.League.Name,
                        HomeTeamName = pred.Game.HomeTeam.Name,
                        AwayTeamName = pred.Game.AwayTeam.Name,
                        MatchDate = pred.Game.MatchDate,
                        HomeTeamGoals = pred.Prediction.HomeTeamGoals,
                        AwayTeamGoals = pred.Prediction.AwayTeamGoals,
                        HomeTeamPenalties = pred.Prediction.HomeTeamPenalties,
                        AwayTeamPenalties = pred.Prediction.AwayTeamPenalties,
                        Winner = pred.Prediction.Winner
                    })
                    .ToList();

            return predictionData;
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("users/{userId}/predictions/haspredictionforgame/{gameId}")]
        public bool HasPredictionForGame([FromUri] long userId, [FromUri] long gameId)
        {
            var user = _readOnlyRepository.FirstOrDefault<Account>(usr => usr.Id == userId);
            if (user == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "There's no user with that Id");

            var game = _readOnlyRepository.FirstOrDefault<Game>(ga => ga.Id == gameId);
            if (game == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "There's no game with that Id");

            var userPredictionWithGameId =
                _readOnlyRepository.FirstOrDefault<AccountGamePrediction>(
                    ac => ac.User.Id == userId && ac.Game.Id == gameId);

            return userPredictionWithGameId != null;
        }

        [HttpGet]
        [AcceptVerbs("POST", "HEAD")]
        [POST("users/{userId}/games/{gameId}/predictions/createprediction/")]
        public bool CreatePrediction([FromUri] long userId, [FromUri] long gameId, [FromBody] ResultDataModel model)
        {
            var user = _readOnlyRepository.FirstOrDefault<Account>(usr => usr.Id == userId);
            if (user == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "There's no user with that Id");

            var game = _readOnlyRepository.FirstOrDefault<Game>(ga => ga.Id == gameId);
            if (game == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "There's no game with that Id");

            if (game.Completed)
                throw new HttpException((int)HttpStatusCode.Conflict, "The match already finished, you can't predict its result");

            var leagues = _readOnlyRepository.GetAll<League>().ToList().Where(le => le.Games.Contains(game));
            var league = leagues.FirstOrDefault(l => l.Games.ToList().Count > 0);
            //var leagues = _readOnlyRepository.FirstOrDefault<League>(le => le.Games.Where(ga => ga == game).Contains(game));
            if (league == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "There's no league which contains this game");

            var foundAccountGamePrediction = _readOnlyRepository.FirstOrDefault<AccountGamePrediction>(pred => pred.Game == game);
            if (foundAccountGamePrediction != null)
                throw new HttpException((int)HttpStatusCode.Conflict, "A prediction for this game already exist");

            var prediction = _mappingEngine.Map<ResultDataModel, Prediction>(model);

            var newAccountGamePrediction = new AccountGamePrediction
            {
                User = user,
                Prediction = prediction,
                Game = game,
                League = league
            };

            user.AddPrediction(prediction);
            _writeOnlyRepository.Update(user);
            _writeOnlyRepository.Create(newAccountGamePrediction);

            return true;
        }

        [HttpGet]
        [AcceptVerbs("POST", "HEAD")]
        [POST("users/{userId}/games/{gameId}/predictions/editprediction/")]
        public bool UpdatePrediction([FromUri] long userId, [FromUri] long gameId, [FromBody] ResultDataModel model)
        {
            var user = _readOnlyRepository.FirstOrDefault<Account>(usr => usr.Id == userId);
            if (user == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "There's no user with that Id");

            var game = _readOnlyRepository.FirstOrDefault<Game>(ga => ga.Id == gameId);
            if (game == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "There's no game with that Id");

            if (game.Completed)
                throw new HttpException((int)HttpStatusCode.Conflict, "The match already finished, you can't predict its result");
            var foundAccountGamePrediction = _readOnlyRepository.FirstOrDefault<AccountGamePrediction>(pred => pred.Game == game);
            if (foundAccountGamePrediction == null)
                throw new HttpException((int)HttpStatusCode.Conflict, "A prediction for this game does not exist");
            var prediction = foundAccountGamePrediction.Prediction;
            prediction = _mappingEngine.Map<ResultDataModel, Prediction>(model, prediction);
            foundAccountGamePrediction.Prediction = prediction;

            _writeOnlyRepository.Update(foundAccountGamePrediction);


            return true;
        }

        [HttpGet]
        [AcceptVerbs("POST", "HEAD")]
        [POST("users/{userId}/games/{gameId}/predictions/deleteprediction/{predictionId}")]
        public bool DeletePrediction([FromUri] long predictionId)
        {
            var userTokenModel = GetUserTokenModel();
            if (userTokenModel == null)
                throw new HttpException((int)HttpStatusCode.Unauthorized, "User is not authorized");
            var user = _readOnlyRepository.FirstOrDefault<Account>(us => us.Email == userTokenModel.email);
            if (user == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "Can not find user");

            user.RemovePrediction(predictionId);
            _writeOnlyRepository.Update(user);
            _writeOnlyRepository.Delete<Prediction>(predictionId);
            return true;
        }
    }
}