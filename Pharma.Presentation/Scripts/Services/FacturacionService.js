'use strict';

angular.module('app.services')
    .factory('Facturacion', ['$http', '$window', function ($http, $window) {

        var factura = {};

        var baseLocalUrl = "http://localhost:1368";

        var baseUrl = baseLocalUrl;
        
        factura.getProductos = function () {
            return $http.get(baseUrl + '/productos/available/' + $window.sessionStorage.token);
        };

        factura.getClientes = function () {
            return $http.get(baseUrl + '/clientes/available/' + $window.sessionStorage.token);
        };

        factura.guardarFactura = function (model) {
            return $http.post(baseUrl + '/guardarFactura/' + $window.sessionStorage.token, model);
        };
        
        return factura;

    }]);