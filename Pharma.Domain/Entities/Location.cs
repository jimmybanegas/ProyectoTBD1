namespace Pharma.Domain.Entities
{
    public class Location : IEntity
    {
        public virtual double Latitude { get; set; }
        public virtual double Longitude { get; set; }
        public virtual long Id { get; set; }
        public virtual bool IsArchived { get; set; }
    }
}