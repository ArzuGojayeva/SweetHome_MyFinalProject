using Microsoft.AspNetCore.Mvc;
using SweetHome.DAL;
using SweetHome.ViewModels;

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
            HomeVM homeVM = new HomeVM()
            {
                Teams=_context.Teams.ToList(),
            };
            return View(homeVM);
        }
    }
}
