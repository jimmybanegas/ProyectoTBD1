'use strict';
angular.module('app.controllers')

    // Path: /forgot-password
    .controller('ComprasCtrl', [
        '$scope', '$location', '$window', 'Compras', function ($scope, $location, $window, Compras) {
            $scope.$root.title = 'Compras';
           
            $scope.logoRemoved = false;

            $scope.printMode = false;

            $scope.fecha = new Date();

            $scope.sample_invoice = {
                fecha: $scope.fecha,
              //  tax: 15.00,
                proveedores: {},
                descuento: 0,
                detalle_cotizaciones: []
            };

            $scope.addItem = function (producto) {
                
                $scope.sample_invoice.detalle_cotizaciones.push({
                    productos: producto,
                    cantidad: 1,
                    precio_unit :0,
                    subtotal: 0
                });
            }

            $scope.addProveedor = function (proveedor) {
                $scope.sample_invoice.proveedores = {};

                $scope.sample_invoice.proveedores = proveedor;
            }

            $scope.showLogo = function () {
                $scope.logoRemoved = false;
            }

            $scope.removeItem = function (item) {
                $scope.sample_invoice.detalle_cotizaciones.splice($scope.sample_invoice.detalle_cotizaciones.indexOf(item), 1);
            }

            $scope.invoice_sub_total = function () {
                var total = 0.00;
                var numDetalle = 1;
                angular.forEach($scope.sample_invoice.detalle_cotizaciones, function (item, key) {
                    total += (item.cantidad * item.precio_unit);
                    item.subtotal = total;
                    item.num_detalle = numDetalle;
                    numDetalle += 1;
                });
                $scope.sample_invoice.subtotal = total;

                return total;
            }

          /*  $scope.calculate_tax = function () {
                var taxs = (($scope.sample_invoice.tax * $scope.invoice_sub_total()) / 100);
                $scope.sample_invoice.isv = taxs;
                return taxs;
            }*/
            $scope.calculate_grand_total = function () {
                var total = $scope.invoice_sub_total();
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

                Compras
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

                Compras
                    .getClientes()
                    .success(function (data, status, headers, config) {
                        $scope.clientes = data;
                        console.log(data);
                    })
                    .error(function (data, status, headers, config) {
                        console.log(data);
                    });
            };

            $scope.proveedores = [];

            $scope.getProveedores = function () {

                Compras
                    .getProveedores()
                    .success(function (data, status, headers, config) {
                        $scope.proveedores = data;
                        console.log(data);
                    })
                    .error(function (data, status, headers, config) {
                        console.log(data);
                    });
            };


            $scope.guardarCotizacion = function () {
                console.log($scope.sample_invoice);
                Compras
                      .guardarCotizacion($scope.sample_invoice)
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
                              // $location.path('/facturar');
                              $scope.sample_invoice = "";
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