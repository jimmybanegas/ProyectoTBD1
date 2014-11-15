namespace Pharma.Domain.Entities
{
    public class AccountGamePrediction : IEntity
    {
        public virtual long Id { get; set; }
        public virtual bool IsArchived { get; set; }
        public virtual Prediction Prediction { get; set; }
        public virtual Game Game { get; set; }
        public virtual League League { get; set; }
        public virtual Account User { get; set; }
    }
}
