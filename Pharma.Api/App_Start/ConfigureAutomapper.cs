

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
        }

        #endregion
    }
}