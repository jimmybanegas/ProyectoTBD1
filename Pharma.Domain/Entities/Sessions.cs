using System;

namespace Pharma.Domain.Entities
{
    public class Sessions : IEntity
    {
        public virtual long Id { get; set; }
        public virtual Account User { get; set; }
        public virtual DateTime LoginDate { get; set; }
        public virtual DateTime ExpirationTime { get; set; }
        public virtual string Token { get; set; }
        public virtual bool IsArchived { get; set; }


    }
}
