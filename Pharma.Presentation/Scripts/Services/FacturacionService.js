'use strict';

angular.module('app.services', [])
    .factory('Facturacion', ['$http', function ($http) {

        var account = {};

        //var baseRemoteUrl = "http://XXXX.apphb.com/";
        var baseLocalUrl = "http://localhost:1416";

        var baseUrl = baseLocalUrl;

        account.getPermissionsForLoggedUser = function () {
            return $http.get(baseUrl + '/permissions/' + $window.sessionStorage.token);
        };
        
        return account;

    }]);