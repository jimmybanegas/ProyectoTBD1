using System;
using System.Collections.Generic;
using System.Threading;
using AcklenAvenue.Data.NHibernate;
using DomainDrivenDatabaseDeployer;
using FluentNHibernate.Cfg.Db;
using NHibernate;
using Pharma.Data;

namespace Pharma.DatabaseDeployer
{
    class Program
    {
        static void Main()
        {

            string connectionString = ConnectionStrings.Get();

            Console.WriteLine(connectionString);

            MySQLConfiguration databaseConfiguration =
                MySQLConfiguration.Standard.ShowSql().ConnectionString(x => x.Is(connectionString));

            DomainDrivenDatabaseDeployer.DatabaseDeployer dd = null;

         /*  ISessionFactory sessionFactory = new SessionFactoryBuilder(new MappingScheme(), databaseConfiguration)
                .Build(cfg =>
                {
                    dd = new DomainDrivenDatabaseDeployer.DatabaseDeployer(cfg);

                });*/

           ISessionFactory sessionFactory = new SessionFactoryBuilder(new MappingScheme(), databaseConfiguration)
              .Build(cfg =>
              {
                  dd = new DomainDrivenDatabaseDeployer.DatabaseDeployer(cfg);

              });
            
            Console.WriteLine("");
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
                                new LeagueSeeder(session),
                                new AccountSeeder(session),
                                new AccountLeaguesSeeder(session)
                            });
                tx.Commit();
            }
            session.Close();
            sessionFactory.Close();
            Console.WriteLine("");
            Console.WriteLine("Seed data added.");
            Thread.Sleep(2000);
        }
    }
}
