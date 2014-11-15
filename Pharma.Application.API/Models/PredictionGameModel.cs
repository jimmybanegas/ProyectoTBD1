using System;
using Pharma.Domain.Entities;

namespace Pharma.Application.API.Models
{
    public class PredictionGameModel
    {
        public string LeagueName { get; set; }
        public string HomeTeamName { get; set; }
        public string AwayTeamName { get; set; }
        public DateTime MatchDate { get; set; }
        public int HomeTeamGoals { get; set; }
        public int AwayTeamGoals { get; set; }
        public int HomeTeamPenalties { get; set; }
        public int AwayTeamPenalties { get; set; }
        public WinnerTeam Winner { get; set; }
    }
}