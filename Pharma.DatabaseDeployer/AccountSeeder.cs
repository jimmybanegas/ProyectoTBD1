using DomainDrivenDatabaseDeployer;
using NHibernate;

namespace Pharma.DatabaseDeployer
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
            /* var account = new Account
            {
                Email = "test@test.com",
                Name = "Test Name",
                Password = "password",
            };
            _session.Save(account);*/
        }
    }
}