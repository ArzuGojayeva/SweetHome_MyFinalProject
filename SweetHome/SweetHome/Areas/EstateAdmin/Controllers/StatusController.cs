using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SweetHome.DAL;
using SweetHome.Models;

namespace SweetHome.Areas.EstateAdmin.Controllers
{
    [Area("EstateAdmin")]
    public class StatusController : Controller
    {
        private readonly AppDbContext _context;
        public StatusController(AppDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View(_context.Statuses.ToList()); ;
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(Status status)
        {
            if (!ModelState.IsValid) { return View(); }
            if (status == null) { return View(); }
            await _context.Statuses.AddAsync(status);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Edit(int id)
        {
            return View(await _context.Statuses.FirstOrDefaultAsync(x => x.Id == id));
        }
        [HttpPost]
        public async Task<IActionResult> Edit(Status status)
        {
            Status? exist = await _context.Statuses.FirstOrDefaultAsync(x => x.Id == status.Id);
            if (!ModelState.IsValid) { return View(); }
            if (exist == null) { return View(); }
            exist.Name = status.Name;
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Delete(int id)
        {
            Status? exist = await _context.Statuses.FirstOrDefaultAsync(x => x.Id == id);
            if (!ModelState.IsValid) { return View(); }
            if (exist == null) { return View(); }
            _context.Statuses.Remove(exist);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
    }
}
