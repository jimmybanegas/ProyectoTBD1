using System.Collections.Generic;
using System.Security.Cryptography.X509Certificates;
using DomainDrivenDatabaseDeployer;
using FluentNHibernate.Testing.Values;
using NHibernate;
using PrediLiga.Domain.Entities;

namespace Pharma.DatabaseDeployer
{
    public class AccountSeeder : IDataSeeder
    {
        readonly ISession _session;

        public AccountSeeder(ISession session)
        {
            _session = session;
        }

        public void Seed()
        {

            var account = new Account
            {
                Email = "test@test.com",
                Name = "Test Name",
                Password = "password",
            };
            _session.Save(account);
        }
    }
}