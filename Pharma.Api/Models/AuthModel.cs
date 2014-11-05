using Pharma.Api.Controllers;

namespace Pharma.Api.Models
{
    public class AuthModel
    {
        public string email { get; set; }
        public string access_token { get; set; }
        public RoleModel role { get; set; }

    }
}