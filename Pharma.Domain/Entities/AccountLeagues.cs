namespace Pharma.Domain.Entities
{
    public class AccountLeagues : IEntity
    {
        public virtual long Id { get; set; }
        public virtual bool IsArchived { get; set; }

        public virtual Account User { get; set; }
        public virtual Leagues League { get; set; }
    }
}