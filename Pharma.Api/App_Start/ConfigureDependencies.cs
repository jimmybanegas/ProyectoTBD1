using System.Reflection;
using Autofac;
using AutoMapper;
using PrediLiga.Data;
using PrediLiga.Domain.Services;

namespace Pharma.Api
{
    public class ConfigureDependencies : IBootstrapperTask
    {
        readonly ContainerBuilder _containerBuilder;

        public ConfigureDependencies(ContainerBuilder containerBuilder)
        {
            _containerBuilder = containerBuilder;
        }

        #region IBootstrapperTask Members

        public void Run()
        {
            Assembly data = Assembly.Load("PrediLiga.Data");
            Assembly domain = Assembly.Load("PrediLiga.Domain");

            _containerBuilder
                .RegisterAssemblyTypes(data, domain)
                .AsImplementedInterfaces();
            _containerBuilder.Register(c => Mapper.Engine).As<IMappingEngine>();

        }

        #endregion
    }
}