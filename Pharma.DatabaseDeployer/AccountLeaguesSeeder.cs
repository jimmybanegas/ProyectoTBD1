using DomainDrivenDatabaseDeployer;
using NHibernate;

namespace Pharma.DatabaseDeployer
{
    public class AccountLeaguesSeeder : IDataSeeder
    {
        private readonly ISession _session;

        public AccountLeaguesSeeder(ISession session)
        {
            _session = session;
        }

        public void Seed()
        {
            /*  var accountLeague = new AccountLeagues
            {
                User = _session.QueryOver<Account>().Where(x => x.Email == "test@test.com").SingleOrDefault<Account>(),
                League = _session.QueryOver<Leagues>().Where(x => x.Name == "Liga BBVA").SingleOrDefault<Leagues>()
            };
            _session.Save(accountLeague);*/
        }
    }
}