using Microsoft.AspNetCore.Mvc;
using SweetHome.DAL;
using SweetHome.ViewModels;

namespace SweetHome.Controllers
{
    public class HomeController : Controller
    {
        private readonly AppDbContext _context;
        public HomeController(AppDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            HomeVM homeVM= new HomeVM()
            {
                Sliders=_context.Sliders.Take(2).ToList(),
            };    
            return View(homeVM);
        }
    }
}
