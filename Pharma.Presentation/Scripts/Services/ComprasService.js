'use strict';

angular.module('app.services')
    .factory('Compras', ['$http', '$window', function ($http, $window) {

        var compras = {};

        var baseLocalUrl = "http://localhost:1368";

        var baseUrl = baseLocalUrl;

        compras.getProveedores = function () {
            return $http.get(baseUrl + '/proveedores/available/' + '/' + $window.sessionStorage.token);
        };

        compras.getCompras = function () {
            return $http.get(baseUrl + '/compras/available/' + '/' + $window.sessionStorage.token);
        };

        compras.getProductos = function () {
            return $http.get(baseUrl + '/productos/available/' + '/' + $window.sessionStorage.token);
        };

        compras.getCotizaciones = function () {
            return $http.get(baseUrl + '/cotizaciones/available/' + '/' + $window.sessionStorage.token);
        };

        compras.getOrdenes = function () {
            return $http.get(baseUrl + '/ordenes/available/' + '/' + $window.sessionStorage.token);
        };

         /*  compras.getCotizaciones = function () {
            return $http.get(baseUrl + '/cotizaciones/available/' + '/' + $window.sessionStorage.token);
        };*/

     
        return compras;
    }]);