using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using SweetHome.DAL;
using SweetHome.Models;
using SweetHome.ViewModels;

namespace SweetHome.Areas.EstateAdmin.Controllers
{
    [Area("EstateAdmin")]
    [Authorize(Roles ="admin")]
    public class CityController : Controller
    {
        private readonly AppDbContext _context;

        public CityController(AppDbContext context)
        {
            _context = context;
        }

        public  IActionResult Index(int take = 2,int page=1)
        {
            var cities =_context.Cities.Skip((page-1)*take).Take(take).ToList();
            PaginateVM<City> paginateVM = new PaginateVM<City>()
            {
                Items = cities,
                PageCount = GetPageCount(take),
                CurrentPage = page,
            };
            return View(paginateVM);
        }
        public int GetPageCount(int take)
        {
            var citycount = _context.Cities.Count();
            return (int)Math.Ceiling((double)citycount / take);
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
