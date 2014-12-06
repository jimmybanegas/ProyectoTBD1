'use strict';
angular.module('app.controllers')
    // Path: /forgot-password
    .controller('FacturacionCtrl', [
        '$scope', '$location', '$window', 'Facturacion', function ($scope, $location, $window, Facturacion) {

        $scope.$root.title = 'Facturacion';
        // TODO: Forgot password

        $scope.logoRemoved = false;

        $scope.printMode = false;

        $scope.fecha = new Date();
            

        $scope.sample_invoice = {
            tax: 15.00,
            invoice_number: 10,
            customer_info: { name: "Mr. John Doe", web_link: "John Doe Designs Inc.", address1: "1 Infinite Loop", address2: "Cupertino, California, US", postal: "90210" },
            company_info: { name: "Metaware Labs", web_link: "www.metawarelabs.com", address1: "123 Yonge Street", address2: "Toronto, ON, Canada", postal: "M5S 1B6" },
            items: [{ qty: 10, description: 'Gadget', cost: 9.95 }]
        };

        $scope.addItem = function () {
            $scope.sample_invoice.items.push({ qty: 0, cost: 0, description: "" });
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
       
    }
]);