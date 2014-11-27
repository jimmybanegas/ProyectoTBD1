namespace Pharma.Domain.Entities
{
    public class Account : IEntity
    {
       
        public virtual long Id { get; set; }
        public virtual string FirstName { get; set; }
        public virtual string LastName { get; set; }
        public virtual string Email { get; set; }
        public virtual string Password { get; set; }
        public virtual byte[] EncryptKey { get; set; }
        public virtual byte[] EncryptIV { get; set; }
        public virtual bool IsArchived { get; set; }
 
    }
}