using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SweetHome.DAL;
using SweetHome.Models;
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
        public async Task<IActionResult> Filter(FilterVM filtervm,int take=3,int page=1)
        {
            int? categoryid = 0;
            int? hometypeid = 0;
            int? cityid = 0;
            if (filtervm.CategoryId != 0)
            {
                categoryid = filtervm.CategoryId;
            }
            if (filtervm.CityId != 0)
            {
                cityid = filtervm.CityId;
            }
            if (filtervm.HomeTypeId != 0)
            {
                hometypeid=filtervm.HomeTypeId;
            }
            var category = await _context.Products.
                Where(x => x.IsDeleted == false && x.CategoryId==filtervm.CategoryId &&x.CityId==filtervm.CityId && x.HomeTypeId==filtervm.HomeTypeId).
                Include(x => x.Status).Include(x => x.ProductImages).
            Include(x => x.Category).Include(x => x.City).Include(x => x.HomeType).Include(x => x.Team).ToListAsync();
            PaginateVM<Product> paginateVM = new PaginateVM<Product>()
            {
                Items = category,
                PageCount = GetPageCount(take),
                CurrentPage = page,
            };
            return View(paginateVM);
        }
        public int GetPageCount(int take)
        {
            var procount = _context.Products.Count();
            return (int)Math.Ceiling((double)procount / take);
        }
    }
}
