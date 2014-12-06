using System;
using System.Collections.Generic;
using Pharma.Domain.Entities;

namespace Pharma.Api.Models
{
    public class AjustesModel
    {
        public int id_ajuste { get; set; }



        /// There are no comments for fecha in the schema.

        public DateTime fecha { get; set; }



        /// There are no comments for cant_producto in the schema.

        public int cant_producto { get; set; }



        /// There are no comments for fecha_crea in the schema.

        public DateTime fecha_crea { get; set; }



        /// There are no comments for fecha_actu in the schema.

        public DateTime fecha_actu { get; set; }



        /// There are no comments for usuario_crea in the schema.

        public string usuario_crea { get; set; }



        /// There are no comments for usuario_actu in the schema.

        public string usuario_actu { get; set; }



        /// There are no comments for id_tipotran in the schema.

        public int id_tipotran { get; set; }



        /// There are no comments for tipo_transacciones in the schema.

        public TipoTranModel tipo_transacciones { get; set; }



        /// There are no comments for detalle_ajustes in the schema.

        public ICollection<DetalleAjustesModel> detalle_ajustes { get; set; }
    }
}