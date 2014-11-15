using System;
using System.Collections.Generic;
using System.Data;
using System.Threading;
using AcklenAvenue.Data.NHibernate;
using DomainDrivenDatabaseDeployer;
using FluentNHibernate.Cfg.Db;
using NHibernate;

namespace Pharma.Infrastructure.DataBaseDeployer
{
    public class Program
    {
        public static void Main(string[] args)
        {
            string connectionString = ConnectionStrings.Get();

            MsSqlConfiguration databaseConfiguration =
                MsSqlConfiguration.MsSql2012.ShowSql().ConnectionString(x => x.Is(connectionString));

            DatabaseDeployer dd = null;
            ISessionFactory sessionFactory = new SessionFactoryBuilder(new MappingScheme(), databaseConfiguration)
                .Build(cfg => { dd = new DatabaseDeployer(cfg); });

            using (ISession sess = sessionFactory.OpenSession())
            {
                using (IDbCommand cmd = sess.Connection.CreateCommand())
                {
                    //three comented lines here :d
                }
            }
            Console.WriteLine(connectionString);
            Console.WriteLine("Database dropped.");
            dd.Drop();
            Thread.Sleep(1000);

            dd.Create();
            Console.WriteLine("");
            Console.WriteLine("Database created.");

            ISession session = sessionFactory.OpenSession();
            using (ITransaction tx = session.BeginTransaction())
            {
                dd.Seed(new List<IDataSeeder>
                {
                    new AccountSeeder(session),
                    new LeagueSeeder(session),
                    new AccountLeagueSeeder(session)
                });
                tx.Commit();
            }
            session.Close();
            sessionFactory.Close();
            Console.WriteLine("");
            Console.WriteLine("Seed data added.");
            Thread.Sleep(2000);
            Console.ReadKey();
        }
    }
}
