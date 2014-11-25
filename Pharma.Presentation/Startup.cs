// --------------------------------------------------------------------------------------------------------------------
// <copyright file="Startup.cs" company="">
//   Copyright © 2014 
// </copyright>
// --------------------------------------------------------------------------------------------------------------------

using Microsoft.Owin;
using Owin;
using Pharma.Presentation;

[assembly: OwinStartup(typeof(Startup))]

namespace Pharma.Presentation
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            //// For more information on how to configure your application, visit:
            //// http://go.microsoft.com/fwlink/?LinkID=316888

            ConfigureAuth(app);
        }
    }
}