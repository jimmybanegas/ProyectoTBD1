'use strict';
angular.module('app.controllers')


    // Path: /profile
    .controller('ProfileCtrl', [
        '$scope', '$location', '$window', function($scope, $location, $window) {
            $scope.$root.title = 'SportLiga | Mi perfil';

        }
    ]);