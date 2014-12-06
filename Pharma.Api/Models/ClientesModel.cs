using System;
using System.Collections.Generic;

namespace Pharma.Api.Models
{
    public class ClientesModel
    {
        public int id_cliente { get; set; }





        public string nombre { get; set; }



        /// There are no comments for fecha_crea in the schema.

        public DateTime? fecha_crea { get; set; }



        /// There are no comments for fecha_actu in the schema.

        public DateTime? fecha_actu { get; set; }



        /// There are no comments for usuario_crea in the schema.

        public string usuario_crea { get; set; }



        /// There are no comments for usuario_actu in the schema.

        public string usuario_actu { get; set; }



        /// There are no comments for id_tipocliente in the schema.

        public int id_tipocliente { get; set; }



        /// There are no comments for tipo_cliente in the schema.

        public TipoClienteModel tipo_cliente { get; set; }



        /// There are no comments for contactos_clientes in the schema.

        public ICollection<ContactosClientesModel> contactos_clientes { get; set; }



        /// There are no comments for direcciones_clientes in the schema.

        public ICollection<DireccionesClientesModel> direcciones_clientes { get; set; }



        /// There are no comments for facturas in the schema.

        public ICollection<FacturasModel> facturas { get; set; }



        /// There are no comments for telefonos_clientes in the schema.

        public ICollection<TelefonosClientesModel> telefonos_clientes { get; set; }
    }
}