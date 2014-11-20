namespace Pharma.Domain.Entities
{
    public class Leagues : IEntity
    {
        public virtual string Name { get; set; }
        public virtual long Id { get; set; }
        public virtual bool IsArchived { get; set; }
    }
}