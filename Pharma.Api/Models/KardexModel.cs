using System;

namespace Pharma.Api.Models
{
    public class KardexModel
    {
        public int id_operacion { get; set; }



        /// There are no comments for cantidad in the schema.

        public int cantidad { get; set; }



        /// There are no comments for costo in the schema.

        public double costo { get; set; }



        /// There are no comments for inv_antes in the schema.

        public int inv_antes { get; set; }



        /// There are no comments for inv_despues in the schema.

        public int inv_despues { get; set; }



        /// There are no comments for fecha_crea in the schema.

        public DateTime fecha_crea { get; set; }



        /// There are no comments for usuario_crea in the schema.

        public string usuario_crea { get; set; }



        /// There are no comments for precio in the schema.

        public double precio { get; set; }



        /// There are no comments for cod_prod in the schema.

        public string cod_prod { get; set; }



        /// There are no comments for entrada_o_salida in the schema.

        public string entrada_o_salida { get; set; }



        /// There are no comments for productos in the schema.

        public ProductosModel productos { get; set; }
    }
}