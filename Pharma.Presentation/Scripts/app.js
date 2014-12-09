'use strict';

// Declares how the application should be bootstrapped. See: http://docs.angularjs.org/guide/module
angular.module('app', ['ui.router', 'app.filters', 'app.services', 'app.directives', 'app.controllers'])

    // Gets executed during the provider registrations and configuration phase. Only providers and constants can be
    // injected here. This is to prevent accidental instantiation of services before they have been fully configured.
      .config(['$stateProvider', '$locationProvider', '$httpProvider', function ($stateProvider, $locationProvider, $httpProvider) {

          // UI States, URL Routing & Mapping. For more info see: https://github.com/angular-ui/ui-router
          // ------------------------------------------------------------------------------------------------------------

          $httpProvider.defaults.headers.common = { 'Content-Type': 'application/json' };
          $httpProvider.defaults.headers.post = { 'Content-Type': 'application/json' };
          $httpProvider.defaults.headers.put = { 'Content-Type': 'application/json' };
          $httpProvider.defaults.headers.patch = { 'Content-Type': 'application/json' };
          $httpProvider.defaults.headers.get = { 'Content-Type': 'application/json' };


            $stateProvider
                .state('home', {
                    url: '/',
                    templateUrl: '/views/index',
                    controller: 'HomeCtrl'

                })
                .state('Register', {
                    url: '/register',
                    templateUrl: '/views/register',
                    controller: 'HomeCtrl'

                })
                .state('about', {
                    url: '/about',
                    templateUrl: '/views/about',
                    controller: 'AboutCtrl'
                })
              .state('Facturacion', {
                       url: '/facturacion',
                       layout: 'basic',
                       templateUrl: '/views/facturacion/facturacion',
                       controller: 'FacturacionCtrl'
                })
                .state('Facturar', {
                     url: '/facturar',
                     layout: 'basic',
                     templateUrl: '/views/facturacion/facturar',
                     controller: 'FacturacionCtrl'
                 })
                .state('Compras', {
                       url: '/compras',
                       layout: 'basic',
                       templateUrl: '/views/compras/compras',
                       controller: 'ComprasCtrl'
                })
                .state('IngresarCotizacion', {
                    url: '/ingresarcotizacion',
                    layout: 'basic',
                    templateUrl: '/views/compras/ingresarcotizacion',
                    controller: 'ComprasCtrl'
                })
                .state('Inventarios', {
                      url: '/inventarios',
                      layout: 'basic',
                      templateUrl: '/views/inventarios/inventarios',
                      controller: 'InventariosCtrl'
                })
                 .state('IngresarAjuste', {
                     url: '/ingresarajuste',
                     layout: 'basic',
                     templateUrl: '/views/inventarios/ingresarajuste',
                     controller: 'InventariosCtrl'
                 })
                  .state('VerAjustes', {
                      url: '/verajustes',
                      layout: 'basic',
                      templateUrl: '/views/inventarios/verajustes',
                      controller: 'InventariosCtrl'
                  })
                 .state('VerKardex', {
                     url: '/verkardex',
                     layout: 'basic',
                     templateUrl: '/views/inventarios/verkardex',
                     controller: 'InventariosCtrl'
                 })
                .state('Parametros', {
                     url: '/parametros',
                     layout: 'basic',
                     templateUrl: '/views/parametros/parametros',
                     controller: 'ParametrosCtrl'
                })
                 .state('Clientes', {
                     url: '/clientes',
                     layout: 'basic',
                     templateUrl: '/views/parametros/clientes',
                     controller: 'ParametrosCtrl'
                 })
                 .state('Proveedores', {
                     url: '/proveedores',
                     layout: 'basic',
                     templateUrl: '/views/parametros/proveedores',
                     controller: 'ParametrosCtrl'
                 })
                 .state('Productos', {
                     url: '/productos',
                     layout: 'basic',
                     templateUrl: '/views/parametros/productos',
                     controller: 'ParametrosCtrl'
                 })
                 .state('CategoriasProductos', {
                     url: '/categorias',
                     layout: 'basic',
                     templateUrl: '/views/parametros/categorias',
                     controller: 'ParametrosCtrl'
                 })
                 .state('TiposProductos', {
                     url: '/tiposproductos',
                     layout: 'basic',
                     templateUrl: '/views/parametros/tiposproductos',
                     controller: 'ParametrosCtrl'
                 })
                .state('Sistema', {
                     url: '/sistema',
                     layout: 'basic',
                     templateUrl: '/views/sistema/sistema',
                     controller: 'SistemaCtrl'
                })
                 .state('Usuarios', {
                     url: '/usuarios',
                     layout: 'basic',
                     templateUrl: '/views/sistema/usuarios',
                     controller: 'SistemaCtrl'
                 })
                 .state('Roles', {
                     url: '/roles',
                     layout: 'basic',
                     templateUrl: '/views/sistema/roles',
                     controller: 'SistemaCtrl'
                 })
                 .state('Privilegios', {
                     url: '/privilegios',
                     layout: 'basic',
                     templateUrl: '/views/sistema/privilegios',
                     controller: 'SistemaCtrl'
                 })
                 .state('Permisos', {
                     url: '/permisos',
                     layout: 'basic',
                     templateUrl: '/views/sistema/permisos',
                     controller: 'SistemaCtrl'
                 })

                .state('otherwise', {
                    url: '*path',
                    templateUrl: '/views/404',
                    controller: 'Error404Ctrl'
                });
          
            $locationProvider.html5Mode(true);

        }
    ])

     // Gets executed after the injector is created and are used to kickstart the application. Only instances and constants
    // can be injected here. This is to prevent further system configuration during application run time.
    .run(['$templateCache', '$rootScope', '$state', '$stateParams', function ($templateCache, $rootScope, $state, $stateParams) {

        // <ui-view> contains a pre-rendered template for the current view
        // caching it will prevent a round-trip to a server at the first page load
        var view = angular.element('#ui-view');
        $templateCache.put(view.data('tmpl-url'), view.html());

        // Allows to retrieve UI Router state information from inside templates
        $rootScope.$state = $state;
        $rootScope.$stateParams = $stateParams;

        $rootScope.$on('$stateChangeSuccess', function (event, toState) {

            // Sets the layout name, which can be used to display different layouts (header, footer etc.)
            // based on which page the user is located
            $rootScope.layout = toState.layout;
        });
    }]);
