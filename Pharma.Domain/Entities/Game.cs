using System;

namespace Pharma.Domain.Entities
{
    public class Game : IEntity
    {
        public virtual long Id { get; set; }
        public virtual bool IsArchived { get; set; }
        public virtual Team HomeTeam { get; set; }
        public virtual Team AwayTeam { get; set; }
        public virtual DateTime MatchDate { get; set; }
        public virtual Result Result { get; set; }
        public virtual bool Completed { get; set; }
    }
}