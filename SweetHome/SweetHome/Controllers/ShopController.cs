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
        public async Task<IActionResult> Index(int take,int page)
        {


            var products = await _context.Products.Where(x => x.IsDeleted == false).Include(x => x.Status).Include(x => x.ProductImages).
            Include(x => x.Category).Include(x => x.City).Include(x => x.HomeType).Include(x => x.Team).OrderByDescending(x => x.Id).ToListAsync();
            return View(products);
        }
      
        public async Task<IActionResult> Search(SearchVM searchVM)
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
                x.Name.Trim().ToLower().StartsWith(searchVM.ProdName.ToLower().Trim())).ToListAsync();
            return View(allproduct);
        }

    }
}
