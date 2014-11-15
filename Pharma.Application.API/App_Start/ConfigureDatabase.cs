using AcklenAvenue.Data.NHibernate;
using Autofac;
using FluentNHibernate.Cfg.Db;
using Pharma.Application.API.App_Start;
using NHibernate;
using Pharma.Infrastructure;

namespace Pharma.Application.API
{
    public class ConfigureDatabase : IBootstrapperTask
    {
        private readonly ContainerBuilder container;

        public ConfigureDatabase(ContainerBuilder containerBuilder)
        {
            container = containerBuilder;
        }

        public void Run()
        {
            MsSqlConfiguration databaseConfiguration =
                MsSqlConfiguration.MsSql2012.ShowSql().ConnectionString(x => x.Is(ConnectionStrings.Get()));

            container.Register(c => { return c.Resolve<ISessionFactory>().OpenSession(); }).As<ISession>()
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
            container.Register(c => new SessionFactoryBuilder(new MappingScheme(), databaseConfiguration).Build())
                .SingleInstance()
                .As<ISessionFactory>();
        }
    }
}