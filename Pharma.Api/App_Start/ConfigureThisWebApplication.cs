using System;
using Autofac;
using Autofac.Integration.Mvc;
using Autofac.Integration.WebApi;

namespace Pharma.Api
{
    public class ConfigureThisWebApplication : IBootstrapperTask
    {
        private readonly ContainerBuilder _containerBuilder;
        private Type _mvcControllerExample;
        private Type _webApiControllerExample;

        public ConfigureThisWebApplication(ContainerBuilder containerBuilder)
        {
            _containerBuilder = containerBuilder;
        }

        #region IBootstrapperTask Members

        public void Run()
        {
            if (_webApiControllerExample != null)
                _containerBuilder.RegisterApiControllers(_webApiControllerExample.Assembly);

            if (_mvcControllerExample != null)
                _containerBuilder.RegisterControllers(_mvcControllerExample.Assembly);
        }

        #endregion

        public ConfigureThisWebApplication WithExampleMvcController(Type controllerType)
        {
            _mvcControllerExample = controllerType;
            return this;
        }

        public ConfigureThisWebApplication WithExampleWebApiController(Type controllerType)
        {
            _webApiControllerExample = controllerType;
            return this;
        }
    }
}