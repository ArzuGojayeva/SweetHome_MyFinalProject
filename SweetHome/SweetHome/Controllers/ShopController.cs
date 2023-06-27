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
        public async Task<IActionResult> Index(string mail)
        {
           
            HomeVM homeVM = new HomeVM()
            {
                Products = _context.Products.Where(x => x.IsDeleted == false).Include(x => x.Status).Include(x => x.ProductImages).
                Include(x => x.Category).Include(x => x.City).Include(x => x.HomeType).Include(x => x.Team).OrderByDescending(x => x.Id).ToList(),
                Teams = _context.Teams.ToList()
            };
            return View(homeVM);
        }

    }
}
