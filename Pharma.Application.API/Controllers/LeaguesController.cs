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
    public class LeaguesController : BaseApiController
    {
        readonly IReadOnlyRepository _readOnlyRepository;
        private readonly IWriteOnlyRepository _writeOnlyRepository;
        readonly IMappingEngine _mappingEngine;

        public LeaguesController(IReadOnlyRepository readOnlyRepository, IWriteOnlyRepository writeOnlyRepository, IMappingEngine mappingEngine)
        {
            _readOnlyRepository = readOnlyRepository;
            _writeOnlyRepository = writeOnlyRepository;
            _mappingEngine = mappingEngine;
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("leagues/available")]
        public List<LeagueModel> GetAvailableLeagues()
        {
            var userTokenModel = GetUserTokenModel();
            if (userTokenModel == null)
                throw new HttpException((int)HttpStatusCode.Unauthorized, "User is not authorized");

            var account = _readOnlyRepository.GetAll<League>().ToList();
            var leaguesModel = _mappingEngine.Map<List<League>, List<LeagueModel>>(account.ToList());

            return leaguesModel;
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("leagues/get/{leagueId}")]
        public LeagueModel GetLeague([FromUri]long leagueId)
        {
            League foundLeague = _readOnlyRepository.FirstOrDefault<League>(le => le.Id == leagueId);
            if (foundLeague == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "League not found");

            LeagueModel leagueModel = _mappingEngine.Map<League, LeagueModel>(foundLeague);

            return leagueModel;
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("leagues/suscribed")]
        public List<LeagueModel> GetSuscribedLeagues()
        {
            var userTokenModel = GetUserTokenModel();
            if (userTokenModel == null)
                throw new HttpException((int)HttpStatusCode.Unauthorized, "User is not authorized");

            var account =
                _readOnlyRepository.Query<AccountLeague>(x => x.User.Email == userTokenModel.email && !x.IsArchived)
                    .Select(y => y.League);
            var leaguesModel = _mappingEngine.Map<List<League>, List<LeagueModel>>(account.ToList());
            return leaguesModel;
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("leagues/issuscribed/{leagueId}")]
        public bool IsSuscribed([FromUri]long leagueId)
        {
            var userTokenModel = GetUserTokenModel();
            if (userTokenModel == null)
                throw new HttpException((int)HttpStatusCode.Unauthorized, "User is not authorized");

            var user = _readOnlyRepository.FirstOrDefault<Account>(us => us.Email == userTokenModel.email);
            if (user == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "Could not found a user with the given email");

            AccountLeague accountLeague = _readOnlyRepository.FirstOrDefault<AccountLeague>(ac => ac.User == user && ac.League.Id == leagueId);

            return (accountLeague != null); //If it's not null then this user is suscribed to this league
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("leagues/{leagueId}/suscribedusers")]
        public List<UserModel> GetSuscribedUsers([FromUri] long leagueId)
        {
            League foundLeague = _readOnlyRepository.FirstOrDefault<League>(le => le.Id == leagueId);
            if (foundLeague == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "League not found");

            var accounts = _readOnlyRepository.Query<AccountLeague>(acl => acl.League == foundLeague).
                Select(acl => acl.User).ToList();

            var resultUsers = _mappingEngine.Map<List<Account>, List<UserModel>>(accounts);

            return resultUsers;
        }

        [HttpGet]
        [AcceptVerbs("POST", "DELETE", "HEAD")]
        [POST("leagues/deleteleague/{id}")]
        public LeagueModel ArchiveLeague(int Id)
        {
            League foundLeague = _readOnlyRepository.FirstOrDefault<League>(le => le.Id == Id);
            if (foundLeague == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "League not found");

            foundLeague.IsArchived = true;
            var updatedLeague = _writeOnlyRepository.Update(foundLeague);
            var updatedLeagueModel = _mappingEngine.Map<League, LeagueModel>(updatedLeague);
            return updatedLeagueModel;
        }

        [HttpGet]
        [AcceptVerbs("POST", "HEAD")]
        [POST("leagues/restoreleague/{id}")]
        public LeagueModel RestoreLeague(int Id)
        {
            League foundLeague = _readOnlyRepository.FirstOrDefault<League>(le => le.Id == Id);
            if (foundLeague == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "League not found");

            foundLeague.IsArchived = false;
            var updatedLeague = _writeOnlyRepository.Update(foundLeague);
            var updatedLeagueModel = _mappingEngine.Map<League, LeagueModel>(updatedLeague);
            return updatedLeagueModel;
        }

        [HttpPost]
        [AcceptVerbs("POST", "PUT", "HEAD")]
        [POST("leagues/createleague")]
        public LeagueCreatedModel CreateNewLeague([FromBody] NewLeagueModel model)
        {
            League foundLeague = _readOnlyRepository.FirstOrDefault<League>(le => le.Name == model.Name);
            if (foundLeague != null)
                throw new HttpException((int)HttpStatusCode.Conflict, "A league with this name was already registered");

            League newLeague = _mappingEngine.Map<NewLeagueModel, League>(model);
            League createdLeague = _writeOnlyRepository.Create(newLeague);

            var leagueCreatedModel = _mappingEngine.Map<League, LeagueCreatedModel>(createdLeague);
            leagueCreatedModel.Value = "Successufully Created the league";
            return leagueCreatedModel;
        }

        [HttpPost]
        [AcceptVerbs("POST", "HEAD")]
        [POST("leagues/editleague/{leagueId}")]
        public UpdatedLeagueModel UpdateLeague([FromUri] long leagueId, [FromBody] LeagueUpdateModel model)
        {
            var request = Request;
            League foundLeague = _readOnlyRepository.FirstOrDefault<League>(le => le.Id == model.Id);
            if (foundLeague == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "That League was not found");

            foundLeague = _mappingEngine.Map<LeagueUpdateModel, League>(model, foundLeague);
            League updatedLeague = _writeOnlyRepository.Update(foundLeague);

            UpdatedLeagueModel updatedModel = new UpdatedLeagueModel()
            {
                Value = "Succesfully Updated the League"
            };
            return updatedModel;
        }

        [HttpPost]
        [AcceptVerbs("POST", "HEAD")]
        [POST("leagues/suscribe/{leagueId}")]
        public LeagueSuscribedModel SuscribeToLeague(long leagueId)
        {
            var userTokenModel = GetUserTokenModel();
            if (userTokenModel == null)
                throw new HttpException((int)HttpStatusCode.Unauthorized, "User is not authorized");

            var account = _readOnlyRepository.FirstOrDefault<Account>(x => x.Email == userTokenModel.email);
            var league = _readOnlyRepository.FirstOrDefault<League>(x => x.Id == leagueId);

            var accountLeague = new AccountLeague()
            {
                User = account,
                League = league
            };
            var accLeaExistenceCheck = _readOnlyRepository.FirstOrDefault<AccountLeague>(x => x.User.Id == account.Id && x.League.Id == league.Id);
            if (accLeaExistenceCheck != null)
            {
                if (accLeaExistenceCheck.IsArchived)
                {
                    accLeaExistenceCheck.IsArchived = false;
                    _writeOnlyRepository.Update(accLeaExistenceCheck);
                }
            }
            else
            {
                var accountLeagueCreated = _writeOnlyRepository.Create(accountLeague);
            }
            return new LeagueSuscribedModel() { Value = "Successfully Suscribed to league" };
        }

        [HttpPost]
        [AcceptVerbs("POST", "HEAD")]
        [POST("leagues/unsuscribe/{leagueId}")]
        public string UnsuscribeFromoLeague(long leagueId)
        {
            var userTokenModel = GetUserTokenModel();
            if (userTokenModel == null)
                throw new HttpException((int)HttpStatusCode.Unauthorized, "User is not authorized");

            var account = _readOnlyRepository.FirstOrDefault<Account>(x => x.Email == userTokenModel.email);

            var accLeaExistenceCheck = _readOnlyRepository.FirstOrDefault<AccountLeague>(x => x.User.Id == account.Id && x.League.Id == leagueId);

            if (accLeaExistenceCheck == null)
                throw new HttpException((int)HttpStatusCode.Conflict, "User is not suscribed to this league");

            accLeaExistenceCheck.IsArchived = true;
            _writeOnlyRepository.Update(accLeaExistenceCheck);
            return "Successfully unsuscribed from league";
        }
    }
}
