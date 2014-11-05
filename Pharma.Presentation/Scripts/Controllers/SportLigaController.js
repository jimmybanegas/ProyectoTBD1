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

        $scope.loadLeagues = function () {
            SportLiga.getAvailableLeagues(function (ligas) {
                $scope.ligas = ligas;
            }, function (error) {
                alert('error loading available leagues');
            });

            SportLiga.getSuscribedLeagues(function (misLigas) {
                $scope.misLigas = misLigas;
            }, function (error) {
                alert('error loading available leagues');
            });
        };

       
          $scope.loadTeams = function () {
            SportLiga.getAvailableTeams(function (teams) {
                $scope.teams = teams;
                $scope.FilterTeams = [];
                for (var i = 0; i < $scope.teams.length; i++) {
                    if ($scope.teams[i].Liga.toString() === $stateParams.id) {
                        $scope.FilterTeams.push($scope.teams[i]);
                    }
                }
            }, function (error) {
                alert('error loading available teams');
            });
        };

        $scope.loadMatches = function () {
            SportLiga.getAvailableMatches(function (partidos) {
                $scope.partidos = partidos;

                $scope.PartidosFiltrados = [];
                for (var i = 0; i < $scope.partidos.length; i++) {
                    if ($scope.partidos[i].League === parseInt($stateParams.id)) {
                        $scope.PartidosFiltrados.push($scope.partidos[i]);
                    }
                }
            }, function (error) {
                alert('error loading available matchess');
            });

            SportLiga.getSuscribedMatches(function (misPartidos) {
                $scope.misPartidos = misPartidos;
            }, function (error) {
                alert('error loading available matches');
            });
        };

        $scope.loadPredictions = function () {
            SportLiga.getAvailablePredictions(function (misPredicciones) {
                $scope.misPredicciones = misPredicciones;
            }, function (error) {
                alert('error loading available predictions');
            });
        };

        $scope.loadSuscriptors = function (Id) {
            SportLiga.getSuscriptors(Id,function (suscriptores) {
                $scope.suscriptores = suscriptores;
            }, function (error) {
                alert('error loading available suscriptors');
            });
        };

        $scope.loadPositions = function () {
            SportLiga.getPositions(function (posiciones) {
                $scope.posiciones = posiciones;
            }, function (error) {
                alert('error loading available posicions');
            });
        };

        
        $scope.getPrediction = function (id) {
            for (var i = 0; i < $scope.misPredicciones.length; i++)
                if ($scope.misPredicciones[i].Partido === id)
                    return $scope.misPredicciones[i];
        };

       $scope.getTeam = function(id) {
            for (var i = 0; i < $scope.teams.length; i++)
                if ($scope.teams[i].Id === id)
                    return $scope.teams[i];
        };
        
        $scope.setParametro = function(idLiga) {
            $scope.parametro = idLiga;
        };

        $scope.getTeamPorLiga = function() {
            $scope.equipos = [];
            for (var i = 0; i < $scope.teams.length; i++) {
                if ($scope.teams[i].Liga === parseInt($stateParams.id)) {
                    $scope.equipos.push($scope.teams[i]);
                }
            }
            return $scope.equipos;
        };

        $scope.getTeamsPorLiga = function(id) {
            $scope.equipos = [];
            for (var i = 0; i < $scope.teams.length; i++) {
                if ($scope.teams[i].Id === id) {
                    $scope.equipos.push($scope.teams[i]);
                }
            }
            return $scope.equipos;
        };
      
        $scope.getLiga = function (id) {
            for (var i = 0; i < $scope.misLigas.length; i++)
                if ($scope.misLigas[i].Id === id)
                    return $scope.misLigas[i];
        };

        $scope.getLigaPorParam = function() {
            $scope.loadLeagues();
            for (var i = 0; i < $scope.ligas.length; i++) {
                if ($scope.ligas[i].Id === parseInt($stateParams.id))
                    return $scope.ligas[i];
            }
            return null;
        };
        
      
        $scope.Match = {};
        $scope.inicio2 = function (id) {
            $scope.FilterTeamsSelect = [];
            $scope.loadTeams();

            for (var i = 0; i < $scope.teams.length; i++) {
                if (parseInt($scope.teams[i].Liga) === parseInt(id)) {
                    $scope.FilterTeamsSelect.push($scope.teams[i]);
                }
            }
            $scope.Match.Team1 = $scope.FilterTeamsSelect[0];
            $scope.Match.Team2 = $scope.FilterTeamsSelect[0];
        };

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

        $scope.EditLeague = {};
     /*   $scope.idAnt = "";
        //    $scope.EditLeague.Id = "";
        $scope.nombreAnt = "";
        //  $scope.EditLeague.NombreLiga = "";
        $scope.logoAnt = "";
        //    $scope.EditLeague.Logo = "";
        $scope.sitioAnt = "";
        //       $scope.EditLeague.SitioWeb = "";
        $scope.estadoAnt = "";
        //     $scope.EditLeague.IsArchived = "";
        $scope.cantAnt = "";
        //     $scope.EditLeague.CantEquipos = "";
        $scope.paisAnt = "";
        //  $scope.EditLeague.PaisLiga = "";*/

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


        //Controlar la la parte de las ligas, suscripcion
        $(document).on('click', '.panel-heading span.clickable', function(e) {
            var $this = $(this);
            if (!$this.hasClass('panel-collapsed')) {
                $this.parents('.panel').find('.panel-body').slideUp();
                $this.addClass('panel-collapsed');
                $this.find('i').removeClass('glyphicon-minus').addClass('glyphicon-plus');
            } else {
                $this.parents('.panel').find('.panel-body').slideDown();
                $this.removeClass('panel-collapsed');
                $this.find('i').removeClass('glyphicon-plus').addClass('glyphicon-minus');
            }
        });
        $(document).on('click', '.panel div.clickable', function(e) {
            var $this = $(this);
            if (!$this.hasClass('panel-collapsed')) {
                $this.parents('.panel').find('.panel-body').slideUp();
                $this.addClass('panel-collapsed');
                $this.find('i').removeClass('glyphicon-minus').addClass('glyphicon-plus');
            } else {
                $this.parents('.panel').find('.panel-body').slideDown();
                $this.removeClass('panel-collapsed');
                $this.find('i').removeClass('glyphicon-plus').addClass('glyphicon-minus');
            }
        });
        $(document).ready(function() {
            $('.panel-heading span.clickable').click();
            $('.panel div.clickable').click();
        });

    }
]);