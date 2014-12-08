'use strict';
angular.module('app.controllers')

    // Path: /forgot-password
    .controller('SistemaCtrl', [
        '$scope', '$location', '$window', 'Sistema', function ($scope, $location, $window, Sistema) {
            $scope.$root.title = 'Sistema';
            // TODO: Forgot password

            $scope.$on('$viewContentLoaded', function () {
                $window.ga('send', 'pageview', { 'page': $location.path(), 'title': $scope.$root.title });
            });

        }
    ]);