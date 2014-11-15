using AutoMapper;
using Pharma.Application.API.App_Start;
using Pharma.Application.API.Models;
using Pharma.Domain.Entities;

namespace Pharma.Application.API
{
    public class ConfigureAutomapper : IBootstrapperTask
    {
        public void Run()
        {
            //automappings go here
            //Ex: Mapper.CreateMap<SomeType, SomeOtherType>().ReverseMap();
            Mapper.CreateMap<AccountSignUpModel, Account>().ReverseMap();
            Mapper.CreateMap<Account, AccountRegisteredModel>().ReverseMap();
            Mapper.CreateMap<League, LeagueModel>().ReverseMap();
            Mapper.CreateMap<League, NewLeagueModel>().ReverseMap();
            Mapper.CreateMap<League, LeagueCreatedModel>().ReverseMap();
            Mapper.CreateMap<NewTeamModel, Team>().ReverseMap();
            Mapper.CreateMap<TeamUpdateModel, Team>().ReverseMap();
            Mapper.CreateMap<LeagueUpdateModel, League>().ReverseMap();
            Mapper.CreateMap<UpdateGameModel, Game>().ReverseMap();
            Mapper.CreateMap<ResultDataModel, Prediction>().ReverseMap();
            Mapper.CreateMap<ResultDataModel, Result>().ReverseMap();
            Mapper.CreateMap<TeamModel, Team>().ReverseMap();
            Mapper.CreateMap<GameModel, Game>().ReverseMap();
            Mapper.CreateMap<LocationModel, Location>().ReverseMap();
            Mapper.CreateMap<Stadium, Stadium>().ReverseMap();
            Mapper.CreateMap<Account, UserModel>().ReverseMap();
        }
    }
}