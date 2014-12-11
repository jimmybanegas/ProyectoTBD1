'use strict';

angular.module('app.services')
    .factory('Sistema', ['$http', '$window', function ($http, $window) {

        var sistema = {};

        var baseLocalUrl = "http://localhost:1368";

        var baseUrl = baseLocalUrl;

        sistema.getUsuarios = function () {
            return $http.get(baseUrl + '/usuarios/available/' + $window.sessionStorage.token);
        };

      
        return sistema;

    }]);