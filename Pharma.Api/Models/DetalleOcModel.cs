using Pharma.Domain.Entities;

namespace Pharma.Api.Models
{
    public class DetalleOcModel
    {
        public int num_detalle { get; set; }



        /// There are no comments for id_ordencompra in the schema.

        public int id_ordencompra { get; set; }



        /// There are no comments for cantidad in the schema.

        public int cantidad { get; set; }



        /// There are no comments for subtotal in the schema.

        public double subtotal { get; set; }



        /// There are no comments for precio_unit in the schema.

        public double precio_unit { get; set; }



        /// There are no comments for cod_prod in the schema.

        public string cod_prod { get; set; }



        /// There are no comments for ordenes_de_compra in the schema.

        public OrdenesCompraModel ordenes_de_compra { get; set; }



        /// There are no comments for productos in the schema.

        public ProductosModel productos { get; set; }
    }
}