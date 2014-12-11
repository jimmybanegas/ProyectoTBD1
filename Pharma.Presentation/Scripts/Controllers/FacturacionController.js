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
            fecha: $scope.fecha,
            tax: 15.00,
            clientes: {},
            descuento: 0,
            detalle_facturas: []
         };

        $scope.addItem = function (producto) {
           
            var costo;
           
            if ($scope.sample_invoice.clientes.tipo_cliente.descripcion == "CONSUMIDOR")
                costo = producto.precio_consumi;
            else
                costo = producto.precio_mayor;

            $scope.sample_invoice.detalle_facturas.push({
                productos: producto,
                cantidad: 1,
                precio_venta: costo,
                subtotal: 0
        });
        }

        $scope.actualizarPrecio = function(cliente) {
            var costo;

            angular.forEach($scope.sample_invoice.detalle_facturas, function (item, key) {
                if ($scope.sample_invoice.clientes.tipo_cliente.descripcion == "CONSUMIDOR")
                    costo = producto.precio_consumi;
                else
                    costo = producto.precio_mayor;
            });
        }
        
        $scope.addCliente = function (cliente) {
            $scope.sample_invoice.clientes = {};

            $scope.sample_invoice.clientes = cliente;
        }

        $scope.showLogo = function () {
            $scope.logoRemoved = false;
        }

        $scope.removeItem = function (item) {
            $scope.sample_invoice.detalle_facturas.splice($scope.sample_invoice.detalle_facturas.indexOf(item), 1);
        }

        $scope.invoice_sub_total = function () {
            var total = 0.00;
            var numDetalle = 1;
            angular.forEach($scope.sample_invoice.detalle_facturas, function (item, key) {
                total += (item.cantidad * item.precio_venta);
                item.subtotal = total;
                item.num_detalle = numDetalle;
                numDetalle += 1;
            });
            $scope.sample_invoice.subtotal = total;

            return total;
        }

        $scope.calculate_tax = function () {
            var taxs = (($scope.sample_invoice.tax * $scope.invoice_sub_total()) / 100);
            $scope.sample_invoice.isv = taxs;
            return taxs;
        }
        $scope.calculate_grand_total = function () {
            var total = $scope.calculate_tax() + $scope.invoice_sub_total();
            $scope.sample_invoice.total = total;
            return total;
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


        $scope.guardarFactura = function() {
            console.log($scope.sample_invoice);
            Facturacion
                  .guardarFactura($scope.sample_invoice)
                  .success(function (data, status, headers, config) {
                      console.log(data);
                      if (data.Status == 0) {
                          toastr.error(data.Message, "Error", {
                              "closeButton": true,
                              "positionClass": "toast-bottom-full-width",
                              "showEasing": "swing",
                              "hideEasing": "swing",
                              "showMethod": "slideDown",
                              "hideMethod": "fadeOut"
                          });
                      }
                      if (data.Status == 1) {
                          toastr.warning(data.Message);
                      }
                      if (data.Status == 2) {
                          toastr.success(data.Message);
                          $scope.sample_invoice = "";
                          $location.path('/facturar');
                      }
                  })
                  .error(function (data, status, headers, config) {
                      console.log(data);
                  });
        }

        $scope.$on('$viewContentLoaded', function () {
            $window.ga('send', 'pageview', { 'page': $location.path(), 'title': $scope.$root.title });
        });
       
    }
]);