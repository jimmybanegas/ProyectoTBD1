using System;
using Pharma.Domain.Entities;

namespace Pharma.Api.Models
{
    public class TelefonosClientesModel
    {
        public int id_telefonosclientes { get; set; }



        /// There are no comments for id_cliente in the schema.

        public int id_cliente { get; set; }



        /// There are no comments for numero_tel in the schema.

        public string numero_tel { get; set; }



        /// There are no comments for fecha_crea in the schema.

        public DateTime fecha_crea { get; set; }



        /// There are no comments for fecha_actu in the schema.

        public DateTime fecha_actu { get; set; }



        /// There are no comments for usuario_crea in the schema.

        public string usuario_crea { get; set; }



        /// There are no comments for usuario_actu in the schema.

        public string usuario_actu { get; set; }



        /// There are no comments for clientes in the schema.

        public ClientesModel clientes { get; set; }
    }
}