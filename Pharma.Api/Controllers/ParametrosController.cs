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
    public class ParametrosController : ApiController
    {
        readonly IReadOnlyRepository _readOnlyRepository;
        readonly IWriteOnlyRepository _writeOnlyRepository;
        readonly IMappingEngine _mappingEngine;
        readonly ISession _session;

        public ParametrosController(IReadOnlyRepository readOnlyRepository, IWriteOnlyRepository writeOnlyRepository,
         IMappingEngine mappingEngine, ISession session)
        {
            _readOnlyRepository = readOnlyRepository;
            _writeOnlyRepository = writeOnlyRepository;
            _mappingEngine = mappingEngine;
            _session = session;
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("tipos_clientes/available")]
        public List<TipoClienteModel> GetAvailableTiposClientes()
        {
            var tiposClientesList = _session.CreateSQLQuery("CALL sp_sel_tipo_cliente")
             .SetResultTransformer(Transformers.AliasToBean<tipo_cliente>())
             .List<tipo_cliente>()
             .ToList();

            var tipoClient = _mappingEngine.Map<List<tipo_cliente>, List<TipoClienteModel>>(tiposClientesList);

            return tipoClient;
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("categorias/available")]
        public List<CategoriasModel> GetAvailableCategoriasProductos()
        {
            var categoriasList = _session.CreateSQLQuery("CALL sp_sel_categoria_productos")
             .SetResultTransformer(Transformers.AliasToBean<categoria_productos>())
             .List<categoria_productos>()
             .ToList();

            var cat = _mappingEngine.Map<List<categoria_productos>, List<CategoriasModel>>(categoriasList);

            return cat;
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("presentaciones/available")]
        public List<PresentacionModel> GetAvailablePresentacionesProductos()
        {
            var presentacionesList = _session.CreateSQLQuery("CALL sp_sel_presentacion_productos")
             .SetResultTransformer(Transformers.AliasToBean<presentacion_productos>())
             .List<presentacion_productos>()
             .ToList();

            var present = _mappingEngine.Map<List<presentacion_productos>, List<PresentacionModel>>(presentacionesList);

            return present;
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("tipo_transacciones/available")]
        public List<TipoTranModel> GetAvailableTipoTransacciones()
        {
            var tranList = _session.CreateSQLQuery("CALL sp_sel_tipo_transacciones")
             .SetResultTransformer(Transformers.AliasToBean<tipo_transacciones>())
             .List<tipo_transacciones>()
             .ToList();

            var tran = _mappingEngine.Map<List<tipo_transacciones>, List<TipoTranModel>>(tranList);

            return tran;
        }


    }
}