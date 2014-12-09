using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Http;
using AttributeRouting.Web.Mvc;
using AutoMapper;
using FluentNHibernate.Testing.Values;
using NHibernate;
using NHibernate.Impl;
using NHibernate.Mapping;
using NHibernate.Transform;
using Pharma.Api.Models;
using Pharma.Domain.Entities;
using Pharma.Domain.Services;

namespace Pharma.Api.Controllers
{
    public class FacturacionController : ApiController
    {
        private readonly IReadOnlyRepository _readOnlyRepository;
        private readonly IWriteOnlyRepository _writeOnlyRepository;
        private readonly IMappingEngine _mappingEngine;
        private readonly ISession _session;

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
        [GET("productos/available/{accesstoken}")]
        public List<ProductosModel> GetAvailableProducts(string accesstoken)
        {

            var sessions =
                _session.QueryOver<sessions>()
                    .Where(c => c.Token == accesstoken)
                    .And(c => c.ExpirationTime >= DateTime.Now)
                    .SingleOrDefault<sessions>();

            if (sessions == null) return null;
            var account = sessions.account;

            if (account == null) return null;
            var productsList = _session.CreateSQLQuery("CALL sp_sel_productos")
                .SetResultTransformer(Transformers.AliasToBean<productos>())
                .List<productos>()
                .ToList();

            /*foreach (var productose in productsList)
            {
                var productose1 = productose;
                productose.presentacion_productos = _session.QueryOver<presentacion_productos>()
                    .Where(c => c.cod_presentacion == productose1.cod_presentacion)
                    .SingleOrDefault<presentacion_productos>();
            }*/

            var prod = _mappingEngine.Map<List<productos>, List<ProductosModel>>(productsList);

            return prod;
        }


        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("clientes/available/{accesstoken}")]
        public List<ClientesModel> GetAvailableClientes(string accesstoken)
        {
            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
                .SingleOrDefault<sessions>();

            if (sessions == null) return null;
            var account = sessions.account;

            if (account == null) return null;
            var clientesList = _session.CreateSQLQuery("CALL sp_sel_clientes")
                .SetResultTransformer(Transformers.AliasToBean<clientes>())
                .List<clientes>()
                .ToList();

            foreach (var cliente in clientesList)
            {
                var cliente1 = cliente;
                cliente.tipo_cliente = _session.QueryOver<tipo_cliente>()
                    .Where(c => c.id_tipocliente == cliente1.id_tipocliente)
                    .SingleOrDefault<tipo_cliente>();
            }

            var client = _mappingEngine.Map<List<clientes>, List<ClientesModel>>(clientesList);

            return client;
        }

        [HttpPost]
        [AcceptVerbs("POST", "HEAD")]
        [POST("guardarFactura/{accesstoken}")]
        public RestorePasswordResponseModel guardarFactura(string accesstoken, [FromBody] FacturasModel model)
        {
            var sessions = _session.QueryOver<sessions>().Where(c => c.Token == accesstoken)
                .SingleOrDefault<sessions>();

            if (sessions == null) return null;
            var account = sessions.account;

            if (account == null) return null;

            var lista = PharmaMethodsExecutor.sp_ins_facturas(_session, model.fecha, model.subtotal, model.isv,
                model.descuento, model.total,DateTime.Now, DateTime.Now, sessions.account.Email, 
                sessions.account.Email, model.clientes.id_cliente);



            var sql = @"SELECT factura FROM last_number";

            IQuery sqlQuery = _session.CreateSQLQuery(sql);
                                          
                                        var list = sqlQuery.List(); //or if simple scalar query.UniqueResult<int>();

            foreach (var al in list)
            {
                Console.WriteLine(al);
            }
            
            
          //  var fact = _mappingEngine.Map<FacturasModel, facturas>(model);

          //  var factura = _session.Save(fact);

          //  if(factura!=null)
         
            return new RestorePasswordResponseModel()
                        {
                            Message = "Grabada",
                            Status = 2
                        };
                    }

                }
            }