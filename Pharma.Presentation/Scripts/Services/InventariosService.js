'use strict';

angular.module('app.services')
    .factory('Inventarios', ['$http', '$window', function ($http, $window) {

        var inventario = {};

        var baseLocalUrl = "http://localhost:1368";

        var baseUrl = baseLocalUrl;

        inventario.getAjustes = function () {
            return $http.get(baseUrl + '/ajustes/available/' + '/' + $window.sessionStorage.token);
        };

        inventario.getKardex = function () {
            return $http.get(baseUrl + '/kardex/available/' + '/' + $window.sessionStorage.token);
        };

        return inventario;

    }]);