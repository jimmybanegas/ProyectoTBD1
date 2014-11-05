'use strict';
angular.module('app.services')
    .factory('Server', function () {
        return {
            get: function () {
                var server = '';
                if (window.location.host.indexOf('localhost') > -1) {
                    server = 'http://localhost:1367';
                } else if (window.location.host.indexOf('apphb') > -1) {
                    server = 'http://prediliga-api.apphb.com';
                }
                return server;
            }
        };
    });