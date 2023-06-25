using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SweetHome.DAL;
using SweetHome.Models;

namespace SweetHome.Areas.EstateAdmin.Controllers
{
    [Area("EstateAdmin")]
    public class HomeTypeController : Controller
    {
        private readonly AppDbContext _context;

        public HomeTypeController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View(_context.HomeTypes.ToList());
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(HomeType homeType)
        {
            if (!ModelState.IsValid) { return View(); }
            if (homeType == null) { return View(); }
            await _context.HomeTypes.AddAsync(homeType);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Edit(int id)
        {
            return View(await _context.HomeTypes.FirstOrDefaultAsync(x => x.Id == id));
        }
        [HttpPost]
        public async Task<IActionResult> Edit(HomeType homeType)
        {
            HomeType? exist = await _context.HomeTypes.FirstOrDefaultAsync(x => x.Id == homeType.Id);
            if (!ModelState.IsValid) { return View(); }
            if (exist == null) { return View(); }
            exist.Name = homeType.Name;
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Delete(int id)
        {
            HomeType? exist = await _context.HomeTypes.FirstOrDefaultAsync(x => x.Id == id);
            if (!ModelState.IsValid) { return View(); }
            if (exist == null) { return View(); }
            _context.HomeTypes.Remove(exist);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
    }
}
