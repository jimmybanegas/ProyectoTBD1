using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
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
    public class FacturacionController : ApiController
    {
        readonly IReadOnlyRepository _readOnlyRepository;
        readonly IWriteOnlyRepository _writeOnlyRepository;
        readonly IMappingEngine _mappingEngine;
        readonly ISession _session;

        public FacturacionController(IReadOnlyRepository readOnlyRepository, IWriteOnlyRepository writeOnlyRepository,
         IMappingEngine mappingEngine, ISession session)
        {
            _readOnlyRepository = readOnlyRepository;
            _writeOnlyRepository = writeOnlyRepository;
            _mappingEngine = mappingEngine;
            _session = session;
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("productos/available")]
        public List<ProductosModel> GetAvailableProducts()
        {
            var productsList = _session.CreateSQLQuery("CALL sp_sel_productos")
             .SetResultTransformer(Transformers.AliasToBean<productos>())
             .List<productos>()
             .ToList();

            var prod = _mappingEngine.Map<List<productos>, List<ProductosModel>>(productsList);

            return prod;
        }


        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("clientes/available")]
        public List<ClientesModel> GetAvailableClientes()
        {
            var clientesList = _session.CreateSQLQuery("CALL sp_sel_productos")
             .SetResultTransformer(Transformers.AliasToBean<clientes>())
             .List<clientes>()
             .ToList();

            var client = _mappingEngine.Map<List<clientes>, List<ClientesModel>>(clientesList);

            return client;
        }


    }
}