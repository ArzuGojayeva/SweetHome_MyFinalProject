using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SweetHome.DAL;
using SweetHome.Models;

namespace SweetHome.Areas.EstateAdmin.Controllers
{
    [Area("EstateAdmin")]
    [Authorize(Roles ="admin")]
    public class FaqController : Controller
    {
        private readonly AppDbContext _context;
        public FaqController(AppDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View(_context.Faq.ToList());
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(Faq faq)
        {
            if (!ModelState.IsValid) { return View(); }
            if (faq == null) { return View(); }
            await _context.Faq.AddAsync(faq);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Edit(int id)
        {
            return View(await _context.Faq.FirstOrDefaultAsync(x => x.Id == id));
        }
        [HttpPost]
        public async Task<IActionResult> Edit(Faq faq)
        {
            Faq? exist = await _context.Faq.FirstOrDefaultAsync(x => x.Id == faq.Id);
            if (!ModelState.IsValid) { return View(); }
            if (exist == null) { return View(); }
            exist.Title=faq.Title;
            exist.Description = faq.Description;
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Delete(int id)
        {
            Faq? exist = await _context.Faq.FirstOrDefaultAsync(x => x.Id == id);
            if (!ModelState.IsValid) { return View(); }
            if (exist == null) { return View(); }
            _context.Faq.Remove(exist);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
    }
}
