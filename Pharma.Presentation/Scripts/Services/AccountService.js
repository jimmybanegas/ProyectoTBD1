'use strict';

angular.module('app.services')
    .factory('AccountServices', [
        '$http', function ($http, Server) {

            var account = {};

            //var baseRemoteUrl = "http://XXXX.apphb.com/";
            var baseLocalUrl = "http://localhost:1368";

            var baseUrl = baseLocalUrl;

            account.login = function(model) {
                return $http.post(baseUrl+ '/login', model);
            };

            account.register = function(model) {
                return $http.post(baseUrl + '/register', model);
            };

            account.restorePassword = function(model) {
                return $http.put(baseUrl + '/login', model);
            };
            return account;

        }
    ]);
    