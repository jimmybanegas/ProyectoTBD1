'use strict';
angular.module('app.controllers')

// Path: /league
.controller('LeagueCtrl', [
    '$scope','$location','$window','$stateParams','SportLiga','Auth',function($scope, $location, $window, $stateParams,SportLiga,Auth) {
        $scope.$root.title = 'SportLiga | Liga';

        $scope.go = function(path) {
            $location.path(path);
        };

        $scope.logout = function () {
            Auth.logout();
        };
  
        $scope.parametro = 0;

        $scope.teams = [];
        $scope.FilterTeams = [];
        $scope.ligas = [];
        $scope.misLigas = [];
        $scope.ligasRecomendadas = [];
        $scope.ligaAEditar = {};
        $scope.partidos = [];
        $scope.PartidosFiltrados = [];
        $scope.misPartidos = [];
        $scope.misPredicciones = [];
        $scope.suscriptores = [];
        $scope.posiciones = [];

    
        $scope.suscribirse = function(liga) {
            SportLiga.addSuscription(liga.Id,localStorage.getItem('res'), function (response) {

                if (response.Status == 0) {
                    toastr.error(response.Message, "Error", {
                        "closeButton": true,
                        "positionClass": "toast-bottom-full-width",
                        "showEasing": "swing",
                        "hideEasing": "swing",
                        "showMethod": "slideDown",
                        "hideMethod": "fadeOut"
                    });
                }
                if (response.Status == 1) {
                    toastr.success(response.Message);
                    $scope.loadLeagues();
                    $scope.loadMatches();
                    $scope.Suscripcion = {};
                }
            }, function (error) {
                $scope.ShowMessage = false;
            });

        };

        //Edicion de equipos

        $scope.addNewTeam = function() {
            $scope.Equipo.Liga = parseInt($stateParams.id),

            SportLiga.addTeam($scope.Equipo, function (response) {

                if (response.Status == 0) {
                    toastr.error(response.Message, "Error", {
                        "closeButton": true,
                        "positionClass": "toast-bottom-full-width",
                        "showEasing": "swing",
                        "hideEasing": "swing",
                        "showMethod": "slideDown",
                        "hideMethod": "fadeOut"
                    });
                }
                if (response.Status == 1) {
                    toastr.success(response.Message);
                    $scope.loadTeams();
                    $scope.Equipo = {};
                }
            }, function (error) {
                $scope.ShowMessage = false;
            });

        };

        $scope.deleteTeam = function(Id) {
            SportLiga.deleteTeam(Id, function (response) {
                if (response.Status == 0) {
                    toastr.error(response.Message, "Error", {
                        "closeButton": true,
                        "positionClass": "toast-bottom-full-width",
                        "showEasing": "swing",
                        "hideEasing": "swing",
                        "showMethod": "slideDown",
                        "hideMethod": "fadeOut"
                    });
                }
                if (response.Status == 1) {
                    toastr.success(response.Message);
                    $scope.loadTeams();
                }
            }, function (error) {
                $scope.ShowMessage = false;
            });
        };

        $scope.isEditing = false;
        $scope.idAnterior = "";
        $scope.nombreAnterior = "";
        $scope.logoAnterior = "";
        $scope.sitioAnterior = "";
        $scope.estadoAnterior = "";

        $scope.editTeam = function(id, nombre, IsArchived, logo, webSite) {
            $scope.isEditing = true;
            $scope.EquipoEdit = {};
            $scope.idAnterior = id;
            $scope.EquipoEdit.Id = id;
            $scope.nombreAnterior = nombre;
            $scope.EquipoEdit.Nombre = nombre;
            $scope.logoAnterior = logo;
            $scope.EquipoEdit.Logo = logo;
            $scope.sitioAnterior = webSite;
            $scope.EquipoEdit.SitioWeb = webSite;
            $scope.estadoAnterior = IsArchived;
            $scope.EquipoEdit.IsArchived = IsArchived;
        };

        $scope.cancelEdit = function() {
            $scope.isEditing = false;
        };


        $scope.finishEditing = function() {
            SportLiga.editTeam($scope.EquipoEdit, function (response) {
                if (response.Status == 0) {
                    toastr.error(response.Message, "Error", {
                        "closeButton": true,
                        "positionClass": "toast-bottom-full-width",
                        "showEasing": "swing",
                        "hideEasing": "swing",
                        "showMethod": "slideDown",
                        "hideMethod": "fadeOut"
                    });
                }
                if (response.Status == 1) {
                    toastr.success(response.Message);
                    $scope.loadTeams();
                    $scope.EquipoEdit = {};
                }
            }, function (error) {
                $scope.ShowMessage = false;
            });

            $scope.isEditing = false;
            $scope.idAnterior = "";
            $scope.nombreAnterior = "";
            $scope.logoAnterior = "";
            $scope.sitioAnterior = "";
            $scope.estadoAnterior = "";
        };

        //Agregar nuevo
        $scope.letAdd = false;
        $scope.isAdding = function() {
            $scope.letAdd = true;
        };

        $scope.cancelAdd = function(team) {
            $scope.letAdd = false;
        };

        //Permitir adivinar
        $scope.letGuess = false;

        $scope.isGuessing = function() {
            $scope.letGuess = true;
        };

        $scope.cancelGuess = function() {
            $scope.letGuess = false;
        };

        $scope.Match.League = $scope.ligas[0];
        $scope.inicio2(1);
        $scope.Match.Team1 = $scope.FilterTeamsSelect[0];
        $scope.Match.Team2 = $scope.FilterTeamsSelect[0];
     

        $scope.ordenarPor = function(orden) {
            $scope.OrdenSeleccionado = orden;
        };


        //Edicion de la liga
        $scope.Liga = {};

        $scope.addNewLeague = function() {
            SportLiga.addLeague($scope.Liga, function (response) {
                if (response.Status == 0) {
                    toastr.error(response.Message, "Error", {
                        "closeButton": true,
                        "positionClass": "toast-bottom-full-width",
                        "showEasing": "swing",
                        "hideEasing": "swing",
                        "showMethod": "slideDown",
                        "hideMethod": "fadeOut"
                    });
                }
                if (response.Status == 1) {
                    toastr.success(response.Message);
                    $scope.Liga = {};
                    $location.path('/newLeague');

                }
            }, function (error) {
                $scope.ShowMessage = false;
            });
        };

        $scope.deleteLeague = function(Id) {
            SportLiga.deleteLeague(Id, function (response) {
                if (response.Status == 0) {
                    toastr.error(response.Message, "Error", {
                        "closeButton": true,
                        "positionClass": "toast-bottom-full-width",
                        "showEasing": "swing",
                        "hideEasing": "swing",
                        "showMethod": "slideDown",
                        "hideMethod": "fadeOut"
                    });
                }
                if (response.Status == 1) {
                    toastr.success(response.Message);
                    $scope.loadLeagues();
                }
            }, function (error) {
                $scope.ShowMessage = false;
            });
        };

 

        $scope.editLeague = function (liga) {
            //   var ligaPorEditar = $scope.getLigaPorParam();
            // var ligaPorEditar = $scope.getLiga(parseInt($stateParams.id));

          //  $scope.EditLeague = liga;
          //  $scope.idAnt = liga.Id;
            $scope.EditLeague.Id = liga.Id;
         //   $scope.nombreAnt = liga.NombreLiga;
            $scope.EditLeague.NombreLiga = liga.NombreLiga;
          //  $scope.paisAnt = liga.PaisLiga;
            $scope.EditLeague.PaisLiga = liga.PaisLiga;
          //  $scope.cantAnt = liga.CantEquipos;
            $scope.EditLeague.CantEquipos = liga.CantEquipos;
           // $scope.sitioAnt = liga.SitioWeb;
            $scope.EditLeague.SitioWeb = liga.SitioWeb;
            //  $scope.logoAnterior = Logo;
            //  $scope.Logo = Logo;
        //    $scope.estadoAnt = liga.IsArchived;
            $scope.EditLeague.IsArchived = liga.IsArchived;

        };

        $scope.finishEditingLeague = function () {
            for (var i = 0; i < $scope.teams.length; i++) {
                if ($scope.ligas[i].id === $scope.idAnt) {
                    $scope.ligas[i].nombre = $scope.NombreLiga;
                    $scope.ligas[i].pais = $scope.PaisLiga;
                    $scope.ligas[i].cantEquipos = $scope.CantEquipos;
                    $scope.ligas[i].sitioWeb = $scope.SitioWeb;
                    $scope.ligas[i].logo = $scope.Logo;
                    $scope.ligas[i].activa = $scope.Activa;
                }
            }

        };
      

        //Editar los partidos
        $scope.isEditingMatch = false;
        $scope.equipo1Anterior = "";
        $scope.equipo2Anterior = "";
        $scope.res1Anterior = "";
        $scope.res2Anterior = "";
        $scope.horaAnterior = "";
        $scope.estadoAnterior = "";
        $scope.lugarAnterior = "";

        $scope.editMatch = function(partido) {
            $scope.isEditingMatch = true;
            $scope.MatchEdit = {};
            $scope.MatchEdit.Team1 = $scope.FilterTeamsSelect[0];
            $scope.MatchEdit.Team2 = $scope.FilterTeamsSelect[0];
            $scope.MatchEdit.Id = partido.Id;
          //  $scope.equipo1Anterior = partido.Team1.Nombre;
          //   $scope.MatchEdit.Team1 = partido.Team1.League;
          //  $scope.equipo2Anterior = partido.Team2.Nombre ;
          //  $scope.MatchEdit.Team2 = partido.Team2.League;
          //  $scope.MatchEdit.Team1 = $scope.MatchEdit.Team1;
            $scope.res1Anterior = partido.ResultadoEquipo1;
            $scope.MatchEdit.ResultadoEquipo1 = partido.ResultadoEquipo1;
            $scope.res2Anterior = partido.ResultadoEquipo2;
            $scope.MatchEdit.ResultadoEquipo2 = partido.ResultadoEquipo2;

            $scope.horaAnterior = partido.HorayFecha;
            $scope.MatchEdit.HorayFecha = partido.HorayFecha;
            $scope.estadoAnterior = partido.IsArchived;
            $scope.MatchEdit.IsArchived = partido.IsArchived;
            $scope.lugarAnterior = partido.Lugar;
            $scope.MatchEdit.Lugar = partido.Lugar;
        };

        $scope.cancelEditingMatch = function() {
            $scope.isEditingMatch = false;
        };

        $scope.deleteMatch = function(Id) {
            SportLiga.deleteMatch(Id, function (response) {
                if (response.Status == 0) {
                    toastr.error(response.Message, "Error", {
                        "closeButton": true,
                        "positionClass": "toast-bottom-full-width",
                        "showEasing": "swing",
                        "hideEasing": "swing",
                        "showMethod": "slideDown",
                        "hideMethod": "fadeOut"
                    });
                }
                if (response.Status == 1) {
                    toastr.success(response.Message);
                    $scope.loadMatches();
                }
            }, function (error) {
                $scope.ShowMessage = false;
            });

        };

        $scope.addNewMatch = function() {
            $scope.Match.League = $scope.Match.League.Id;
            $scope.Match.Team1 = $scope.Match.Team1.Id;
            $scope.Match.Team2 = $scope.Match.Team2.Id;
            SportLiga.addMatch($scope.Match, function (response) {
                if (response.Status == 0) {
                    toastr.error(response.Message, "Error", {
                        "closeButton": true,
                        "positionClass": "toast-bottom-full-width",
                        "showEasing": "swing",
                        "hideEasing": "swing",
                        "showMethod": "slideDown",
                        "hideMethod": "fadeOut"
                    });
                }
                if (response.Status == 1) {
                    toastr.success(response.Message);
                    $scope.Match = {};
                    $location.path('/matches');

                }
            }, function (error) {
                $scope.ShowMessage = false;
            });
        };

        $scope.finishEditingMatch = function() {
            SportLiga.editMatch($scope.MatchEdit, function (response) {
                if (response.Status == 0) {
                    toastr.error(response.Message, "Error", {
                        "closeButton": true,
                        "positionClass": "toast-bottom-full-width",
                        "showEasing": "swing",
                        "hideEasing": "swing",
                        "showMethod": "slideDown",
                        "hideMethod": "fadeOut"
                    });
                }
                if (response.Status == 1) {
                    toastr.success(response.Message);
                    $scope.MatchEdit = {};
                    $scope.loadMatches();
                    $scope.MatchEdit = {};
                    $scope.isEditingMatch = false;
               
                }
                if (response.Status == 3) {
                    toastr.error(response.Message);
                  //  $window.location.reload();
                }
            }, function (error) {
                $scope.ShowMessage = false;
            });

            $scope.isEditingMatch = false;
            $scope.equipo1Anterior = "";
            $scope.equipo2Anterior = "";
            $scope.horaAnterior = "";
            $scope.NuevaHora = "";
            $scope.estadoAnterior = "";
              $scope.lugarAnterior = "";
       };


        //Predicciones
        $scope.temp = 0;
        $scope.tempPartido = function (id) {
            $scope.temp = id;
            $scope.PredictionModel = {};
        };


        $scope.PredictionModel = {};
        $scope.addPrediction = function (match) {
            $scope.PredictionModel.Match = $scope.temp;
            SportLiga.addPrediction($scope.PredictionModel, function (response) {
                if (response.Status == 0) {
                    toastr.error(response.Message, "Error", {
                        "closeButton": true,
                        "positionClass": "toast-bottom-full-width",
                        "showEasing": "swing",
                        "hideEasing": "swing",
                        "showMethod": "slideDown",
                        "hideMethod": "fadeOut"
                    });
                    $scope.PredictionModel = {};
                }
                if (response.Status == 1) {
                    toastr.success(response.Message);
                    $scope.loadLeagues();
                    $scope.loadMatches();
                    $scope.loadPredictions();
                    $scope.PredictionModel = {};
                }
            }, function (error) {
                $scope.ShowMessage = false;
            });

        };


    }
]);