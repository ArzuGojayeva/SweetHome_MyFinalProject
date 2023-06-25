using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SweetHome.DAL;
using SweetHome.Models;

namespace SweetHome.Areas.EstateAdmin.Controllers
{
    [Area("EstateAdmin")]
    public class CityController : Controller
    {
        private readonly AppDbContext _context;

        public CityController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View(_context.Cities.ToList());
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(City city)
        {
            if (!ModelState.IsValid) { return  View(); }
            if (city == null) { return View(); }
            await _context.Cities.AddAsync(city);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Edit(int id)
        {
            return View(await _context.Cities.FirstOrDefaultAsync(x => x.Id == id));
        }
        [HttpPost]
        public async Task<IActionResult> Edit(City city)
        {
            City? exist = await _context.Cities.FirstOrDefaultAsync(x => x.Id == city.Id);
            if (!ModelState.IsValid) { return View(); }
            if (exist == null) { return View();}
            exist.Name=city.Name;
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult>Delete(int id)
        {
            City? exist = await _context.Cities.FirstOrDefaultAsync(x => x.Id ==id);
            if (!ModelState.IsValid) { return View(); }
            if(exist==null) { return View(); }
            _context.Cities.Remove(exist);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
    }
}
