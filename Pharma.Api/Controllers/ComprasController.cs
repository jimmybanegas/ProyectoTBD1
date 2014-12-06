﻿using System;
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
    public class ComprasController : ApiController
    {
        readonly IReadOnlyRepository _readOnlyRepository;
        readonly IWriteOnlyRepository _writeOnlyRepository;
        readonly IMappingEngine _mappingEngine;
        readonly ISession _session;

        public ComprasController(IReadOnlyRepository readOnlyRepository, IWriteOnlyRepository writeOnlyRepository,
         IMappingEngine mappingEngine, ISession session)
        {
            _readOnlyRepository = readOnlyRepository;
            _writeOnlyRepository = writeOnlyRepository;
            _mappingEngine = mappingEngine;
            _session = session;
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("proveedores/available")]
        public List<ProveedoresModel> GetAvailableProveedores()
        {
            var proveeList = _session.CreateSQLQuery("CALL sp_sel_proveedores")
             .SetResultTransformer(Transformers.AliasToBean<proveedores>())
             .List<proveedores>()
             .ToList();

            var provee = _mappingEngine.Map<List<proveedores>, List<ProveedoresModel>>(proveeList);

            return provee;
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("compras/available")]
        public List<ComprasModel> GetAvailableCompras()
        {
            var comprasList = _session.CreateSQLQuery("CALL sp_sel_compras")
             .SetResultTransformer(Transformers.AliasToBean<compras>())
             .List<compras>()
             .ToList();

            var compr = _mappingEngine.Map<List<compras>, List<ComprasModel>>(comprasList);

            return compr;
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("cotizaciones/available")]
        public List<CotizacionesModel> GetAvailableCotizaciones()
        {
            var cotizacionesList = _session.CreateSQLQuery("CALL sp_sel_cotizaciones")
             .SetResultTransformer(Transformers.AliasToBean<cotizaciones>())
             .List<cotizaciones>()
             .ToList();

            var cotiz = _mappingEngine.Map<List<cotizaciones>, List<CotizacionesModel>>(cotizacionesList);

            return cotiz;
        }


        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("ordenes/available")]
        public List<OrdenesCompraModel> GetAvailableOc()
        {
            var ordenesList = _session.CreateSQLQuery("CALL sp_sel_ordenes_de_compra")
             .SetResultTransformer(Transformers.AliasToBean<ordenes_de_compra>())
             .List<ordenes_de_compra>()
             .ToList();

            var oc = _mappingEngine.Map<List<ordenes_de_compra>, List<OrdenesCompraModel>>(ordenesList);

            return oc;
        }
    }
}