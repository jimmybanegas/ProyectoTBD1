'use strict';
angular.module('app.controllers')

    // Path: /forgot-password
    .controller('ForgotPasswordCtrl', [
        '$scope', '$location', '$window', 'Account', function($scope, $location, $window, Account) {
            $scope.$root.title = 'SportLiga | Recuperar password';
            // TODO: Forgot password

            $scope.resetModel = {};

            $scope.ShowMessageForgot = false;
          
            $scope.RecoverPassword = function() {
                Account.resetPassword($scope.resetModel, function(response) {
                    if (response.Status == 1) {
                        toastr.warning(response.Message, { "closeButton": true, });
                    }
                    if (response.Status == 2) {
                        toastr.success(response.Message);
                        $location.path('/login');
                    }
                  
                }, function(error) {

                });
            };

        }
    ]);