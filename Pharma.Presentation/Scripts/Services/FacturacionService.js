'use strict';

angular.module('app.services')
    .factory('Facturacion', ['$http', function ($http) {

        var account = {};

        var baseLocalUrl = "http://localhost:1368";

        var baseUrl = baseLocalUrl;

   
        account.getLanesForLoggedUser = function (boardId) {
            return $http.get(baseUrl + '/lanes/' + boardId + '/' + $window.sessionStorage.token);
        };
        
        return account;

    }]);