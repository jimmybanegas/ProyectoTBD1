using System;

namespace Pharma.Application.API.Models
{
    public class UpdateGameModel
    {
        public long Id { get; set; }
        public TeamModel HomeTeam { get; set; }
        public TeamModel AwayTeam { get; set; }
        public DateTime MatchDate { get; set; }
    }
}