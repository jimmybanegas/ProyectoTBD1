'use strict';
angular.module('app.services')
    .factory('SportLiga', function ($http, Server, $cookieStore) {
        return {
            //Sección de las ligas
            addLeague: function (addLeagueModel, success, error) {
                $http
                    .post(
                       Server.get() + '/addleague', addLeagueModel, {
                           headers: { 'Authorization': $cookieStore.get('access_token') }
                       })
                    .success(function (response) {
                        success(response);
                    })
                    .error(error);
            },

            getAvailableLeagues: function (success, error) {
                $http
                    .get(
                        Server.get() + '/leagues/available', {
                            headers: { 'Authorization': $cookieStore.get('access_token') }
                        })
                    .success(function (response) {
                        success(response);
                    })
                    .error(error);
            },

            getSuscribedLeagues: function (success, error) {
                $http.get(Server.get() + '/leagues/suscribed', {
                    headers: { 'Authorization': $cookieStore.get('access_token') }
                })
                    .success(function (response) {
                        success(response);
                    }).error(error);
            },

            editLeague: function (addLeagueModel, success, error) {
                $http
                    .post(
                         Server.get() + '/editLeague', addLeagueModel, {
                             headers: { 'Authorization': $cookieStore.get('access_token') }
                         })
                    .success(function (response) {
                        success(response);
                    })
                    .error(error);
            },

            deleteLeague: function (Id, success, error) {
                $http
                    .post(
                         Server.get() + '/deleteLeague/' + Id, {
                             headers: { 'Authorization': $cookieStore.get('access_token') }
                         })
                    .success(function (response) {
                        success(response);
                    })
                    .error(error);
            },
            

            //Sección de los equipos
            addTeam: function (addTeamModel, success, error) {
                $http
                    .post(
                         Server.get() + '/addTeam', addTeamModel, {
                             headers: { 'Authorization': $cookieStore.get('access_token') }
                         })
                    .success(function (response) {
                        success(response);
                    })
                    .error(error);
            },

            getAvailableTeams: function (success, error) {
                $http
                    .get(
                        Server.get() + '/teams/available', {
                            headers: { 'Authorization': $cookieStore.get('access_token') }
                        })
                    .success(function (response) {
                        success(response);
                    })
                    .error(error);
            },

            editTeam: function (addTeamModel, success, error) {
                $http
                    .post(
                         Server.get() + '/editTeam', addTeamModel, {
                             headers: { 'Authorization': $cookieStore.get('access_token') }
                         })
                    .success(function (response) {
                        success(response);
                    })
                    .error(error);
            },

            deleteTeam: function (Id, success, error) {
                $http
                    .post(
                         Server.get() + '/deleteTeam/' + Id, {
                             headers: { 'Authorization': $cookieStore.get('access_token') }
                         })
                    .success(function (response) {
                        success(response);
                    })
                    .error(error);
            },
            
            //Sección de los partidos
            addMatch: function (addMatchModel, success, error) {
                $http
                    .post(
                         Server.get() + '/addMatch', addMatchModel)
                    .success(function (response) {
                        success(response);
                    })
                    .error(error);
            },

             editMatch: function (addMatchModel, success, error) {
                $http
                    .post(
                         Server.get() + '/editMatch', addMatchModel, {
                             headers: { 'Authorization': $cookieStore.get('access_token') }
                         })
                    .success(function (response) {
                        success(response);
                    })
                    .error(error);
            },

            deleteMatch: function (Id, success, error) {
                $http
                    .post(
                         Server.get() + '/deleteMatch/' + Id, {
                             headers: { 'Authorization': $cookieStore.get('access_token') }
                         })
                    .success(function (response) {
                        success(response);
                    })
                    .error(error);
            },

            getAvailableMatches: function (success, error) {
                $http
                    .get(
                        Server.get() + '/matches/available', {
                            headers: { 'Authorization': $cookieStore.get('access_token') }
                        })
                    .success(function (response) {
                        success(response);
                    })
                    .error(error);
            },

            getSuscribedMatches: function (success, error) {
                $http
                    .get(
                        Server.get() + '/matches/suscribed', {
                            headers: { 'Authorization': $cookieStore.get('access_token') }
                        })
                    .success(function (response) {
                        success(response);
                    })
                    .error(error);
            },


            //Sección de las predicciones
            addPrediction: function (addPredictionModel, success, error) {
                $http
                    .post(
                         Server.get() + '/addPrediction', addPredictionModel, {
                             headers: { 'Authorization': $cookieStore.get('access_token') }
                         })
                    .success(function (response) {
                        success(response);
                    })
                    .error(error);
            },

            editPrediction: function (addPredictionModel, success, error) {
                $http
                    .post(
                         Server.get() + '/editPrediction', addPredictionModel, {
                             headers: { 'Authorization': $cookieStore.get('access_token') }
                         })
                    .success(function (response) {
                        success(response);
                    })
                    .error(error);
            },

            deletePrediction: function (Id, success, error) {
                $http
                    .post(
                         Server.get() + '/deletePrediction/' + Id, {
                             headers: { 'Authorization': $cookieStore.get('access_token') }
                         })
                    .success(function (response) {
                        success(response);
                    })
                    .error(error);
            },

            getAvailablePredictions: function (success, error) {
                $http
                    .get(
                        Server.get() + '/predictions/available', {
                            headers: { 'Authorization': $cookieStore.get('access_token') }
                        })
                    .success(function (response) {
                        success(response);
                    })
                    .error(error);
            },

            //Sección de los suscripciones
            addSuscription: function (Id,res, success, error) {
                $http
                    .post(
                         Server.get() + '/addSuscription/' + Id ,res, {
                             headers: { 'Authorization': $cookieStore.get('access_token') }
                         })
                    .success(function (response) {
                        success(response);
                    })
                    .error(error);
            },

            getSuscriptors: function (Id, success, error) {
                $http
                    .get(
                         Server.get() + '/suscriptors/' + Id, {
                             headers: { 'Authorization': $cookieStore.get('access_token') }
                         })
                    .success(function (response) {
                        success(response);
                    })
                    .error(error);
            },

            getPositions: function (success, error) {
                $http
                    .get(
                         Server.get() + '/positions', {
                             headers: { 'Authorization': $cookieStore.get('access_token') }
                         })
                    .success(function (response) {
                        success(response);
                    })
                    .error(error);
            }
        };
    });