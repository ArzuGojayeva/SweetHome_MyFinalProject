using Microsoft.AspNetCore.Mvc;
using SweetHome.DAL;

namespace SweetHome.Controllers
{
    public class FaqController : Controller
    {
        private readonly AppDbContext _context;
        public FaqController(AppDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View(_context.Faq.Take(3).ToList());
        }
    }
}
