using DomainDrivenDatabaseDeployer;
using NHibernate;
using Pharma.Domain.Entities;

namespace Pharma.DatabaseDeployer
{
    public class LeagueSeeder : IDataSeeder
    {
        readonly ISession _session;

        public LeagueSeeder(ISession session)
        {
            _session = session;
        }

        public void Seed()
        {
            /*
            var ligaItaliana = new Leagues
            {
                Name = "Seria A"
            };

            _session.Save(ligaItaliana);
             * */
        }
    }
}