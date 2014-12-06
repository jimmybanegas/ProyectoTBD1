using AutoMapper;
using NHibernate.Cfg.MappingSchema;
using Pharma.Api.Models;
using Pharma.Domain.Entities;


namespace Pharma.Api
{
    public class ConfigureAutomapper : IBootstrapperTask
    {
        #region IBootstrapperTask Members

        public void Run()
        {
            //automappings go here
            //Ex: Mapper.CreateMap<SomeType, SomeOtherType>().ReverseMap();
            Mapper.CreateMap<productos,ProductosModel >().ReverseMap();
            Mapper.CreateMap<facturas, FacturasModel>().ReverseMap();
            Mapper.CreateMap<clientes, ClientesModel>().ReverseMap();
            Mapper.CreateMap<account, AccountLoginModel>().ReverseMap();
            Mapper.CreateMap<account, AccountRegisterModel>().ReverseMap();
            Mapper.CreateMap<productos,ProductosModel>().ReverseMap();
            Mapper.CreateMap<contactos_clientes, ContactosClientesModel>().ReverseMap();
            Mapper.CreateMap<detalle_facturas, DetalleFacturasModel>().ReverseMap();
            Mapper.CreateMap<direcciones_clientes, DireccionesClientesModel>().ReverseMap();
            Mapper.CreateMap<sessions, SessionsModel>().ReverseMap();
            Mapper.CreateMap<telefonos_clientes, TelefonosClientesModel>().ReverseMap();
            Mapper.CreateMap<tipo_cliente, TipoClienteModel>().ReverseMap();
            Mapper.CreateMap<proveedores, ProveedoresModel>().ReverseMap();
            Mapper.CreateMap<compras, ComprasModel>().ReverseMap();
            Mapper.CreateMap<cotizaciones, CotizacionesModel>().ReverseMap();
            Mapper.CreateMap<ordenes_de_compra, OrdenesCompraModel>().ReverseMap();
            Mapper.CreateMap<detalle_compras, DetalleComprasModel>().ReverseMap();
            Mapper.CreateMap<detalle_cotizaciones, DetalleCotizacionesModel>().ReverseMap();
            Mapper.CreateMap<detalle_compras, DetalleComprasModel>().ReverseMap();
            Mapper.CreateMap<detalle_oc, DetalleOcModel>().ReverseMap();
            Mapper.CreateMap<presentacion_productos, PresentacionModel>().ReverseMap();
            Mapper.CreateMap<categoria_productos, CategoriasModel>().ReverseMap();
            Mapper.CreateMap<tipo_transacciones, TipoTranModel>().ReverseMap();
            Mapper.CreateMap<ajustes, AjustesModel>().ReverseMap();
            Mapper.CreateMap<detalle_ajustes, DetalleAjustesModel>().ReverseMap();
            Mapper.CreateMap<kardex, KardexModel>().ReverseMap();
            Mapper.CreateMap<account, AccountModel>().ReverseMap();
            Mapper.CreateMap<account_has_grupos_roles, AccountRolesModel>().ReverseMap();
            Mapper.CreateMap<privilegios, PrivilegiosModel>().ReverseMap();
            Mapper.CreateMap<grupos_roles_has_privilegios, PrivilegiosDeRolesModel>().ReverseMap();
            Mapper.CreateMap<grupos_roles, RolesModel>().ReverseMap();
            
        }

        #endregion
    }
}