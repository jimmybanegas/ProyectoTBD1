namespace Pharma.Application.API.Models
{
    public class LocationModel
    {
        public long Id { get; set; }
        public bool IsArchived { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
    }
}