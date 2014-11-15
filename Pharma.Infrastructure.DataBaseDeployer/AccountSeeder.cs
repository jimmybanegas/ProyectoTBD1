using DomainDrivenDatabaseDeployer;
using NHibernate;
using Pharma.Domain.Entities;
using Pharma.Domain.Services;

namespace Pharma.Infrastructure.DataBaseDeployer
{
    public class AccountSeeder : IDataSeeder
    {
        private readonly ISession _session;

        public AccountSeeder(ISession session)
        {
            _session = session;
        }

        public void Seed()
        {
            IEncryption encrypter = new Sha256Encrypter();
            var account = new Account
            {
                IsArchived = false,
                Email = "admin@jcespinoza.com",
                Name = "Juan Carlos Espinoza",
                Password = encrypter.Encrypt("secretPassword"),
                Role = "admin"
            };
            _session.Save(account);

            var account2 = new Account
            {
                IsArchived = false,
                Email = "jcespinozahz@live.com",
                Name = "Juan Carlos Espinoza",
                Password = encrypter.Encrypt("secretPassword"),
                Role = "user"
            };
            _session.Save(account2);
        }
    }
}
