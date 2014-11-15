using System.Web.Mvc;
using AttributeRouting.Web.Mvc;

namespace Pharma.Application.API.Controllers
{
    public class HomeController : Controller
    {
        [GET("/")]
        public ActionResult Index()
        {
            return View();
        }
    }
}
