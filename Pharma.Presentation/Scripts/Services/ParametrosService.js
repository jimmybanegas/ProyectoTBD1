'use strict';

angular.module('app.services')
    .factory('Parametros', ['$http', '$window', function ($http, $window) {

        var parametro = {};

        var baseLocalUrl = "http://localhost:1368";

        var baseUrl = baseLocalUrl;

        parametro.getTiposClientes = function () {
            return $http.get(baseUrl + '/tipos_clientes/available/' + '/' + $window.sessionStorage.token);
        };

        parametro.getCategoriasProductos = function () {
            return $http.get(baseUrl + '/categorias/available/' + '/' + $window.sessionStorage.token);
        };

        parametro.getPresentacionesProductos = function () {
            return $http.get(baseUrl + '/presentaciones/available/' + '/' + $window.sessionStorage.token);
        };

        parametro.getTiposTransacciones = function () {
            return $http.get(baseUrl + '/tipo_transacciones/available/' + '/' + $window.sessionStorage.token);
        };

        return parametro;

    }]);