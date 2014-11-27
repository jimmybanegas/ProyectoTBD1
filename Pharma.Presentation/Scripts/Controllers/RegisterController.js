'use strict';
angular.module('app.controllers')

    // Path: /register
    .controller('RegisterCtrl', [
        '$scope', '$location', '$window', 'AccountServices', function ($scope, $location, $window, AccountServices) {
            $scope.$root.title = 'Register';
            // TODO: Register a new user
            $scope.login = function() {
                $location.path('/login');
                return false;
            };

            $scope.registerModel = {};

            $scope.ShowMessage = false;

            $scope.registrarUsuario = function() {

                if ($scope.registerModel.Contrasena != $scope.registerModel.ConfirmarContrasena) {
                    toastr.warning("Contraseñas no coinciden");
                    $scope.registerModel.Contrasena = "";
                    $scope.registerModel.ConfirmarContrasena = "";
                    return;
                }

                AccountServices.register($scope.registerModel, function (response) {
                    if (response.Status == 0) {
                        toastr.error(response.Message, "Error", {
                            "closeButton": true,
                            "positionClass": "toast-bottom-full-width",
                            "showEasing": "swing",
                            "hideEasing": "swing",
                            "showMethod": "slideDown",
                            "hideMethod": "fadeOut"
                        });
                    }
                    if (response.Status == 1) {
                        toastr.warning(response.Message);
                    }
                    if (response.Status == 2) {
                        toastr.success(response.Message);
                      //  $location.path('/loading');
                        $location.path('/login');
                    }

                }, function(error) {
                    $scope.ShowMessage = false;
                });
            };
            //   setTimeout($scope.registrarUsuario, 2000);

        }
    ]);