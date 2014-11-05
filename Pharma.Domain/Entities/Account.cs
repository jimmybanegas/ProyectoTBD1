using System.Collections;
using System.Collections.Generic;
using System.Linq;

namespace Pharma.Domain.Entities
{
    public class Account : IEntity
    {
        public virtual long Id { get; set; }
        public virtual bool IsArchived { get; set; }

        public virtual string Email { get; set; }

        public virtual string Name { get; set; }

        public virtual string Password { get; set; }

        //public virtual IEnumerable<Leagues> Leagues
        //{
        //    get { return _leagues; }
        //    protected set { this._leagues = value; }
        //}

        public virtual bool CheckPassword(string password)
        {
            return true;
        }

        //IEnumerable<Leagues> _leagues = new List<Leagues>();

        //public virtual void AddLeagues(Leagues league)
        //{
        //    if (!Leagues.All(x => x.Id == league.Id))
        //    {
        //        ((IList<Leagues>)Leagues).Add(league);
        //    }
        //}

        //public virtual void RemoveLeages(long leagueId)
        //{
        //    var league = Leagues.FirstOrDefault(x => x.Id == leagueId);
        //    if (league != null)
        //    {
        //        ((IList<Leagues>) Leagues).Remove(league);
        //    }
        //}

    }
}