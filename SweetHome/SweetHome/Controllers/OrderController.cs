using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SweetHome.DAL;
using SweetHome.Models;
using SweetHome.ViewModels;

namespace SweetHome.Controllers
{
    public class OrderController : Controller
    {
        private readonly AppDbContext _context;
        private readonly UserManager<AppUser> _userManager;
        private readonly SignInManager<AppUser> _signInManager;

        public OrderController(AppDbContext context, UserManager<AppUser> userManager, SignInManager<AppUser> signInManager)
        {
            _context = context;
            _userManager = userManager;
            _signInManager = signInManager;
        }
        [HttpPost]
        public async Task<IActionResult>CheckOut(int teamid ,int id)
        {
            AppUser user = await _userManager.FindByNameAsync(User.Identity.Name);
            var prd = await _context.Products.FirstOrDefaultAsync(x => x.Id == id);
            if (prd == null) return NotFound();
            Order order = new Order
            {
                Status = null,
                AppUserId=user.Id,
                PurchasedAt=DateTime.Now,
                TeamId=teamid,
                ProductName=prd.Name,
                Price=prd.Price
            };
            await _context.Order.AddAsync(order);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index","Home");

        }
    }
}
