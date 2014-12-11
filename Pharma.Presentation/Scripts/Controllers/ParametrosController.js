'use strict';
angular.module('app.controllers')

    // Path: /forgot-password
    .controller('ParametrosCtrl', [
        '$scope', '$location', '$window', 'Parametros', 'Facturacion', 'Compras', function ($scope, $location, $window, Parametros, Facturacion, Compras) {
            $scope.$root.title = 'Parametros';
          
            $scope.fecha = new Date();

          
            $scope.proveedor = "";
            $scope.cliente = "";
            $scope.producto = "";
            $scope.categoria = "";
            $scope.presentacion = "";


            $scope.productos = [];
            $scope.clientes = [];
            $scope.tiposClientes = [];
            $scope.proveedores = [];
            $scope.categorias = [];
            $scope.presentaciones = [];

            $scope.cancelar = function () {
                $scope.proveedor = "";
                $scope.cliente = "";
                $scope.producto = "";
                $scope.categoria = "";
                $scope.presentacion = "";
                };

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

          
            $scope.getTiposClientes = function () {

                Parametros
                    .getTiposClientes()
                    .success(function (data, status, headers, config) {
                        $scope.tiposClientes = data;
                        console.log(data);
                    })
                    .error(function (data, status, headers, config) {
                        console.log(data);
                    });
            };

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

            $scope.getCategorias = function () {

                Parametros
                    .getCategorias()
                    .success(function (data, status, headers, config) {
                        $scope.categorias = data;
                        console.log(data);
                    })
                    .error(function (data, status, headers, config) {
                        console.log(data);
                    });
            };

            $scope.getPresentaciones = function () {

                Parametros
                    .getPresentacionesProductos()
                    .success(function (data, status, headers, config) {
                        $scope.presentaciones = data;
                        console.log(data);
                    })
                    .error(function (data, status, headers, config) {
                        console.log(data);
                    });
            };


            $scope.guardarCliente = function () {
                console.log($scope.cliente);
                Parametros
                      .guardarCliente($scope.cliente)
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
                              $scope.cliente = "";
                              $scope.getClientes();
                          }
                      })
                      .error(function (data, status, headers, config) {
                          console.log(data);
                      });
            }

            $scope.clienteBorrar = function(cliente) {
                $scope.cliente = cliente;
            }

            $scope.borrarCliente = function () {
                console.log($scope.cliente);
                Parametros
                      .borrarCliente($scope.cliente)
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
                              $scope.cliente = "";
                              $scope.getClientes();
                          }
                      })
                      .error(function (data, status, headers, config) {
                          console.log(data);
                      });
            }
            
            $scope.guardarProveedor = function () {
                console.log($scope.proveedor);
                Parametros
                      .guardarProveedor($scope.proveedor)
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
                              $scope.proveedor = "";
                              $scope.getProveedores();
                          }
                      })
                      .error(function (data, status, headers, config) {
                          console.log(data);
                      });
            }

            $scope.proveedorBorrar = function (proveedor) {
                $scope.proveedor = proveedor;
            }

            $scope.borrarProveedor = function () {
                console.log($scope.proveedor);
                Parametros
                      .borrarProveedor($scope.proveedor)
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
                              $scope.proveedor = "";
                              $scope.getProveedores();
                          }
                      })
                      .error(function (data, status, headers, config) {
                          console.log(data);
                      });
            }
            
            $scope.guardarProducto = function () {
                console.log($scope.producto);
                Parametros
                      .guardarProducto($scope.producto)
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
                              $scope.producto = "";
                              $scope.getProductos();
                          }
                      })
                      .error(function (data, status, headers, config) {
                          console.log(data);
                      });
            }

            $scope.productoBorrar = function (producto) {
                $scope.producto = producto;
            }

            $scope.borrarProducto = function () {
                console.log($scope.producto);
                Parametros
                      .borrarProducto($scope.producto)
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
                              $scope.producto = "";
                              $scope.getProductos();
                          }
                      })
                      .error(function (data, status, headers, config) {
                          console.log(data);
                      });
            }
        
            $scope.guardarCategoria = function () {
                console.log($scope.categoria);
                Parametros
                      .guardarCategoria($scope.categoria)
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
                              $scope.categoria = "";
                              $scope.getCategorias();
                          }
                      })
                      .error(function (data, status, headers, config) {
                          console.log(data);
                      });
            }

            $scope.categoriaBorrar = function (categoria) {
                $scope.categoria = categoria;
            }

            $scope.borrarCategoria = function () {
                console.log($scope.categoria);
                Parametros
                      .borrarCategoria($scope.categoria)
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
                              $scope.categoria = "";
                              $scope.getCategorias();
                          }
                      })
                      .error(function (data, status, headers, config) {
                          console.log(data);
                      });
            }
            
           $scope.guardarPresentacion = function () {
                console.log($scope.presentacion);
                Parametros
                      .guardarPresentacion($scope.presentacion)
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
                              $scope.presentacion = "";
                              $scope.getPresentaciones();
                          }
                      })
                      .error(function (data, status, headers, config) {
                          console.log(data);
                      });
            }

            $scope.presentacionBorrar = function (presentacion) {
                $scope.presentacion = presentacion;
            }

            $scope.borrarPresentacion = function () {
                console.log($scope.presentacion);
                Parametros
                      .borrarPresentacion($scope.presentacion)
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
                              $scope.presentacion = "";
                              $scope.getPresentaciones();
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