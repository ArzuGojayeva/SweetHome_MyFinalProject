using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using SweetHome.DAL;
using SweetHome.Models;
using SweetHome.ViewModels;

namespace SweetHome.Controllers
{
    public class ShopController : Controller
    {
        private readonly AppDbContext _context;
        public ShopController(AppDbContext context)
        {
            _context = context;
        }
        public async Task<IActionResult> Index(int take=3,int page=1)
        {
            var products = await _context.Products.Where(x => x.IsDeleted == false).Include(x => x.Status).Include(x => x.ProductImages).
            Include(x => x.Category).Include(x => x.City).Include(x => x.HomeType).Include(x => x.Team).OrderByDescending(x => x.Id).Skip((page-1)*take).Take(take).ToListAsync();
            PaginateVM<Product>paginateVM=new PaginateVM<Product>()
            {
                Items = products,
                PageCount=GetPageCount(take),
                CurrentPage=page,
            };
            return View(paginateVM);
        }
        public int GetPageCount(int take)
        {
            var procount = _context.Products.Count();
            return (int)Math.Ceiling((double)procount / take);
        }
      
        public async Task<IActionResult> Search(SearchVM searchVM,int take=3,int page=1)
        {
           if (string.IsNullOrEmpty(searchVM.ProdName)) return RedirectToAction("Index","Shop");

           var allproduct = await _context.Products
                .Include(x => x.Category)
               .Include(x => x.ProductImages)
               .Include(x => x.Team)
               .Include(x => x.City)
               .Include(x => x.Status)
               .Include(x => x.HomeType)
              .Where(x => !x.IsDeleted &&
                x.Name.Trim().ToLower().StartsWith(searchVM.ProdName.ToLower().Trim())).Skip((page-1)*take).Take(take).ToListAsync();
            PaginateVM<Product> paginateVM = new PaginateVM<Product>()
            {
                Items =allproduct,
                PageCount = GetPageCount(take),
                CurrentPage = page,
            };
            return View(paginateVM);
        }

    }
}
