using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SweetHome.DAL;
using SweetHome.Models;
using SweetHome.Utilities;
using SweetHome.ViewModels;

namespace SweetHome.Controllers
{
    public class MyAccountController : Controller
    {
        private readonly AppDbContext _context;
        private readonly UserManager<AppUser> _userManager;
        private readonly IWebHostEnvironment _environment;
        public MyAccountController(AppDbContext context, UserManager<AppUser> userManager, IWebHostEnvironment environment)
        {
            _context = context;
            _userManager = userManager;
            _environment = environment;
        }
        public async Task<IActionResult> SellerProfile(string mail, string name)
        {
            ViewBag.Categories = await _context.Categories.ToListAsync();
            ViewBag.Cities = await _context.Cities.ToListAsync();
            ViewBag.Type = await _context.HomeTypes.ToListAsync();
            ViewBag.Status = await _context.Statuses.ToListAsync();
            ViewBag.Aminities = await _context.Aminities.ToListAsync();

            Team team = await _context.Teams
                .Include(x => x.Products).ThenInclude(x => x.ProductImages)
                .Include(x => x.Products).ThenInclude(x => x.Category)
                .Include(x => x.Products).ThenInclude(x => x.Status)
                .Include(x => x.Products).ThenInclude(x => x.City)
                .Include(x => x.Products).ThenInclude(x => x.HomeType)
                .Include(x => x.Products).ThenInclude(x => x.Aminities)
                .FirstOrDefaultAsync(t => t.Email == mail);

            if (team == null)
            {
                return NotFound();
            }
            SellerVM sellerVM = new SellerVM()
            {
                Team = team,
                Product = new Product(),

            };
            return View(sellerVM);
        }
        public async Task<IActionResult> Create()
        {
            ViewBag.Categories = await _context.Categories.ToListAsync();
            ViewBag.Cities = await _context.Cities.ToListAsync();
            ViewBag.Type = await _context.HomeTypes.ToListAsync();
            ViewBag.Status = await _context.Statuses.ToListAsync();
            ViewBag.Team = await _context.Teams.ToListAsync();
            ViewBag.Aminities = await _context.Aminities.ToListAsync();
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(Product product)
        {
            ViewBag.Categories = await _context.Categories.ToListAsync();
            ViewBag.Cities = await _context.Cities.ToListAsync();
            ViewBag.Type = await _context.HomeTypes.ToListAsync();
            ViewBag.Status = await _context.Statuses.ToListAsync();
            ViewBag.Aminities = await _context.Aminities.ToListAsync();
            ViewBag.Team = await _context.Teams.ToListAsync();
            if (!ModelState.IsValid) return RedirectToAction("SellerProfile");

            if (_context.Products.Any(p => p.Name.Trim().ToLower().Contains(product.Name.ToLower().Trim())))
            {
                ModelState.AddModelError("Name", "Product name already exist");
                return View();
            }
            if (product.Price < 0)
            {
                ModelState.AddModelError("", "It is wrong");
                return View();
            }
            if (!product.ImageMain.CheckFileType("image/"))
            {
                ModelState.AddModelError("", "Error");
                return View();
            }

            product.ProductImages = new List<ProductImage>();
            product.ProductImages.Add(new ProductImage
            {
                Image = await product.ImageMain.SaveFileAsync(_environment.WebRootPath, "assets/img/product-3"),
                IsMain = true,
                Product = product

            });
            foreach (var file in product.Files)
            {
                if (!file.CheckFileType("image/"))
                {
                    ModelState.AddModelError("", "Error");
                    return View();
                }
                if (!file.CheckFileSize(2000))
                {
                    ModelState.AddModelError("", "Error");
                    return View();
                }
                product.ProductImages.Add(new ProductImage
                {
                    Image = await file.SaveFileAsync(_environment.WebRootPath, "assets/img/product-3"),
                    IsMain = false,
                    Product = product
                });
            }
            var aminities = _context.Aminities.Where(x => product.AminitieIds.Contains(x.Id)).ToList();
            product.Aminities = new List<Aminities>();
            foreach (var aminity in aminities)
            {
                product.Aminities.Add(aminity);
            }

            Product prd = new Product
            {
                Name = product.Name,
                Description = product.Description,
                Price = product.Price,
                Room = product.Room,
                HomeSize = product.HomeSize,
                CityId = product.CityId,
                Aminities = product.Aminities,
                HomeTypeId = product.HomeTypeId,
                StatusId = product.StatusId,
                TeamId = product.TeamId,
                CategoryId = product.CategoryId,
                ProductImages=product.ProductImages,
            };

            await _context.Products.AddAsync(prd);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index", "Home");
        }
        public async Task<IActionResult> BuyerProfile()
        {
            AppUser user = await _userManager.FindByNameAsync(User.Identity.Name);

            UserVM userVM = new UserVM()
            {
                UserName = user.UserName,
                Email = user.Email,
                Image = user.Image,
                Phone = user.PhoneNumber
            };
            return View(userVM);
        }
    }
}
