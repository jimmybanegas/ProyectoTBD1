namespace Pharma.Domain.Entities
{
    public class GameStadium : IEntity
    {
        public virtual long Id { get; set; }
        public virtual bool IsArchived { get; set; }
        public virtual Game Game { get; set; }
        public virtual Stadium Stadium { get; set; }
    }
}
