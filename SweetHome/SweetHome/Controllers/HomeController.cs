using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SweetHome.DAL;
using SweetHome.ViewModels;

namespace SweetHome.Controllers
{
    public class HomeController : Controller
    {
        private readonly AppDbContext _context;
        public HomeController(AppDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            HomeVM homeVM= new HomeVM()
            {
                Sliders=_context.Sliders.Take(2).ToList(),
                Abouts=_context.About.Take(4).ToList(),
                Products=_context.Products.Where(x=>x.IsDeleted==false).Include(x=>x.Status).Include(x=>x.ProductImages).
                Include(x=>x.Category).Include(x=>x.City).Include(x=>x.HomeType).Include(x=>x.Team).Take(5).OrderByDescending(x=>x.Id).ToList(),
                Teams=_context.Teams.ToList()
            };    
            return View(homeVM);
        }
        public async Task<IActionResult> Detail(int id)
        {
            var prd = await _context.Products.Where(x => x.IsDeleted == false).Include(x => x.Team).Include(x => x.ProductImages).
                Include(x => x.Category).Include(x => x.Status).Include(x => x.HomeType).Include(x => x.City).FirstOrDefaultAsync(x => x.Id == id);
            return View(prd);
        }
        public async Task<IActionResult> Filter(FilterVM filtervm)
        {
            var category = await _context.Products.
                Where(x => x.IsDeleted == false && x.CategoryId==filtervm.CategoryId &&x.CityId==filtervm.CityId && x.HomeTypeId==filtervm.HomeTypeId).
                Include(x => x.Status).Include(x => x.ProductImages).
            Include(x => x.Category).Include(x => x.City).Include(x => x.HomeType).Include(x => x.Team).ToListAsync();
            return View(category);
        }
    }
}
