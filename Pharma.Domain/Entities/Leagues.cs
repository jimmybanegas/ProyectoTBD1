namespace Pharma.Domain.Entities
{
    public class Leagues 
    {
        public virtual string Name { get; set; }
        public virtual long Id { get; set; }
        public virtual bool IsArchived { get; set; }
    }
}