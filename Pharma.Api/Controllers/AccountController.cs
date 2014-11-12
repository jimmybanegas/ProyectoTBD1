using System.Net;
using System.Web;
using System.Web.Http;
using AttributeRouting.Web.Mvc;
using AutoMapper;
using Pharma.Api.Models;
using Pharma.Domain.Entities;
using Pharma.Domain.Services;

namespace Pharma.Api.Controllers
{
    public class AccountController : BaseApiController
    {
      /*  readonly IReadOnlyRepository _readOnlyRepository;
        readonly IWriteOnlyRepository _writeOnlyRepository;
        readonly IMappingEngine _mappingEngine;


        public AccountController(IReadOnlyRepository readOnlyRepository, IWriteOnlyRepository writeOnlyRepository, IMappingEngine mappingEngine)
        {
            _readOnlyRepository = readOnlyRepository;
            _writeOnlyRepository = writeOnlyRepository;
            _mappingEngine = mappingEngine;
        }

        [HttpPost]
        [AcceptVerbs("POST", "HEAD")]
        [POST("register")]
        public CreatedAccountModel Register([FromBody] AccountRegisterModel model)
        {
            var newUser = _mappingEngine.Map<AccountRegisterModel, Account>(model);
            var createdUser = _writeOnlyRepository.Create(newUser);
            var craetedUserModel = _mappingEngine.Map<Account, CreatedAccountModel>(createdUser);
            return craetedUserModel;
        }


        [HttpPost]
        [AcceptVerbs("POST", "HEAD")]
        [POST("login")]
        public AuthModel Login([FromBody] AccountLoginModel model)
        {
            var user = _readOnlyRepository.FirstOrDefault<Account>(x => x.Email == model.Email);
            if (user == null) throw new HttpException((int)HttpStatusCode.NotFound, "User doesn't exist.");
            if (!user.CheckPassword(model.Password))
                throw new HttpException((int)HttpStatusCode.Unauthorized, "Password doesn't match.");

            var authModel = new AuthModel
            {
                email = user.Email,
                access_token = AuthRequestFactory.BuildEncryptedRequest(user.Email),
                role = new RoleModel
                {
                    bitMask = 2,
                    title = "admin"
                }
            };

            return authModel;
        }

        */
    }
}