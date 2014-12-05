// --------------------------------------------------------------------------------------------------------------------
// <copyright file="BundleConfig.cs" company="">
//   Copyright © 2014 
// </copyright>
// --------------------------------------------------------------------------------------------------------------------

using System.Web.Optimization;

namespace Pharma.Presentation
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new StyleBundle("~/content/css/app").Include("~/content/app.css", "~/content/toastr.css", "~/content/bootstrap.css"));

            bundles.Add(new ScriptBundle("~/js/jquery").Include("~/scripts/vendor/jquery-{version}.js"));

           /*   bundles.Add(new ScriptBundle("~/js/vendors").Include(
                 "~/scripts/vendor/jquery-2.0.3.js",
                 "~/scripts/vendor/angular.js"))¨*/

            bundles.Add(new ScriptBundle("~/js/app").Include(
                "~/scripts/vendor/jquery-2.0.3.js",
                "~/scripts/vendor/angular.js",
                "~/scripts/vendor/angular-ui-router.js",
                "~/scripts/vendor/bootstrap.js",
                "~/scripts/vendor/bootstrap.min.js",
                "~/scripts/vendor/jquery.easing.min.js",
                "~/scripts/filters.js",
                "~/scripts/services.js",
                 "~/scripts/services/AuthService.js",
                "~/scripts/services/AccountService.js",
                "~/scripts/services/LeaguesService.js",
                "~/scripts/services/ServerService.js",
                "~/scripts/services/ComprasService.js",
                "~/scripts/services/FacturacionService.js",
                "~/scripts/services/InventariosService.js",
                "~/scripts/services/ParametrosService.js",
                "~/scripts/services/SistemaService.js",
                "~/scripts/directives.js",
                "~/scripts/controllers.js",
                "~/scripts/controllers/AboutController.js",
                "~/scripts/controllers/ComprasController.js",
                "~/scripts/controllers/Error404Controller.js",
                "~/scripts/controllers/FacturacionController.js",
                "~/scripts/controllers/ForgotPasswordController.js",
                "~/scripts/controllers/HomeController.js",
                "~/scripts/controllers/InventariosController.js",
                "~/scripts/controllers/ParametrosController.js",
                "~/scripts/controllers/RegisterController.js",
                "~/scripts/controllers/SistemaController.js",
                "~/scripts/toastr.js",
                "~/scripts/toastr.min.js",
                "~/scripts/app.js"));
        }
    }
}