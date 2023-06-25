using Microsoft.AspNetCore.Mvc;
using SweetHome.DAL;

namespace SweetHome.Controllers
{
    public class ShopController : Controller
    {
        private readonly AppDbContext _context;
        public ShopController(AppDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }
    }
}
