using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SweetHome.DAL;
using SweetHome.Models;

namespace SweetHome.Areas.EstateAdmin.Controllers
{
    [Area("EstateAdmin")]
    [Authorize(Roles ="admin")]
    public class SettingController : Controller
    {
        private readonly AppDbContext _context;
        public SettingController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View(_context.Settings.ToList());
        }
        public async Task<IActionResult> Edit(int id)
        {
            return View(await _context.Settings.FirstOrDefaultAsync(x => x.Id == id));
        }
        [HttpPost]
        public async Task<IActionResult> Edit(Settings settings)
        {
            Settings? exist = await _context.Settings.FirstOrDefaultAsync(x => x.Id == settings.Id);
            if (exist == null) { return View(); }
            exist.Value = settings.Value;
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Delete(int id)
        {
            Settings? exist = await _context.Settings.FirstOrDefaultAsync(x => x.Id == id);
            if (!ModelState.IsValid) { return View(); }
            if (exist == null) { return View(); }
            _context.Settings.Remove(exist);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
    }
}
