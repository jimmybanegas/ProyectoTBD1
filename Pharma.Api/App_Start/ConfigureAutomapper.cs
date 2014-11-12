

using AutoMapper;
using Pharma.Api.Models;
using Pharma.Domain.Entities;

namespace Pharma.Api
{
    public class ConfigureAutomapper : IBootstrapperTask
    {
        #region IBootstrapperTask Members

        public void Run()
        {
            //automappings go here
            //Ex: Mapper.CreateMap<SomeType, SomeOtherType>().ReverseMap();
         //   Mapper.CreateMap<AccountRegisterModel, Account>().ReverseMap();
         //   Mapper.CreateMap<CreatedAccountModel, Account>().ReverseMap();
            Mapper.CreateMap<Leagues, LeaguesModel>().ReverseMap();
        }

        #endregion
    }
}