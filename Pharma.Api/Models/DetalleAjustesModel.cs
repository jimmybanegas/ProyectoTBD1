using Pharma.Domain.Entities;

namespace Pharma.Api.Models
{
    public class DetalleAjustesModel
    {
        public int num_detalle { get; set; }



        /// There are no comments for id_ajuste in the schema.

        public int id_ajuste { get; set; }



        /// There are no comments for cantidad in the schema.

        public int cantidad { get; set; }



        /// There are no comments for cod_prod in the schema.

        public string cod_prod { get; set; }



        /// There are no comments for ajustes in the schema.

        public AjustesModel ajustes { get; set; }



        /// There are no comments for productos in the schema.

        public ProductosModel productos { get; set; }
    }
}