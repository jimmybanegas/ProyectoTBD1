using System.Reflection;
using Autofac;
using AutoMapper;
using Pharma.Application.API.App_Start;

namespace Pharma.Application.API
{
    public class ConfigureDependencies : IBootstrapperTask
    {
        readonly ContainerBuilder _containerBuilder;
        public ConfigureDependencies(ContainerBuilder containerBuilder)
        {
            _containerBuilder = containerBuilder;
        }

        public void Run()
        {
            Assembly data = Assembly.Load("GuessItSoccer.Data");
            Assembly domain = Assembly.Load("GuessItSoccer.Domain");

            _containerBuilder
                .RegisterAssemblyTypes(data, domain)
                .AsImplementedInterfaces();
            _containerBuilder.Register(c => Mapper.Engine).As<IMappingEngine>();
        }
    }
}