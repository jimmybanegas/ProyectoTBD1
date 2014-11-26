'use strict';
angular.module('app.controllers')
    // Path: /
    .controller('HomeCtrl', [
        '$scope', '$location', '$window', 'AccountServices', function ($scope, $location, $window, AccountServices) {
            $scope.$root.title = 'Farmacia La Mejor';

            $scope.hasError = false;
            $scope.errorMessage = '';
            $scope.isLogged = function () {
                return $window.sessionStorage.token != null;
            };

            $scope.loginModel = { Email: '', Password: '' };
            $scope.registerModel = { Email: '', Password: '', FirstName: '', LastName: '', ConfirmPassword: '' };
            $scope.restoreModel = { Email: '' };

            // TODO: Authorize a user
            $scope.login = function () {
                AccountServices
                    .login($scope.loginModel)
                    .success(function (data, status, headers, config) {
                        $window.sessionStorage.token = data.Token;
                        if (data.Status == 0) {
                            toastr.error(data.Token, "Error", {
                                "closeButton": true,
                                "positionClass": "toast-bottom-full-width",
                                "showEasing": "swing",
                                "hideEasing": "swing",
                                "showMethod": "slideDown",
                                "hideMethod": "fadeOut"
                            });
                        }
                        if (data.Status == 2) {
                            toastr.success("", "Bienvenido a Farmacia La Mejor",
                            {
                                "positionClass": "toast-bottom-full-width",
                                "showEasing": "swing",
                                "hideEasing": "swing",
                                "showMethod": "slideDown",
                                "hideMethod": "fadeOut"
                            });
                            $location.path('/loading');
                            $location.path('/organization');
                        }
                    })
                    .error(function (data, status, headers, config) {
                        delete $window.sessionStorage.token;

                        $scope.errorMesage = 'Error o Clave Incorrecta';
                        $scope.hasError = true;
                        $scope.message = 'Error: Invalid User or Password';
                    });
                //$location.path('/');
            };

            $scope.goToRegister = function () {
                $location.path('/register');
            };

            $scope.goToLogin = function () {
                $location.path('/login');

            };

            $scope.register = function () {
                AccountServices
                    .register($scope.registerModel)
                    .success(function (data, status, headers, config) {
                        console.log(data);
                        if (data.Status == 0) {
                            toastr.error(data.Message, "Error", {
                                "closeButton": true,
                                "positionClass": "toast-bottom-full-width",
                                "showEasing": "swing",
                                "hideEasing": "swing",
                                "showMethod": "slideDown",
                                "hideMethod": "fadeOut"
                            });
                        }
                        if (data.Status == 1) {
                            toastr.warning(data.Message);
                        }
                        if (data.Status == 2) {
                            toastr.success(data.Message);
                            $location.path('/loading');
                            $scope.goToLogin();
                        }
                    })
                    .error(function (data, status, headers, config) {
                        console.log(data);
                    });
            };

            $scope.restorePassword = function () {
                AccountServices.restorePassword($scope.restoreModel)
                    .success(function (data, status, headers, config) {
                        console.log(data);
                        if (data.Status == 1) {
                            toastr.warning(data.Message, { "closeButton": true, });
                        }
                        if (data.Status == 2) {
                            toastr.success(data.Message);
                            $location.path('/loading');
                            $scope.goToLogin();
                        }
                    })
                    .error(function (data, status, headers, config) {
                        console.log(data);
                    });

            };

            $scope.$on('$viewContentLoaded', function() {
                $window.ga('send', 'pageview', { 'page': $location.path(), 'title': $scope.$root.title });
            });
        }
    ]);
