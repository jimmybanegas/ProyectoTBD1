'use strict';
angular.module('app.services')
    .factory('League', function($http, Server, $cookieStore) {
        return {
            getAvailableLeagues: function(success, error) {
                $http
                    .get(
                        Server.get() + '/leagues/available', {
                            headers: { 'Authorization': $cookieStore.get('access_token') }
                        })
                    .success(function(response) {
                        success(response);
                    })
                    .error(error);
            },
            getSuscribedLeagues: function(success, error) {
                $http.get(Server.get() + '/leagues/suscribed', {
                        headers: { 'Authorization': $cookieStore.get('access_token') }

                    })
                    .success(function(response) {
                        success(response);
                    }).error(error);
            }
        };
    });