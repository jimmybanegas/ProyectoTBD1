namespace Pharma.Domain.Entities
{
    public class Prediction : IEntity
    {
        public virtual long Id { get; set; }
        public virtual bool IsArchived { get; set; }

        /// <summary>
        /// if the user get the goals right he get 2 points per team
        /// </summary>
        public virtual int HomeTeamGoals { get; set; }
        public virtual int AwayTeamGoals { get; set; }

        /// <summary>
        /// if there were penalties after the game and the user get them right they get 1 point
        /// if in addition they got the goals right they gets 5 points
        /// </summary>
        public virtual int HomeTeamPenalties { get; set; }
        public virtual int AwayTeamPenalties { get; set; }

        /// <summary>
        /// get this right costs two points
        /// </summary>
        public virtual WinnerTeam Winner { get; set; }
        public virtual int Points { get; set; }
    }
}
