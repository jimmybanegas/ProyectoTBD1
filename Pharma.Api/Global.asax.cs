using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using Autofac;
using Autofac.Integration.Mvc;
using Autofac.Integration.WebApi;
using Pharma.Api.Controllers;

namespace Pharma.Api
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class WebApiApplication : HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configuration.Formatters.XmlFormatter.SupportedMediaTypes.Clear();
            BuildContainer();
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        public IContainer BuildContainer()
        {
            var containerBuilder = new ContainerBuilder();
            return
                new Bootstrapper(containerBuilder).WithTask(new ConfigureDependencies(containerBuilder))
                    .WithTask(new ConfigureAutomapper())
                    .WithExampleMvcController<HomeController>()
                    .WithExampleWebApiController<AccountController>()
                    .AndAfterContainerIsBuilt(
                        container =>
                        {
                            GlobalConfiguration.Configuration.DependencyResolver =
                                new AutofacWebApiDependencyResolver(container);
                            DependencyResolver.SetResolver(
                                new AutofacDependencyResolver(container));
                        }).Run();
        }
    }
}