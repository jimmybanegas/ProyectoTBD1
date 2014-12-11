'use strict';

angular.module('app.services')
    .factory('Parametros', ['$http', '$window', function ($http, $window) {

        var parametro = {};

        var baseLocalUrl = "http://localhost:1368";

        var baseUrl = baseLocalUrl;

        parametro.getTiposClientes = function () {
            return $http.get(baseUrl + '/tipos_clientes/available/' + '/' + $window.sessionStorage.token);
        };

        parametro.guardarCliente = function (model) {
            return $http.post(baseUrl + '/guardarCliente/' + $window.sessionStorage.token, model);
        };

        parametro.borrarCliente = function (model) {
            return $http.post(baseUrl + '/borrarCliente/' + $window.sessionStorage.token, model);
        };

        parametro.borrarProveedor = function (model) {
            return $http.post(baseUrl + '/borrarProveedor/' + $window.sessionStorage.token, model);
        };

        parametro.guardarProveedor = function (model) {
            return $http.post(baseUrl + '/guardarProveedor/' + $window.sessionStorage.token, model);
        };

        parametro.guardarProducto = function (model) {
            return $http.post(baseUrl + '/guardarProducto/' + $window.sessionStorage.token, model);
        };
        
        parametro.guardarCategoria = function (model) {
            return $http.post(baseUrl + '/guardarCategoria/' + $window.sessionStorage.token, model);
        };

        parametro.guardarTipoProducto = function (model) {
            return $http.post(baseUrl + '/guardarFactura/' + $window.sessionStorage.token, model);
        };

        parametro.getCategoriasProductos = function () {
            return $http.get(baseUrl + '/categorias/available/' + '/' + $window.sessionStorage.token);
        };

        parametro.getPresentacionesProductos = function () {
            return $http.get(baseUrl + '/presentaciones/available/' + '/' + $window.sessionStorage.token);
        };

        parametro.getTiposClientes = function () {
            return $http.get(baseUrl + '/tipos_clientes/available/' + $window.sessionStorage.token);
        };

        return parametro;

    }]);