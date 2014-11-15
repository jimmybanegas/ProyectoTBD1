namespace Pharma.Application.API.Models
{
    public class TeamModel
    {
        public long Id { get; set; }
        public bool IsArchived { get; set; }
        public string Name { get; set; }
        public string City { get; set; }
    }
}