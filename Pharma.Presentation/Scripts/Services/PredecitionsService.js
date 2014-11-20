/*'use strict';
angular.module('app.services')
    .factory('Prediction', function ($http, Server, $cookieStore) {
        return {
            getAvailableLeagues: function (success, error) {
                $http
                    .get(
                        Server.get() + '/leagues/available', {
                            headers: { 'Authorization': $cookieStore.get('access_token') }
                        })
                    .success(function (response) {
                        success(response);
                    })
                    .error(error);
            },

            getSuscribedLeagues: function (success, error) {
                $http.get(Server.get() + '/leagues/suscribed', {
                    headers: { 'Authorization': $cookieStore.get('access_token') }

                })
                    .success(function (response) {
                        success(response);
                    }).error(error);
            },

            addLeague: function (addLeagueModel, success, error) {
                $http
                    .post(
                        'http://localhost:1367/addLeague', addLeagueModel)
                    .success(function (response) {
                        success(response);
                    })
                    .error(error);
            },
        };
    });*/
