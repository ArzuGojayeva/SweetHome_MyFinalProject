using Microsoft.AspNetCore.Mvc;
using SweetHome.DAL;

namespace SweetHome.Controllers
{
    public class ContactUsController : Controller
    {
        private readonly AppDbContext _context;
        public ContactUsController(AppDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View(_context.Contacts.Take(3).ToList());
        }
    }
}
