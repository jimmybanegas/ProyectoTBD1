'use strict';
angular.module('app.services')
    .factory('Account', function ($http, Server) {
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
            }
        };
    });