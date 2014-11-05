'use strict';
angular.module('app.controllers')
    .controller('RegisterCtrl', [
        '$scope', '$location', '$window', 'Account', function($scope, $location, $window, Account) {
            $scope.$root.title = 'AngularJS SPA | Register';
            // TODO: Authorize a user
            $scope.user = {

            };

            $scope.register = function() {
                Account.register($scope.user, function(response) {
                    $location.path('/login');
                }, function(error) {
                    alert('Error');
                });
            };
            $scope.$on('$viewContentLoaded', function() {
                $window.ga('send', 'pageview', { 'page': $location.path(), 'title': $scope.$root.title });
            });
        }
    ]);