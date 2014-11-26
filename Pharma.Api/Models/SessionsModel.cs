using System;
using Pharma.Domain.Entities;

namespace Pharma.Api.Models
{
    public class SessionsModel
    {
        public Account User { get; set; }
        public DateTime LoginDate { get; set; }
        public DateTime ExpirationTime { get; set; }
        public string Token { get; set; }

    }
}