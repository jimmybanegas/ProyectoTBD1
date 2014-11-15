using DomainDrivenDatabaseDeployer;
using NHibernate;
using Pharma.Domain.Entities;

namespace Pharma.Infrastructure.DataBaseDeployer
{
    public class AccountLeagueSeeder : IDataSeeder
    {

        private readonly ISession _session;

        public AccountLeagueSeeder(ISession session)
        {
            _session = session;
        }

        public void Seed()
        {
            var accountLeague = new AccountLeague
            {
                User =
                    _session.QueryOver<Account>()
                        .Where(x => x.Email == "admin@jcespinoza.com")
                        .SingleOrDefault<Account>(),
                League = _session.QueryOver<League>().Where(x => x.Name == "Spanish La Liga").SingleOrDefault<League>()
            };
            _session.Save(accountLeague);
        }
    }
}
