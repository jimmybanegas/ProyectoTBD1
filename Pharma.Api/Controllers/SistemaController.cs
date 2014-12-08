using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using AttributeRouting.Web.Http;
using AutoMapper;
using NHibernate;
using NHibernate.Transform;
using Pharma.Api.Models;
using Pharma.Domain.Entities;
using Pharma.Domain.Services;

namespace Pharma.Api.Controllers
{
    public class SistemaController : ApiController
    {
        readonly IReadOnlyRepository _readOnlyRepository;
        readonly IWriteOnlyRepository _writeOnlyRepository;
        readonly IMappingEngine _mappingEngine;
        readonly ISession _session;

        public SistemaController(IReadOnlyRepository readOnlyRepository, IWriteOnlyRepository writeOnlyRepository,
         IMappingEngine mappingEngine, ISession session)
        {
            _readOnlyRepository = readOnlyRepository;
            _writeOnlyRepository = writeOnlyRepository;
            _mappingEngine = mappingEngine;
            _session = session;
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("usuarios/available/{accesstoken}")]
        public List<AccountModel> GetAvailableKardex(string accesstoken)
        {
            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
             .SingleOrDefault<sessions>();

            if (sessions == null) return null;
                var account = sessions.account;

            if (account == null) return null;
            var accountList = _session.CreateSQLQuery("CALL sp_sel_account")
             .SetResultTransformer(Transformers.AliasToBean<account>())
             .List<account>()
             .ToList();

            var  ac = _mappingEngine.Map<List<account>, List<AccountModel>>(accountList);

            return ac;
        }
    }
}