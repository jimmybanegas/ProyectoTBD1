'use strict';
angular.module('app.services')

 .factory('Account', function ($http,Server) {
     return {
   
         register: function (registerModel, success, error) {
             $http
                 .post(
                      Server.get()+ '/register', registerModel)
                 .success(function (response) {
                     success(response);
                 })
                 .error(error);
         },

         resetPassword: function (resetPassModel, success, error) {
             $http
                 .post(
                      Server.get() + '/resetpassword', resetPassModel)
                 .success(function (response) {
                     success(response);
                 })
                 .error(error);
         }

     };
 });