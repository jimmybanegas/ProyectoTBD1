namespace Pharma.Application.API.Models
{
    public class LeagueModel
    {
        public long Id { get; set; }
        public bool IsArchived { get; set; }
        public string Name { get; set; }
        public string Country { get; set; }
    }
}