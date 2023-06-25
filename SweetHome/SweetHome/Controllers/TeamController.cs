using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SweetHome.DAL;

namespace SweetHome.Controllers
{
    public class TeamController : Controller
    {
        private readonly AppDbContext _context;

        public TeamController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View(_context.Teams.ToList());
        }
        public async Task<IActionResult> Detail(int id)
        {
            return View(await _context.Teams.FirstOrDefaultAsync(x=>x.Id== id));
        }
    }
}
