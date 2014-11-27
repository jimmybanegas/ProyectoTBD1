'use strict';

angular.module('app.services')
    .factory('AccountServices', [
        '$http', function($http) {

            var account = {};

            //var baseRemoteUrl = "http://XXXX.apphb.com/";
            var baseLocalUrl = "http://localhost:1367";

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
    
/*.factory('AccountServices', function ($http, Server) {
    return {

        login: function (loginModel, success, error) {
            $http
                .post(
                     Server.get() + '/login', loginModel)
                .success(function (response) {
                    success(response);
                })
                .error(error);
        },
        register: function (registerModel, success, error) {
            $http
                .post(
                     Server.get() + '/register', registerModel)
                .success(function (response) {
                    success(response);
                })
                .error(error);
        },

        resetPassword: function (resetPassModel, success, error) {
            $http
                .post(
                     Server.get() + '/resetpassword', resetPassModel)
                .success(function (response) {
                    success(response);
                })
                .error(error);
        }

    };
});*/