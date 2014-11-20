using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AttributeRouting.Web.Mvc;
using AutoMapper;
using Pharma.Api.Models;
using Pharma.Domain.Entities;
using Pharma.Domain.Services;

namespace Pharma.Api.Controllers
{
    public class LeaguesController : BaseApiController
    {
        private readonly IMappingEngine _mappingEngine;
        private readonly IReadOnlyRepository _readOnlyRepository;

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
            UserTokenModel userTokenModel = GetUserTokenModel();
            if (userTokenModel == null)
                throw new HttpException((int) HttpStatusCode.Unauthorized, "User is not authorized");

            List<Leagues> leagues = _readOnlyRepository.GetAll<Leagues>().ToList();
            List<LeaguesModel> leaguesModel = _mappingEngine.Map<List<Leagues>, List<LeaguesModel>>(leagues);
            return leaguesModel;
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("leagues/suscribed")]
        public List<LeaguesModel> GetSuscribedLeagues()
        {
            UserTokenModel userTokenModel = GetUserTokenModel();
            if (userTokenModel == null)
                throw new HttpException((int) HttpStatusCode.Unauthorized, "User is not authorized");

            //   var account = _readOnlyRepository.Query<AccountLeagues>(x => x.User.Email == userTokenModel.email).Select(y => y.League);
            //   var leaguesModel = _mappingEngine.Map<List<Leagues>, List<LeaguesModel>>(account.ToList());
            return null;
        }
    }
}