using System;
using System.Collections.Generic;
using Pharma.Domain.Entities;

namespace Pharma.Api.Models
{
    public class AccountModel
    {
        public long Id { get; set; }



        /// There are no comments for FirstName in the schema.

        public string FirstName { get; set; }



        /// There are no comments for LastName in the schema.

        public string LastName { get; set; }



        /// There are no comments for Email in the schema.

        public string Email { get; set; }



        /// There are no comments for Password in the schema.

        public string Password { get; set; }



        /// There are no comments for EncryptKey in the schema.

        public byte[] EncryptKey { get; set; }



        /// There are no comments for EncryptIV in the schema.

        public byte[] EncryptIV { get; set; }



        /// There are no comments for IsArchived in the schema.

        public bool IsArchived { get; set; }



        /// There are no comments for fecha_crea in the schema.

        public DateTime fecha_crea { get; set; }



        /// There are no comments for fecha_actu in the schema.

        public DateTime fecha_actu { get; set; }



        /// There are no comments for usuario_crea in the schema.

        public string usuario_crea { get; set; }



        /// There are no comments for usuario_actu in the schema.

        public string usuario_actu { get; set; }



        /// There are no comments for account_has_grupos_roles in the schema.

        public ICollection<AccountRolesModel> account_has_grupos_roles { get; set; }



        /// There are no comments for sessions in the schema.

        public ICollection<SessionsModel> sessions { get; set; }
    }
}