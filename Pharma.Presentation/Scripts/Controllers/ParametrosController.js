'use strict';
angular.module('app.controllers')

    // Path: /forgot-password
    .controller('ParametrosCtrl', [
        '$scope', '$location', '$window', 'Parametros', function ($scope, $location, $window, Parametros) {
            $scope.$root.title = 'Parametros';
            // TODO: Forgot password

            $scope.$on('$viewContentLoaded', function () {
                $window.ga('send', 'pageview', { 'page': $location.path(), 'title': $scope.$root.title });
            });

        }
    ]);