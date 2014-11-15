using System.Collections.Generic;
using System.Linq;

namespace Pharma.Domain.Entities
{
    public class League : IEntity
    {
        public virtual long Id { get; set; }
        public virtual bool IsArchived { get; set; }
        public virtual string Name { get; set; }
        public virtual string Country { get; set; }
        public virtual IEnumerable<Team> Teams { get; set; }
        public virtual IEnumerable<Game> Games { get; set; }

        public virtual void AddGame(Game game)
        {
            if (Games.All(x => x.Id == game.Id))
            {
                ((IList<Game>)Games).Add(game);
            }
        }
    }
}