using System;
using Pharma.Domain.Entities;

namespace Pharma.Application.API.Models
{
    public class NewGameModel
    {
        public Team HomeTeam { get; set; }
        public Team AwayTeam { get; set; }
        public DateTime MatchDate { get; set; }
    }
}