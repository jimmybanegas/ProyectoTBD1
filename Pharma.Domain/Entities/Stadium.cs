namespace Pharma.Domain.Entities
{
    public class Stadium : IEntity
    {
        public virtual long Id { get; set; }
        public virtual bool IsArchived { get; set; }
        public virtual string Name { get; set; }
        public virtual string Country { get; set; }
        public virtual string City { get; set; }
        public virtual Location Location { get; set; }
    }
}
