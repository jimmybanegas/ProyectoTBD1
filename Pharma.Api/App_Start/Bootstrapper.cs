using System;
using System.Collections.Generic;
using Autofac;

namespace Pharma.Api
{
    public class Bootstrapper
    {
        readonly ContainerBuilder _containerBuilder;
        readonly List<IBootstrapperTask> _tasks = new List<IBootstrapperTask>();
        Type _mvcControllerExample;
        Type _webApiControllerExample;
        Action<ILifetimeScope> _doAfterContainerIsBuilt;

        public Bootstrapper(ContainerBuilder containerBuilder)
        {
            _containerBuilder = containerBuilder;
        }

        public Bootstrapper WithTask(IBootstrapperTask task)
        {
            _tasks.Add(task);
            return this;
        }

        public Bootstrapper WithExampleMvcController<T>()
        {
            _mvcControllerExample = typeof(T);
            return this;
        }

        public Bootstrapper WithExampleWebApiController<T>()
        {
            _webApiControllerExample = typeof(T);
            return this;
        }

        public IContainer Run()
        {
            if (_mvcControllerExample == null)
                throw new ArgumentException("Please set the MVC Controller Example.");

            if (_webApiControllerExample == null)
                throw new ArgumentException("Please set the WebApi Controller Example.");

            var bootstrapperTasks = new List<IBootstrapperTask>
                                        {   
                                            new ConfigureThisWebApplication(_containerBuilder).WithExampleMvcController(_mvcControllerExample).WithExampleWebApiController(_webApiControllerExample),
                                            new ConfigureRoutes().WithExampleMvcController(_mvcControllerExample).WithExampleWebApiController(_webApiControllerExample),
                                            new ConfigureDatabase(_containerBuilder),
                                        };

            bootstrapperTasks.AddRange(_tasks);
            bootstrapperTasks.ForEach(x => x.Run());
            return BuildContainer();
        }

        IContainer BuildContainer()
        {
            IContainer container = _containerBuilder.Build();
            if (_doAfterContainerIsBuilt != null) _doAfterContainerIsBuilt(container);
            return container;
        }

        public Bootstrapper AndAfterContainerIsBuilt(Action<ILifetimeScope> doThis)
        {
            _doAfterContainerIsBuilt = doThis;
            return this;
        }
    }
}