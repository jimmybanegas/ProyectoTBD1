using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Http;
using AttributeRouting.Web.Mvc;
using AutoMapper;
using Pharma.Application.API.Models;
using Pharma.Domain.Entities;
using Pharma.Domain.Services;

namespace Pharma.Application.API.Controllers
{
    public class TeamsController : BaseApiController
    {
        private readonly IReadOnlyRepository _readOnlyRepository;
        private readonly IWriteOnlyRepository _writeOnlyRepository;
        private readonly IMappingEngine _mappingEngine;


        public TeamsController(IReadOnlyRepository readOnlyRepository, IWriteOnlyRepository writeOnlyRepository, IMappingEngine mappingEngine)
        {
            _readOnlyRepository = readOnlyRepository;
            _writeOnlyRepository = writeOnlyRepository;
            _mappingEngine = mappingEngine;
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("leagues/{leagueId}/teams")]
        public List<TeamModel> GetTeamsForLeagueWithId(long leagueId)
        {
            League foundLeague = _readOnlyRepository.FirstOrDefault<League>(x => x.Id == leagueId);
            if (foundLeague == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "The league can not be found. Please check the Id");

            List<TeamModel> teamsInLeague = _mappingEngine.Map<List<Team>, List<TeamModel>>(foundLeague.Teams.ToList());
            return teamsInLeague;
        }

        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("leagues/{leagueId}/teams/get/{teamId}")]
        public TeamModel GetTeam([FromUri]long leagueId, [FromUri]long teamId)
        {
            League foundLeague = _readOnlyRepository.FirstOrDefault<League>(le => le.Id == leagueId);
            if (foundLeague == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "League not found");

            Team foundTeam = _readOnlyRepository.FirstOrDefault<Team>(te => te.Id == teamId);
            if (foundTeam == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "Team not found");

            TeamModel teamModel = _mappingEngine.Map<Team, TeamModel>(foundTeam);

            return teamModel;
        }

        [HttpPost]
        [AcceptVerbs("POST", "HEAD")]
        [POST("leagues/{leagueId}/teams/createteam")]
        public TeamCreatedModel AddTeamToLeague([FromUri]long leagueId, [FromBody] NewTeamModel model)
        {
            League foundLeague = _readOnlyRepository.FirstOrDefault<League>(x => x.Id == leagueId);
            if (foundLeague == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "The league can not be found. Please check the Id");
            Team foundTeam = foundLeague.Teams.FirstOrDefault(x => x.Name == model.Name);
            if (foundTeam != null)
                throw new HttpException((int)HttpStatusCode.NotFound, "A team with this name already exist");

            foundTeam = _mappingEngine.Map<NewTeamModel, Team>(model);
            var teamList = foundLeague.Teams.ToList();
            teamList.Add(foundTeam);
            foundLeague.Teams = teamList;
            _writeOnlyRepository.Update(foundLeague);
            return new TeamCreatedModel() { Value = "Successfully created a new team" };
        }

        [HttpPost]
        [AcceptVerbs("POST", "HEAD")]
        [POST("leagues/{leagueId}/teams/editteam")]
        public UpdatedTeamModel EditTeam([FromUri]long leagueId, [FromBody] TeamUpdateModel model)
        {
            League foundLeague = _readOnlyRepository.FirstOrDefault<League>(x => x.Id == leagueId);
            if (foundLeague == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "The league can not be found. Please check the Id");
            Team foundTeam = foundLeague.Teams.FirstOrDefault(x => x.Id == model.Id);
            if (foundTeam == null)
                throw new HttpException((int)HttpStatusCode.Conflict, "A team with this Id was not found");
            foundTeam = _mappingEngine.Map<TeamUpdateModel, Team>(model, foundTeam);
            _writeOnlyRepository.Update(foundTeam);

            return new UpdatedTeamModel() { Value = "Successfully Edited Team" };
        }

        [HttpGet]
        [AcceptVerbs("POST", "HEAD")]
        [POST("leagues/{leagueId}/teams/deleteteam/{teamId}")]
        public DeletedTeamModel ArchiveTeam([FromUri] long leagueId, [FromUri] long teamId)
        {
            League foundLeague = _readOnlyRepository.FirstOrDefault<League>(x => x.Id == leagueId);
            if (foundLeague == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "The league can not be found. Please check the Id");

            Team foundTeam = foundLeague.Teams.FirstOrDefault(x => x.Id == teamId);
            if (foundTeam == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "A team with this Id was not found");

            foundTeam.IsArchived = true;
            _writeOnlyRepository.Update(foundTeam);

            return new DeletedTeamModel() { Value = "Successfully archived the team" };
        }

        [HttpGet]
        [AcceptVerbs("POST", "HEAD")]
        [POST("leagues/{leagueId}/teams/restoreteam/{teamId}")]
        public RestoredTeamModel RestoreTeam([FromUri] long leagueId, [FromUri] long teamId)
        {
            League foundLeague = _readOnlyRepository.FirstOrDefault<League>(x => x.Id == leagueId);
            if (foundLeague == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "The league can not be found. Please check the Id");

            Team foundTeam = foundLeague.Teams.FirstOrDefault(x => x.Id == teamId);
            if (foundTeam == null)
                throw new HttpException((int)HttpStatusCode.NotFound, "A team with this Id was not found");

            foundTeam.IsArchived = false;
            _writeOnlyRepository.Update(foundTeam);

            return new RestoredTeamModel() { Value = "Successfully archived the tem" };
        }
    }
}