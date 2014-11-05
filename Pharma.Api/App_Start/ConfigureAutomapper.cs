

using AutoMapper;
using NHibernate.Mapping;
using PrediLiga.Domain.Entities;
using Pharma.Api.Controllers;
using Pharma.Api.Models;

namespace Pharma.Api
{
    public class ConfigureAutomapper : IBootstrapperTask
    {
        #region IBootstrapperTask Members

        public void Run()
        {
            //automappings go here
            //Ex: Mapper.CreateMap<SomeType, SomeOtherType>().ReverseMap();
            Mapper.CreateMap<AccountRegisterModel, Account>().ReverseMap();
            Mapper.CreateMap<CreatedAccountModel, Account>().ReverseMap();
            Mapper.CreateMap<Leagues, LeaguesModel>().ReverseMap();
        }

        #endregion
    }
}