'use strict';
angular.module('app.controllers')
    // Path: /
    .controller('HomeCtrl', [
        '$scope', '$location', '$window', 'Account', 'Auth', function ($scope, $location, $window, Account, Auth) {
            $scope.$root.title = 'Farmacia La Mejor';

            $scope.user = {};

            $scope.login = function () {
                toastr.success("Bienvenido a Farmacia La Mejor");
                Auth.login($scope.user, function (response) {
                    if (response.Status == 0) {
                        toastr.error(response.access_token, "Error", {
                            "closeButton": true,
                            "positionClass": "toast-bottom-full-width",
                            "showEasing": "swing",
                            "hideEasing": "swing",
                            "showMethod": "slideDown",
                            "hideMethod": "fadeOut"
                        });
                        $scope.user = {};
                    }
                    if (response.Status == 1) {
                        toastr.success("Bienvenido a Farmacia La Mejor");
                    }

                    if (response.role.title === 'admin') {
                        $location.path('/profile');
                    } else {
                        $location.path('/profile-normal');
                    }
                    $scope.isLoading = false;
                }, function (error) {

                });
            };

            $scope.$on('$viewContentLoaded', function() {
                $window.ga('send', 'pageview', { 'page': $location.path(), 'title': $scope.$root.title });
            });
        }
    ]);
