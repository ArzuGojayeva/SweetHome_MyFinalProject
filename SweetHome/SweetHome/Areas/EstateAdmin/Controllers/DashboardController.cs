using Microsoft.AspNetCore.Mvc;

namespace SweetHome.Areas.EstateAdmin.Controllers
{
    [Area("EstateAdmin")]
    public class DashboardController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
