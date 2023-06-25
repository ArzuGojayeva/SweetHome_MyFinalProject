using Microsoft.AspNetCore.Mvc;
using SweetHome.DAL;

namespace SweetHome.Controllers
{
    public class AboutController : Controller
    {
        private readonly AppDbContext _context;

        public AboutController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }
    }
}
