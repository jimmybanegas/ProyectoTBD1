using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Http;
using AttributeRouting.Web.Mvc;
using AutoMapper;
using Pharma.Application.API.Models;
using Pharma.Domain.Entities;
using Pharma.Domain.Services;

namespace Pharma.Application.API.Controllers
{
    public class GamesController : BaseApiController
    {
        private readonly IReadOnlyRepository _readOnlyRepository;
        private readonly IWriteOnlyRepository _writeOnlyRepository;
        private readonly IMappingEngine _mappingEngine;

        public GamesController(IReadOnlyRepository readOnlyRepository, IWriteOnlyRepository writeOnlyRepository, IMappingEngine mappingEngine)
        {
            _readOnlyRepository = readOnlyRepository;
            _writeOnlyRepository = writeOnlyRepository;
            _mappingEngine = mappingEngine;
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("leagues/{leagueId}/games")]
        public List<GameModel> GetGames([FromUri] long leagueId)
        {
            League foundLeague = _readOnlyRepository.FirstOrDefault<League>(x => x.Id == leagueId);
            if (foundLeague == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "The league can not be found. Please check the Id");
            var gamesInLeague = _mappingEngine.Map<List<Game>, List<GameModel>>(foundLeague.Games.ToList());// foundLeague.Games.ToList();
            return gamesInLeague;
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("leagues/{leagueId}/games/get/{gameId}")]
        public GameModel GetGame([FromUri]long leagueId, [FromUri]long gameId)
        {
            League foundLeague = _readOnlyRepository.FirstOrDefault<League>(le => le.Id == leagueId);
            if (foundLeague == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "League not found");

            Game foundGame = _readOnlyRepository.FirstOrDefault<Game>(ga => ga.Id == gameId);
            if (foundGame == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "Game not found");

            GameModel gameModel = _mappingEngine.Map<Game, GameModel>(foundGame);

            return gameModel;
        }

        [HttpPost]
        [AcceptVerbs("POST", "HEAD")]
        [POST("leagues/{leagueId}/games/creategame")]
        public bool CreateGame([FromUri] long leagueId, [FromBody] NewGameModel model)
        {
            League foundLeague = _readOnlyRepository.FirstOrDefault<League>(x => x.Id == leagueId);
            if (foundLeague == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "The league can not be found. Please check the Id");

            Team homeTeam = _readOnlyRepository.FirstOrDefault<Team>(team => team.Id == model.HomeTeam.Id);
            Team awayTeam = _readOnlyRepository.FirstOrDefault<Team>(team => team.Id == model.AwayTeam.Id);

            Game foundGame = _readOnlyRepository.FirstOrDefault<Game>(
                game =>
                    game.HomeTeam == homeTeam &&
                    game.AwayTeam == awayTeam &&
                    game.MatchDate == model.MatchDate
                );

            if (foundGame != null)
                throw new HttpException((int)HttpStatusCode.Conflict, "A game with this data already exist");

            foundGame = new Game()
            {
                HomeTeam = homeTeam,
                AwayTeam = awayTeam,
                MatchDate = model.MatchDate
            };
            var gameList = foundLeague.Games.ToList();
            gameList.Add(foundGame);
            foundLeague.Games = gameList;

            //            _writeOnlyRepository.Create(foundGame);
            _writeOnlyRepository.Update(foundLeague);

            return true;
        }

        [HttpGet]
        [AcceptVerbs("POST", "HEAD")]
        [POST("leagues/{leagueId}/games/editgame")]
        public bool UpdateGame([FromUri] long leagueId, [FromBody] GameModel model)
        {
            League foundLeague = _readOnlyRepository.FirstOrDefault<League>(x => x.Id == leagueId);
            if (foundLeague == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "The league can not be found. Please check the Id");
            Game foundGame = _readOnlyRepository.FirstOrDefault<Game>(
                game =>
                    game.Id == model.Id
                );

            if (foundGame == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "This game doesn't exist");

            Team homeTeam = _readOnlyRepository.FirstOrDefault<Team>(team => team.Name == model.HomeTeam.Name);
            Team awayTeam = _readOnlyRepository.FirstOrDefault<Team>(team => team.Name == model.AwayTeam.Name);

            //foundGame = _mappingEngine.Map<GameModel, Game>(model, foundGame);
            foundGame.HomeTeam = homeTeam;
            foundGame.AwayTeam = awayTeam;
            foundGame.MatchDate = model.MatchDate;

            var up = _writeOnlyRepository.Update(foundGame);

            return true;
        }

        [HttpGet]
        [AcceptVerbs("POST", "HEAD")]
        [POST("leagues/{leagueId}/games/deletegame/{gameId}")]
        public bool ArchiveGame([FromUri] long leagueId, [FromUri] long gameId)
        {
            League foundLeague = _readOnlyRepository.FirstOrDefault<League>(x => x.Id == leagueId);
            if (foundLeague == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "The league can not be found. Please check the Id");

            Game foundGame = _readOnlyRepository.FirstOrDefault<Game>(game => game.Id == gameId);
            if (foundGame == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "A game with this Id was not found");

            foundGame.IsArchived = true;
            _writeOnlyRepository.Update(foundGame);

            return true;
        }

        [HttpGet]
        [AcceptVerbs("POST", "HEAD")]
        [POST("leagues/{leagueId}/games/restoregame/{gameId}")]
        public bool RestoreGame([FromUri] long leagueId, [FromUri] long gameId)
        {
            League foundLeague = _readOnlyRepository.FirstOrDefault<League>(x => x.Id == leagueId);
            if (foundLeague == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "The league can not be found. Please check the Id");

            Game foundGame = _readOnlyRepository.FirstOrDefault<Game>(game => game.Id == gameId);
            if (foundGame == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "A game with this Id was not found");

            foundGame.IsArchived = false;
            _writeOnlyRepository.Update(foundGame);

            return true;
        }

        [HttpGet]
        [AcceptVerbs("POST", "HEAD")]
        [POST("leagues/{leagueId}/games/{gameId}/assignresult")]
        public bool AssignResultToGame([FromUri] long leagueId, [FromUri] long gameId,
            [FromBody] ResultDataModel resultModel)
        {
            League foundLeague = _readOnlyRepository.FirstOrDefault<League>(x => x.Id == leagueId);
            if (foundLeague == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "The league can not be found. Please check the Id");

            Game foundGame = _readOnlyRepository.FirstOrDefault<Game>(game => game.Id == gameId);
            if (foundGame == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "A game with this Id was not found");

            foundGame.Result = _mappingEngine.Map<ResultDataModel, Result>(resultModel, foundGame.Result);
            foundGame.Completed = true;
            _writeOnlyRepository.Update(foundGame);
            return true;
        }
    }
}