using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SweetHome.DAL;
using SweetHome.Models;

namespace SweetHome.Areas.EstateAdmin.Controllers
{
    [Area("EstateAdmin")]
    public class AminitiesController : Controller
    {
        private readonly AppDbContext _context;
        public AminitiesController(AppDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View(_context.Aminities.ToList());
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(Aminities aminities)
        {
            if (!ModelState.IsValid) { return View(); }
            if (aminities== null) { return View(); }
            await _context.Aminities.AddAsync(aminities);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Edit(int id)
        {
            return View(await _context.Aminities.FirstOrDefaultAsync(x => x.Id == id));
        }
        [HttpPost]
        public async Task<IActionResult> Edit(Aminities aminities)
        {
            Aminities? exist = await _context.Aminities.FirstOrDefaultAsync(x => x.Id == aminities.Id);
            if (!ModelState.IsValid) { return View(); }
            if (exist == null) { return View(); }
            exist.Name = aminities.Name;
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Delete(int id)
        {
            Aminities? exist = await _context.Aminities.FirstOrDefaultAsync(x => x.Id == id);
            if (!ModelState.IsValid) { return View(); }
            if (exist == null) { return View(); }
            _context.Aminities.Remove(exist);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
    }
}
