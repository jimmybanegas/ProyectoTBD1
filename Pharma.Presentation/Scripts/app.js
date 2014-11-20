'use strict';

// Declares how the application should be bootstrapped. See: http://docs.angularjs.org/guide/module
angular.module('app', ['ngCookies', 'ui.router', 'app.filters', 'app.services', 'app.directives', 'app.controllers'])

    // Gets executed during the provider registrations and configuration phase. Only providers and constants can be
    // injected here. This is to prevent accidental instantiation of services before they have been fully configured.
    .config([
        '$stateProvider', '$locationProvider', '$httpProvider', function($stateProvider, $locationProvider, $httpProvider) {

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
                .state('about', {
                    url: '/about',
                    templateUrl: '/views/about',
                    controller: 'AboutCtrl'
                })
                .state('login', {
                    url: '/login',
                    layout: 'basic',
                    templateUrl: '/views/login',
                    controller: 'LoginCtrl'
                })
                //ESTADO DE REGISTRO
                .state('register', {
                    url: '/register',
                    layout: 'basic',
                    templateUrl: '/views/register',
                    controller: 'RegisterCtrl'
                })
                //ESTADO DE RECUPERAR LA CLAVE
                .state('ForgotPassword', {
                    url: '/forgot-password',
                    layout: 'basic',
                    templateUrl: '/views/forgot-password',
                    controller: 'ForgotPasswordCtrl'
                })

//Esta es la seccion de los estados para usuario ADMINISTRADOR Acceder a mi perfil
                .state('Profile', {
                    url: '/profile',
                    layout: 'basic',
                    templateUrl: '/views/profile',
                    controller: 'LeagueCtrl'
                })
                //Acceder a la liga
                .state('League', {
                    url: '/league/:id',
                    layout: 'basic',
                    templateUrl: '/views/league',
                    controller: 'LeagueCtrl'
                })
                //Agregar nueva Liga
                .state('NewLeague', {
                    url: '/newLeague',
                    layout: 'basic',
                    templateUrl: '/views/newLeague',
                    controller: 'LeagueCtrl'
                })
                //Editar Liga
                .state('EditLeague', {
                    url: '/editLeague/:id',
                    layout: 'basic',
                    templateUrl: '/views/editLeague',
                    controller: 'LeagueCtrl'
                })
                //Nuevo partido, y editarlo
                .state('Matches', {
                    url: '/matches',
                    layout: 'basic',
                    templateUrl: '/views/matches',
                    controller: 'LeagueCtrl'
                })
                //Ver juegos por liga, listado
                .state('ListMatches', {
                    url: '/listMatches/:id',
                    layout: 'basic',
                    templateUrl: '/views/listMatches',
                    controller: 'LeagueCtrl'
                })


                //Esta es la seccion de los estados para usuario MORTAL 
                .state('ProfileNormal', {
                    url: '/profile-normal',
                    layout: 'basic',
                    templateUrl: '/views/profile-normal',
                    controller: 'LeagueCtrl'
                })
                .state('otherwise', {
                    url: '*path',
                    templateUrl: '/views/404',
                    controller: 'Error404Ctrl'
                });

            $locationProvider.html5Mode(true);

            $httpProvider.interceptors.push(function($q, $location) {
                return {
                    'responseError': function(response) {
                        if (response.status === 401 || response.status === 403) {
                            $location.path('/login');
                        }
                        return $q.reject(response);
                    }
                };
            });

        }
    ])

    // Gets executed after the injector is created and are used to kickstart the application. Only instances and constants
    // can be injected here. This is to prevent further system configuration during application run time.
    .run([
        '$templateCache', '$rootScope', '$state', '$stateParams', 'Auth', function($templateCache, $rootScope, $state, $stateParams, Auth) {

            // <ui-view> contains a pre-rendered template for the current view
            // caching it will prevent a round-trip to a server at the first page load
            var view = angular.element('#ui-view');
            $templateCache.put(view.data('tmpl-url'), view.html());

            // Allows to retrieve UI Router state information from inside templates
            $rootScope.$state = $state;
            $rootScope.$stateParams = $stateParams;

            $rootScope.$on("$stateChangeStart", function(event, toState, toParams, fromState, fromParams) {
                if (!Auth.authorize(toState.data.access)) {
                    $rootScope.error = "Seems like you tried accessing a route you don't have access to...";
                    event.preventDefault();

                    if (fromState.url === '^') {
                        if (Auth.isLoggedIn()) {
                            $state.go('home');
                        } else {
                            $rootScope.error = null;
                            $state.go('login');
                        }
                    }
                }
            });

            $rootScope.$on('$stateChangeSuccess', function(event, toState) {

                // Sets the layout name, which can be used to display different layouts (header, footer etc.)
                // based on which page the user is located
                $rootScope.layout = toState.layout;
            });
        }
    ]);