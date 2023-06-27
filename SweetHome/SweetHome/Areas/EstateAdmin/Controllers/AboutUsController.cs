using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SweetHome.DAL;
using SweetHome.Models;

namespace SweetHome.Areas.EstateAdmin.Controllers
{
    [Area("EstateAdmin")]
    public class AboutUsController : Controller
    {
        private readonly AppDbContext _context;
        public AboutUsController(AppDbContext context)
        {
            _context= context;
        }
        public IActionResult Index()
        {
            return View(_context.About.ToList());
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(About about)
        {
            if (!ModelState.IsValid) { return View(); }
            if (about == null) { return View(); }
            await _context.About.AddAsync(about);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Edit(int id)
        {
            return View(await _context.About.FirstOrDefaultAsync(x => x.Id == id));
        }
        [HttpPost]
        public async Task<IActionResult> Edit(About about)
        {
            About? exist = await _context.About.FirstOrDefaultAsync(x => x.Id ==about.Id);
            if (!ModelState.IsValid) { return View(); }
            if (exist == null) { return View(); }
            exist.Name = about.Name;
            exist.Icon = about.Icon;
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Delete(int id)
        {
            About? exist = await _context.About.FirstOrDefaultAsync(x => x.Id == id);
            if (!ModelState.IsValid) { return View(); }
            if (exist == null) { return View(); }
            _context.About.Remove(exist);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }

    }
}
