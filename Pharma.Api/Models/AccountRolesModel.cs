using System;

namespace Pharma.Api.Models
{
    public class AccountRolesModel
    {
        public long Id { get; set; }



        /// There are no comments for id_rol in the schema.

        public int id_rol { get; set; }



        /// There are no comments for fecha_crea in the schema.

        public DateTime fecha_crea { get; set; }



        /// There are no comments for fecha_actu in the schema.

        public DateTime fecha_actu { get; set; }



        /// There are no comments for usuario_crea in the schema.

        public string usuario_crea { get; set; }



        /// There are no comments for usuario_actu in the schema.

        public string usuario_actu { get; set; }



        /// There are no comments for account in the schema.

        public AccountModel account { get; set; }



        /// There are no comments for grupos_roles in the schema.

        public RolesModel grupos_roles { get; set; }
    }
}

