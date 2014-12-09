using System;
using System.Collections.Generic;
using Pharma.Domain.Entities;

namespace Pharma.Api.Models
{
    public class FacturasModel
    {
        public int num_factura { get; set; }
        

        /// There are no comments for fecha in the schema.

        public DateTime fecha { get; set; }



        /// There are no comments for subtotal in the schema.

        public double subtotal { get; set; }



        /// There are no comments for isv in the schema.

        public double isv { get; set; }



        /// There are no comments for descuento in the schema.

        public double descuento { get; set; }



        /// There are no comments for total in the schema.

        public double total { get; set; }



        /// There are no comments for fecha_crea in the schema.

        public DateTime fecha_crea { get; set; }



        /// There are no comments for fecha_actu in the schema.

        public DateTime fecha_actu { get; set; }



        /// There are no comments for usuario_crea in the schema.

        public string usuario_crea { get; set; }



        /// There are no comments for usuario_actu in the schema.

        public string usuario_actu { get; set; }



        /// There are no comments for id_cliente in the schema.

        public int id_cliente { get; set; }



        /// There are no comments for clientes in the schema.

        public ClientesModel clientes { get; set; }
        
        /// There are no comments for detalle_facturas in the schema.

        public ICollection<DetalleFacturasModel> detalle_facturas { get; set; }
    }
}