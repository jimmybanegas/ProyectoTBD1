using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AttributeRouting.Web.Mvc;
using AutoMapper;
using Pharma.Domain.Entities;
using Pharma.Domain.Services;
using Pharma.Api.Models;

namespace Pharma.Api.Controllers
{
    public class LeaguesController : BaseApiController
    {
        readonly IReadOnlyRepository _readOnlyRepository;
        readonly IMappingEngine _mappingEngine;

        public LeaguesController(IReadOnlyRepository readOnlyRepository, IMappingEngine mappingEngine)
        {
            _readOnlyRepository = readOnlyRepository;
            _mappingEngine = mappingEngine;
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("leagues/available")]
        public List<LeaguesModel> GetAvailableLeagues()
        {
            var userTokenModel = GetUserTokenModel();
            if (userTokenModel == null)
                throw new HttpException((int)HttpStatusCode.Unauthorized, "User is not authorized");

            var leagues = _readOnlyRepository.GetAll<Leagues>().ToList();
            var leaguesModel = _mappingEngine.Map<List<Leagues>, List<LeaguesModel>>(leagues);
            return leaguesModel;
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("leagues/suscribed")]
        public List<LeaguesModel> GetSuscribedLeagues()
        {
            var userTokenModel = GetUserTokenModel();
            if (userTokenModel == null)
                throw new HttpException((int)HttpStatusCode.Unauthorized, "User is not authorized");

            var account = _readOnlyRepository.Query<AccountLeagues>(x => x.User.Email == userTokenModel.email).Select(y => y.League);
            var leaguesModel = _mappingEngine.Map<List<Leagues>, List<LeaguesModel>>(account.ToList());
            return leaguesModel;
        }

    }
}