using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using Pharma.Application.API.Models;

namespace Pharma.Application.API.Controllers
{
    public class BaseApiController : ApiController
    {
        protected UserTokenModel GetUserTokenModel()
        {
            IEnumerable<string> headerValues = Request.Headers.GetValues("Authorization");
            var authorizationToken = headerValues.FirstOrDefault();
            var userTokenModel = AuthRequestFactory.BuildDecryptedRequest(authorizationToken);
            return userTokenModel;
        }
    }
}