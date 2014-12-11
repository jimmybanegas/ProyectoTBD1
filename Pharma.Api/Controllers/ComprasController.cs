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
        [GET("proveedores/available/{accesstoken}")]
        public List<ProveedoresModel> GetAvailableProveedores(string accesstoken)
        {
            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
            .SingleOrDefault<sessions>();

            if (sessions == null) return null;
                var account = sessions.account;

            if (account == null) return null;
            var proveeList = _session.CreateSQLQuery("CALL sp_sel_proveedores")
             .SetResultTransformer(Transformers.AliasToBean<proveedores>())
             .List<proveedores>()
             .ToList();

            var provee = _mappingEngine.Map<List<proveedores>, List<ProveedoresModel>>(proveeList);

            return provee;
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("compras/available/{accesstoken}")]
        public List<ComprasModel> GetAvailableCompras(string accesstoken)
        {
            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
            .SingleOrDefault<sessions>();

            if (sessions == null) return null;
                var account = sessions.account;

            if (account == null) return null;
            var comprasList = _session.CreateSQLQuery("CALL sp_sel_compras")
             .SetResultTransformer(Transformers.AliasToBean<compras>())
             .List<compras>()
             .ToList();

            var compr = _mappingEngine.Map<List<compras>, List<ComprasModel>>(comprasList);

            return compr;
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("cotizaciones/available/{accesstoken}")]
        public List<CotizacionesModel> GetAvailableCotizaciones(string accesstoken)
        {
            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
            .SingleOrDefault<sessions>();

            var account = sessions.account;

            if (account == null) return null;
            var cotizacionesList = _session.CreateSQLQuery("CALL sp_sel_cotizaciones")
             .SetResultTransformer(Transformers.AliasToBean<cotizaciones>())
             .List<cotizaciones>()
             .ToList();

            var cotiz = _mappingEngine.Map<List<cotizaciones>, List<CotizacionesModel>>(cotizacionesList);

            return cotiz;
        }


        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("ordenes/available/{accesstoken}")]
        public List<OrdenesCompraModel> GetAvailableOc(string accesstoken)
        {
            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
            .SingleOrDefault<sessions>();

            var account = sessions.account;

            if (account == null) return null;
            var ordenesList = _session.CreateSQLQuery("CALL sp_sel_ordenes_de_compra")
             .SetResultTransformer(Transformers.AliasToBean<ordenes_de_compra>())
             .List<ordenes_de_compra>()
             .ToList();

            var oc = _mappingEngine.Map<List<ordenes_de_compra>, List<OrdenesCompraModel>>(ordenesList);

            return oc;
        }

        [HttpPost]
        [AcceptVerbs("POST", "HEAD")]
        [POST("guardarCotizacion/{accesstoken}")]
        public RestorePasswordResponseModel guardarCotizacion(string accesstoken, [FromBody] CotizacionesModel model)
        {
            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
                .SingleOrDefault<sessions>();

            if (sessions == null) return null;
            var account = sessions.account;

            if (account == null) return null;

            var lista = PharmaMethodsExecutor.sp_ins_cotizaciones(_session, model.fecha, model.total, DateTime.Now,
                DateTime.Now,sessions.account.Email, sessions.account.Email, model.proveedores.id_proveedor);

            var cotizacion = _session.QueryOver<cotizaciones>()
                 .OrderBy(x => x.fecha_crea).Desc
                 .Take(1)
                 .SingleOrDefault<cotizaciones>();

            foreach (var detalle in model.detalle_cotizaciones)
            {
                PharmaMethodsExecutor.sp_ins_detalle_cotizaciones(_session,detalle.num_detalle,detalle.cantidad,detalle.precio_unit,
                    cotizacion.id_cotizacion,detalle.productos.cod_prod);
            }

            return new RestorePasswordResponseModel()
            {
                Message = "Grabada",
                Status = 2
            };
        }
    }
}