using System.Collections.Generic;
using System.Linq;
using Pharma.Domain.Services;

namespace Pharma.Domain.Entities
{
    public class Account : IEntity
    {
        public virtual long Id { get; set; }

        public virtual bool IsArchived { get; set; }

        public virtual string Country { get; set; }

        public virtual string Email { get; set; }

        public virtual string Role { get; set; }

        public virtual string Name { get; set; }

        public virtual string Password { get; set; }

        public virtual IEnumerable<Prediction> Predictions { get; set; }

        //private IEnumerable<League> _leagues = new List<League>();

        //public virtual IEnumerable<League> Leagues
        //{
        //    get { return _leagues; }
        //    protected set { this._leagues = value; }
        //}

        //public virtual void AddLeagues(League league)
        //{
        //    if (Leagues.All(x => x.Id == league.Id))
        //    {
        //        ((IList<League>)Leagues).Add(league);
        //    }
        //}

        public virtual void AddPrediction(Prediction prediction)
        {
            if (Predictions.All(x => x.Id == prediction.Id))
            {
                ((IList<Prediction>)Predictions).Add(prediction);
            }
        }

        //public virtual void RemoveLeagues(long leagueId)
        //{
        //    var league = Leagues.FirstOrDefault(x => x.Id == leagueId);
        //    if (league != null)
        //    {
        //        ((IList<League>) Leagues).Remove(league);
        //    }
        //}

        public virtual void RemovePrediction(long predictionId)
        {
            var prediction = Predictions.FirstOrDefault(pred => pred.Id == predictionId);
            if (prediction != null)
            {
                ((IList<Prediction>)Predictions).Remove(prediction);
            }
        }

        public virtual bool PasswordsEqual(string testPassword)
        {
            IEncryption encryptor = new Sha256Encrypter();
            string hashedTestPassword = encryptor.Encrypt(testPassword);
            return (Password == hashedTestPassword);
        }
    }
}
