using System;
using Pharma.Domain.Entities;

namespace Pharma.Api.Models
{
    public class PrivilegiosDeRolesModel
    {
        public int id_rol { get; set; }



        /// There are no comments for id_privilegio in the schema.

        public int id_privilegio { get; set; }



        /// There are no comments for fecha_crea in the schema.

        public DateTime fecha_crea { get; set; }



        /// There are no comments for fecha_actu in the schema.

        public DateTime fecha_actu { get; set; }



        /// There are no comments for usuario_crea in the schema.

        public string usuario_crea { get; set; }



        /// There are no comments for usuario_actu in the schema.

        public string usuario_actu { get; set; }



        /// There are no comments for grupos_roles in the schema.

        public RolesModel grupos_roles { get; set; }



        /// There are no comments for privilegios in the schema.

        public PrivilegiosModel privilegios { get; set; }
    }
}