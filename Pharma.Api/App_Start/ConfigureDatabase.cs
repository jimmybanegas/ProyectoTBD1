using AcklenAvenue.Data.NHibernate;
using Autofac;
using FluentNHibernate.Cfg.Db;
using NHibernate;
using PrediLiga.Data;

namespace Pharma.Api
{
    public class ConfigureDatabase : IBootstrapperTask
    {
        readonly ContainerBuilder container;

        public ConfigureDatabase(ContainerBuilder containerBuilder)
        {
            container = containerBuilder;
        }

        #region IBootstrapperTask Members

        public void Run()
        {
            MsSqlConfiguration databaseConfiguration = MsSqlConfiguration.MsSql2008.ShowSql().
                ConnectionString(x => x.Is(ConnectionStrings.Get()));

            container.Register(c => { return c.Resolve<ISessionFactory>().OpenSession(); }).As
                <ISession>()
                .InstancePerLifetimeScope()
                .OnActivating(c =>
                                  {
                                      if (!c.Instance.Transaction.IsActive)
                                          c.Instance.BeginTransaction();
                                  }
                )
                .OnRelease(c =>
                               {
                                   if (c.Transaction.IsActive)
                                   {
                                       c.Transaction.Commit();
                                   }
                                   c.Dispose();
                               });

            container.Register(c =>
                               new SessionFactoryBuilder(new MappingScheme(), databaseConfiguration).Build())
                .SingleInstance()
                .As<ISessionFactory>();
        }

        #endregion
    }
}