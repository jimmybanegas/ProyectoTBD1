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
        [GET("tipos_clientes/available/{accesstoken}")]
        public List<TipoClienteModel> GetAvailableTiposClientes(string accesstoken)
        {

            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
             .SingleOrDefault<sessions>();

            if (sessions == null) return null;
                var account = sessions.account;

            if (account == null) return null; 
              var tiposClientesList = _session.CreateSQLQuery("CALL sp_sel_tipo_cliente")
             .SetResultTransformer(Transformers.AliasToBean<tipo_cliente>())
             .List<tipo_cliente>()
             .ToList();

            var tipoClient = _mappingEngine.Map<List<tipo_cliente>, List<TipoClienteModel>>(tiposClientesList);

            return tipoClient;
        }

        [HttpPost]
        [AcceptVerbs("POST", "HEAD")]
        [POST("guardarTipoCliente/{accesstoken}")]
        public RestorePasswordResponseModel guardarTipoCliente(string accesstoken, [FromBody] TipoClienteModel model)
        {
            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
                .SingleOrDefault<sessions>();

            if (sessions == null) return null;
            var account = sessions.account;

            if (account == null) return null;

            PharmaMethodsExecutor.sp_ins_tipo_cliente(_session,model.descripcion,DateTime.Now, DateTime.Now, sessions.account.Email, 
                sessions.account.Email);

         
            return new RestorePasswordResponseModel()
                        {
                            Message = "Guardado",
                            Status = 2
                        };
          }


        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("categorias/available/{accesstoken}")]
        public List<CategoriasModel> GetAvailableCategoriasProductos(string accesstoken)
        {
            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
             .SingleOrDefault<sessions>();

            if (sessions == null) return null;
            var account = sessions.account;

            if (account == null) return null;
              var categoriasList = _session.CreateSQLQuery("CALL sp_sel_categoria_productos")
             .SetResultTransformer(Transformers.AliasToBean<categoria_productos>())
             .List<categoria_productos>()
             .ToList();

            var cat = _mappingEngine.Map<List<categoria_productos>, List<CategoriasModel>>(categoriasList);

            return cat;
        }


        [HttpPost]
        [AcceptVerbs("POST", "HEAD")]
        [POST("guardarCategoria/{accesstoken}")]
        public RestorePasswordResponseModel guardarCategoria(string accesstoken, [FromBody] CategoriasModel model)
        {
            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
                .SingleOrDefault<sessions>();

            if (sessions == null) return null;
            var account = sessions.account;

            if (account == null) return null;

            PharmaMethodsExecutor.sp_ins_categoria_productos(_session,model.nombre,DateTime.Now,DateTime.Now,sessions.account.Email,sessions.account.Email);
             
            return new RestorePasswordResponseModel()
            {
                Message = "Guardado",
                Status = 2
            };
        }

        [HttpPost]
        [AcceptVerbs("POST", "HEAD")]
        [POST("borrarCategoria/{accesstoken}")]
        public RestorePasswordResponseModel borrarCategoria(string accesstoken, [FromBody] CategoriasModel model)
        {
            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
                .SingleOrDefault<sessions>();

            if (sessions == null) return null;
            var account = sessions.account;

            if (account == null) return null;

            PharmaMethodsExecutor.sp_del_categoria_productos(_session, model.cod_categoria);

            return new RestorePasswordResponseModel()
            {
                Message = "Borrado",
                Status = 2
            };
        }


        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("presentaciones/available/{accesstoken}")]
        public List<PresentacionModel> GetAvailablePresentacionesProductos(string accesstoken)
        {
            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
             .SingleOrDefault<sessions>();

            if (sessions == null) return null;
            var account = sessions.account;

            if (account == null) return null;
            var presentacionesList = _session.CreateSQLQuery("CALL sp_sel_presentacion_productos")
             .SetResultTransformer(Transformers.AliasToBean<presentacion_productos>())
             .List<presentacion_productos>()
             .ToList();

            var present = _mappingEngine.Map<List<presentacion_productos>, List<PresentacionModel>>(presentacionesList);

            return present;
        }

        [HttpPost]
        [AcceptVerbs("POST", "HEAD")]
        [POST("guardarPresentacion/{accesstoken}")]
        public RestorePasswordResponseModel guardarPresentacion(string accesstoken, [FromBody] PresentacionModel model)
        {
            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
                .SingleOrDefault<sessions>();

            if (sessions == null) return null;
            var account = sessions.account;

            if (account == null) return null;

            PharmaMethodsExecutor.sp_ins_presentacion_productos(_session,model.nombre,DateTime.Now,DateTime.Now,sessions.account.Email,sessions.account.Email);

            return new RestorePasswordResponseModel()
            {
                Message = "Guardado",
                Status = 2
            };
        }

        [HttpPost]
        [AcceptVerbs("POST", "HEAD")]
        [POST("borrarPresentacion/{accesstoken}")]
        public RestorePasswordResponseModel borrarPresentacion(string accesstoken, [FromBody] PresentacionModel model)
        {
            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
                .SingleOrDefault<sessions>();

            if (sessions == null) return null;
            var account = sessions.account;

            if (account == null) return null;

            PharmaMethodsExecutor.sp_del_presentacion_productos(_session, model.cod_presentacion);

            return new RestorePasswordResponseModel()
            {
                Message = "Borrado",
                Status = 2
            };
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("tipo_transacciones/available/{accesstoken}")]
        public List<TipoTranModel> GetAvailableTipoTransacciones(string accesstoken)
        {
            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
             .SingleOrDefault<sessions>();

            if (sessions == null) return null;
            var account = sessions.account;

            if (account == null) return null;
            var tranList = _session.CreateSQLQuery("CALL sp_sel_tipo_transacciones")
             .SetResultTransformer(Transformers.AliasToBean<tipo_transacciones>())
             .List<tipo_transacciones>()
             .ToList();

            var tran = _mappingEngine.Map<List<tipo_transacciones>, List<TipoTranModel>>(tranList);

            return tran;
        }

        [HttpPost]
        [AcceptVerbs("POST", "HEAD")]
        [POST("guardarTipoTran/{accesstoken}")]
        public RestorePasswordResponseModel guardarTipoTran(string accesstoken, [FromBody] TipoTranModel model)
        {
            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
                .SingleOrDefault<sessions>();

            if (sessions == null) return null;
            var account = sessions.account;

            if (account == null) return null;

            PharmaMethodsExecutor.sp_ins_tipo_transacciones(_session,model.nombre,DateTime.Now,DateTime.Now,
                sessions.account.Email,sessions.account.Email,model.entrada_o_salida);

            return new RestorePasswordResponseModel()
            {
                Message = "Guardado",
                Status = 2
            };
        }

        [HttpPost]
        [AcceptVerbs("POST", "HEAD")]
        [POST("borrarTipoTran/{accesstoken}")]
        public RestorePasswordResponseModel borrarTipoTran(string accesstoken, [FromBody] TipoTranModel model)
        {
            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
                .SingleOrDefault<sessions>();

            if (sessions == null) return null;
            var account = sessions.account;

            if (account == null) return null;

            PharmaMethodsExecutor.sp_del_tipo_transacciones(_session, model.id_tipotran);

            return new RestorePasswordResponseModel()
            {
                Message = "Borrado",
                Status = 2
            };
        }


        [HttpPost]
        [AcceptVerbs("POST", "HEAD")]
        [POST("guardarCliente/{accesstoken}")]
        public RestorePasswordResponseModel guardarCliente(string accesstoken, [FromBody] ClientesModel model)
        {
            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
                .SingleOrDefault<sessions>();

            if (sessions == null) return null;
            var account = sessions.account;

            if (account == null) return null;

            PharmaMethodsExecutor.sp_ins_clientes(_session,model.nombre,DateTime.Now,DateTime.Now,sessions.account.Email,
                sessions.account.Email,model.tipo_cliente.id_tipocliente);

            return new RestorePasswordResponseModel()
            {
                Message = "Guardado",
                Status = 2
            };
        }

        [HttpPost]
        [AcceptVerbs("POST", "HEAD")]
        [POST("borrarCliente/{accesstoken}")]
        public RestorePasswordResponseModel borrarCliente(string accesstoken, [FromBody] ClientesModel model)
        {
            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
                .SingleOrDefault<sessions>();

            if (sessions == null) return null;
            var account = sessions.account;

            if (account == null) return null;

            PharmaMethodsExecutor.sp_del_clientes(_session,model.id_cliente);

            return new RestorePasswordResponseModel()
            {
                Message = "Borrado",
                Status = 2
            };
        }

        [HttpPost]
        [AcceptVerbs("POST", "HEAD")]
        [POST("guardarProveedor/{accesstoken}")]
        public RestorePasswordResponseModel guardarProveedor(string accesstoken, [FromBody] ProveedoresModel model)
        {
            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
                .SingleOrDefault<sessions>();

            if (sessions == null) return null;
            var account = sessions.account;

            if (account == null) return null;

            PharmaMethodsExecutor.sp_ins_proveedores(_session,model.direccion,model.telefono,model.nombre,model.contacto,DateTime.Now,DateTime.Now,
                sessions.account.Email,sessions.account.Email);

            return new RestorePasswordResponseModel()
            {
                Message = "Guardado",
                Status = 2
            };
        }

        [HttpPost]
        [AcceptVerbs("POST", "HEAD")]
        [POST("borrarProveedor/{accesstoken}")]
        public RestorePasswordResponseModel borrarProveedor(string accesstoken, [FromBody] ProveedoresModel model)
        {
            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
                .SingleOrDefault<sessions>();

            if (sessions == null) return null;
            var account = sessions.account;

            if (account == null) return null;

            PharmaMethodsExecutor.sp_del_proveedores(_session, model.id_proveedor);

            return new RestorePasswordResponseModel()
            {
                Message = "Borrado",
                Status = 2
            };
        }

        [HttpPost]
        [AcceptVerbs("POST", "HEAD")]
        [POST("guardarProducto/{accesstoken}")]
        public RestorePasswordResponseModel guardarProducto(string accesstoken, [FromBody] ProductosModel model)
        {
            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
                .SingleOrDefault<sessions>();

            if (sessions == null) return null;
            var account = sessions.account;

            if (account == null) return null;

            PharmaMethodsExecutor.sp_ins_productos(_session,model.cod_prod,0,model.fecha_venc,model.costo,
                PharmaMethodsExecutor.calcular_precio_consumidor(_session,model.costo),
                PharmaMethodsExecutor.calcular_precio_mayorista(_session,model.costo,model.porcentaje_m),
                model.nombre,model.presentacion_productos.cod_presentacion,model.existencia_min,
                model.existencia_max,model.porcentaje_m,DateTime.Now,DateTime.Now,sessions.account.Email,sessions.account.Email);
            return new RestorePasswordResponseModel()
            {
                Message = "Guardado",
                Status = 2
            };
        }


        [HttpPost]
        [AcceptVerbs("POST", "HEAD")]
        [POST("borrarProducto/{accesstoken}")]
        public RestorePasswordResponseModel borrarProducto(string accesstoken, [FromBody] ProductosModel model)
        {
            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
                .SingleOrDefault<sessions>();

            if (sessions == null) return null;
            var account = sessions.account;

            if (account == null) return null;

            PharmaMethodsExecutor.sp_del_productos(_session, model.cod_prod);

            return new RestorePasswordResponseModel()
            {
                Message = "Borrado",
                Status = 2
            };
        }

    }
}