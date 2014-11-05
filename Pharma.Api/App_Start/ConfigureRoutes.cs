using System;
using System.Web.Http;
using System.Web.Routing;
using AttributeRouting.Web.Http.WebHost;
using AttributeRouting.Web.Mvc;

namespace Pharma.Api
{
    public class ConfigureRoutes : IBootstrapperTask
    {
        Type _mvcControllerExample;
        Type _webApiControllerExample;

        #region IBootstrapperTask Members

        public void Run()
        {
            HttpRouteCollection httpRouteCollection = GlobalConfiguration.Configuration.Routes;
            httpRouteCollection.Clear();

            RouteCollection routeCollection = RouteTable.Routes;
            routeCollection.Clear();

            if (_webApiControllerExample != null)
                RegisterWebApi(httpRouteCollection);

            if (_mvcControllerExample != null)
                RegisterMvc(routeCollection);
        }

        #endregion

        public ConfigureRoutes WithExampleMvcController(Type controllerType)
        {
            _mvcControllerExample = controllerType;
            return this;
        }

        public ConfigureRoutes WithExampleWebApiController(Type controllerType)
        {
            _webApiControllerExample = controllerType;
            return this;
        }

        void RegisterMvc(RouteCollection routes)
        {
            routes.MapAttributeRoutes(c => c.AddRoutesFromAssembly(_mvcControllerExample.Assembly));
        }

        void RegisterWebApi(HttpRouteCollection routes)
        {
            routes.MapHttpAttributeRoutes(c => c.AddRoutesFromAssembly(_webApiControllerExample.Assembly));
        }
    }
}