'use strict';
angular.module('app.controllers')

    // Path: /forgot-password
    .controller('InventariosCtrl', [
        '$scope', '$location', '$window', 'Inventarios', function ($scope, $location, $window, Inventarios) {
            $scope.$root.title = 'Inventarios';
            // TODO: Forgot password


            $scope.$on('$viewContentLoaded', function () {
                $window.ga('send', 'pageview', { 'page': $location.path(), 'title': $scope.$root.title });
            });
        }
    ]);