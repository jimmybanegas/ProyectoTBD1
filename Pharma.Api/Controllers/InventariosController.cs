using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using AttributeRouting.Web.Mvc;
using AutoMapper;
using NHibernate;
using NHibernate.Transform;
using Pharma.Api.Models;
using Pharma.Domain.Entities;
using Pharma.Domain.Services;

namespace Pharma.Api.Controllers
{
    public class InventariosController : ApiController
    {
        readonly IReadOnlyRepository _readOnlyRepository;
        readonly IWriteOnlyRepository _writeOnlyRepository;
        readonly IMappingEngine _mappingEngine;
        readonly ISession _session;

        public InventariosController(IReadOnlyRepository readOnlyRepository, IWriteOnlyRepository writeOnlyRepository,
         IMappingEngine mappingEngine, ISession session)
        {
            _readOnlyRepository = readOnlyRepository;
            _writeOnlyRepository = writeOnlyRepository;
            _mappingEngine = mappingEngine;
            _session = session;
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("ajustes/available/{accesstoken}")]
        public List<AjustesModel> GetAvailableAjustes(string accesstoken)
        {
            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
            .SingleOrDefault<sessions>();

            if (sessions == null) return null;
                var account = sessions.account;

            if (account == null) return null;
            var ajustesList = _session.CreateSQLQuery("CALL sp_sel_ajustes")
             .SetResultTransformer(Transformers.AliasToBean<ajustes>())
             .List<ajustes>()
             .ToList();

            var aj = _mappingEngine.Map<List<ajustes>, List<AjustesModel>>(ajustesList);

            return aj;
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("kardex/available/{accesstoken}")]
        public List<KardexModel> GetAvailableKardex(string accesstoken)
        {
            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
            .SingleOrDefault<sessions>();

            if (sessions == null) return null;
                var account = sessions.account;

            if (account == null) return null;
            var kardexList = _session.CreateSQLQuery("CALL sp_sel_kardex")
             .SetResultTransformer(Transformers.AliasToBean<kardex>())
             .List<kardex>()
             .ToList();

            var kard = _mappingEngine.Map<List<kardex>, List<KardexModel>>(kardexList);

            return kard;
        }

    }
}