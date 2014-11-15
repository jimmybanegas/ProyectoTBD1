using System.Web.Http;
using System.Web.Mvc;
using Autofac;
using Autofac.Integration.Mvc;
using Autofac.Integration.WebApi;
using Pharma.Application.API.Controllers;

namespace Pharma.Application.API
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class WebApiApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            GlobalConfiguration.Configuration.Formatters.XmlFormatter.SupportedMediaTypes.Clear();
            GlobalConfiguration.Configuration.Formatters.JsonFormatter.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore;
            //WebApiConfig.Register(GlobalConfiguration.Configuration);
            //FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            //RouteConfig.RegisterRoutes(RouteTable.Routes);
            //BundleConfig.RegisterBundles(BundleTable.Bundles);

            BuildContainer();
        }

        public IContainer BuildContainer()
        {
            var containerBuilder = new ContainerBuilder();
            return new Bootstrapper(containerBuilder).WithTask(new ConfigureDependencies(containerBuilder))
                .WithTask(new ConfigureAutomapper())
                .WithExampleMvcController<HomeController>()
                .WithExampleWebApiController<AccountController>()
                .AndAfterContainerIsBuilt(container =>
                {
                    GlobalConfiguration.Configuration.DependencyResolver = new AutofacWebApiDependencyResolver(container);
                    DependencyResolver.SetResolver(new AutofacDependencyResolver(container));
                }).Run();
        }
    }
}