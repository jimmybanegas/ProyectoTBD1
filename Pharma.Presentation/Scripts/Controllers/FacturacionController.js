'use strict';
angular.module('app.controllers')
    // Path: /forgot-password
    .controller('FacturacionCtrl', [
        '$scope', '$location', '$window', 'Facturacion', function ($scope, $location, $window, Facturacion) {

        $scope.$root.title = 'Facturacion';

        $scope.logoRemoved = false;

        $scope.printMode = false;

        $scope.fecha = new Date();
            
        $scope.sample_invoice = {
            tax: 15.00,
            invoice_number: 10,
            customer_info: { },
            items: []
        };

        $scope.addItem = function (producto) {
            var costo;
            if ($scope.sample_invoice.customer_info.tipo == "CONSUMIDOR")
                costo = producto.precio_consumi;
            else
                costo = producto.precio_mayor;

            $scope.sample_invoice.items.push({ cod_prod: producto.cod_prod ,description: producto.nombre, qty: 1, cost: costo });
        }
        
        $scope.addCliente = function (cliente) {
            $scope.sample_invoice.customer_info = {};
            $scope.sample_invoice.customer_info = { id_cliente: cliente.id_cliente, nombre: cliente.nombre, tipo: cliente.tipo_cliente.descripcion };
        }

        $scope.showLogo = function () {
            $scope.logoRemoved = false;
        }

        $scope.removeItem = function (item) {
            $scope.sample_invoice.items.splice($scope.sample_invoice.items.indexOf(item), 1);
        }

        $scope.invoice_sub_total = function () {
            var total = 0.00;
            angular.forEach($scope.sample_invoice.items, function (item, key) {
                total += (item.qty * item.cost);
            });
            return total;
        }

        $scope.calculate_tax = function () {
            return (($scope.sample_invoice.tax * $scope.invoice_sub_total()) / 100);
        }
        $scope.calculate_grand_total = function () {
          //  localStorage["invoice"] = JSON.stringify($scope.invoice);
            return $scope.calculate_tax() + $scope.invoice_sub_total();
        }

        $scope.printInfo = function () {
            window.print();
        }

        $scope.clearLocalStorage = function () {
            var confirmClear = confirm("Are you sure you would like to clear the invoice?");
            if (confirmClear) {
                $scope.sample_invoice = "";
            }
        }

        $scope.productos = [];

        $scope.getProductos = function () {

            Facturacion
                .getProductos()
                .success(function (data, status, headers, config) {
                    $scope.productos = data;
                    console.log(data);
                })
                .error(function (data, status, headers, config) {
                    console.log(data);
                });
        };
        
        $scope.clientes = [];

        $scope.getClientes = function () {

            Facturacion
                .getClientes()
                .success(function (data, status, headers, config) {
                    $scope.clientes = data;
                    console.log(data);
                })
                .error(function (data, status, headers, config) {
                    console.log(data);
                });
        };


        $scope.$on('$viewContentLoaded', function () {
            $window.ga('send', 'pageview', { 'page': $location.path(), 'title': $scope.$root.title });
        });
       
    }
]);