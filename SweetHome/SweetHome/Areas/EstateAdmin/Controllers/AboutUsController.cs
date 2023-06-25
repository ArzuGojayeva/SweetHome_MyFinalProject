using Microsoft.AspNetCore.Mvc;
using SweetHome.DAL;

namespace SweetHome.Areas.EstateAdmin.Controllers
{
    public class AboutUsController : Controller
    {
        private readonly AppDbContext _context;
        public AboutUsController(AppDbContext context)
        {
            _context= context;
        }
        public IActionResult Index()
        {
            return View();
        }
    }
}
