using Pharma.Domain.Entities;

namespace Pharma.Api.Models
{
    public class DetalleFacturasModel
    {
        public int num_detalle { get; set; }



        /// There are no comments for num_factura in the schema.

        public int num_factura { get; set; }



        /// There are no comments for precio_venta in the schema.

        public double precio_venta { get; set; }



        /// There are no comments for cantidad in the schema.

        public int cantidad { get; set; }



        /// There are no comments for subtotal in the schema.

        public double subtotal { get; set; }



        /// There are no comments for cod_prod in the schema.

        public string cod_prod { get; set; }



        /// There are no comments for facturas in the schema.

        public FacturasModel facturas { get; set; }



        /// There are no comments for productos in the schema.

        public ProductosModel productos { get; set; }
    }
}