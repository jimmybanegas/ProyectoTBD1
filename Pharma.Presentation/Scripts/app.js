'use strict';

// Declares how the application should be bootstrapped. See: http://docs.angularjs.org/guide/module
angular.module('app', ['ngCookies', 'ui.router', 'app.filters', 'app.services', 'app.directives', 'app.controllers'])

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

    //      var access = routingConfig.accessLevels;

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
                .state('ForgotPassword', {
                        url: '/forgot-password',
                        layout: 'basic',
                        templateUrl: '/views/forgot-password',
                        controller: 'ForgotPasswordCtrl'
                })
                .state('Facturacion', {
                       url: '/facturacion',
                       layout: 'basic',
                       templateUrl: '/views/facturacion',
                       controller: 'FacturacionCtrl'
                })
                .state('Facturar', {
                     url: '/facturar',
                     layout: 'basic',
                     templateUrl: '/views/factur',
                     controller: 'FacturacionCtrl'
                 })
                .state('Compras', {
                       url: '/compras',
                       layout: 'basic',
                       templateUrl: '/views/compras',
                       controller: 'ComprasCtrl'
                })
                .state('Inventarios', {
                      url: '/inventarios',
                      layout: 'basic',
                      templateUrl: '/views/inventarios',
                      controller: 'InventariosCtrl'
                })
                .state('Parametros', {
                     url: '/parametros',
                     layout: 'basic',
                     templateUrl: '/views/parametros',
                     controller: 'ParametrosCtrl'
                })
                .state('Sistema', {
                     url: '/compras',
                     layout: 'basic',
                     templateUrl: '/views/sistema',
                     controller: 'SistemaCtrl'
                 })
                .state('otherwise', {
                    url: '*path',
                    templateUrl: '/views/404',
                    controller: 'Error404Ctrl'
                });


            $locationProvider.html5Mode(true);

           /* $httpProvider.interceptors.push(function ($q, $location) {
                return {
                    'responseError': function (response) {
                        if (response.status === 401 || response.status === 403) {
                            $location.path('/');
                        }
                        return $q.reject(response);
                    }
                };
            });*/

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
