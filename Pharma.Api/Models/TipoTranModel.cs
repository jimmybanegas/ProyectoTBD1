using System;
using System.Collections.Generic;
using Pharma.Domain.Entities;

namespace Pharma.Api.Models
{
    public class TipoTranModel
    {
        public int id_tipotran { get; set; }



        /// There are no comments for nombre in the schema.

        public string nombre { get; set; }



        /// There are no comments for fecha_crea in the schema.

        public DateTime fecha_crea { get; set; }



        /// There are no comments for fecha_actu in the schema.

        public DateTime fecha_actu { get; set; }



        /// There are no comments for usuario_crea in the schema.

        public string usuario_crea { get; set; }



        /// There are no comments for usuario_actu in the schema.

        public string usuario_actu { get; set; }



        /// There are no comments for entrada_o_salida in the schema.

        public string entrada_o_salida { get; set; }



        /// There are no comments for ajustes in the schema.

        public ICollection<AjustesModel> ajustes { get; set; }
    }
}