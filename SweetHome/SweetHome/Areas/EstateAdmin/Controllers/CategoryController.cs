using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SweetHome.DAL;
using SweetHome.Models;

namespace SweetHome.Areas.EstateAdmin.Controllers
{
    [Area("EstateAdmin")]
    [Authorize(Roles = "admin")]
    public class CategoryController : Controller
    {
        private readonly AppDbContext _context;

        public CategoryController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View(_context.Categories.ToList());
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(Category category)
        {
            if (!ModelState.IsValid) { return View(); }
            if (category == null) { return View(); }
            await _context.Categories.AddAsync(category);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Edit(int id)
        {
            return View(await _context.Categories.FirstOrDefaultAsync(x => x.Id == id));
        }
        [HttpPost]
        public async Task<IActionResult> Edit(Category category)
        {
            Category? exist = await _context.Categories.FirstOrDefaultAsync(x => x.Id == category.Id);
            if (!ModelState.IsValid) { return View(); }
            if (exist == null) { return View(); }
            exist.Name = category.Name;
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Delete(int id)
        {
            Category? exist = await _context.Categories.FirstOrDefaultAsync(x => x.Id == id);
            if (!ModelState.IsValid) { return View(); }
            if (exist == null) { return View(); }
            _context.Categories.Remove(exist);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
    }
}
