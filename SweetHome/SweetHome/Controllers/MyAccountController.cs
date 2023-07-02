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
        public async Task<IActionResult> SellerProfile(string mail)
        {
            ViewBag.Categories = await _context.Categories.ToListAsync();
            ViewBag.Cities = await _context.Cities.ToListAsync();
            ViewBag.Type = await _context.HomeTypes.ToListAsync();
            ViewBag.Status = await _context.Statuses.ToListAsync();

            Team team = await _context.Teams
                .Include(x => x.Products).ThenInclude(x => x.ProductImages)
                .Include(x => x.Products).ThenInclude(x => x.Category)
                .Include(x => x.Products).ThenInclude(x => x.Status)
                .Include(x => x.Products).ThenInclude(x => x.City)
                .Include(x => x.Products).ThenInclude(x => x.HomeType)
                .FirstOrDefaultAsync(t => t.Email == mail);
            if (team == null)
            {
                return View();
            }
            SellerVM sellerVM = new SellerVM()
            {
                Team=team,
                Product=new Product()
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
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(Product product)
        {
            ViewBag.Categories = await _context.Categories.ToListAsync();
            ViewBag.Cities = await _context.Cities.ToListAsync();
            ViewBag.Type = await _context.HomeTypes.ToListAsync();
            ViewBag.Status = await _context.Statuses.ToListAsync();
            ViewBag.Team = await _context.Teams.ToListAsync();
            if (!ModelState.IsValid) return View();

            if (_context.Products.Any(p => p.Name.Trim().ToLower().Contains(product.Name.ToLower().Trim())))
            {
                ModelState.AddModelError("Name", "Product name already exist");
                return View();
            }
            if (product.Price < 1)
            {
                ModelState.AddModelError("", "It is wrong");
                return View();
            }
            if (product.Room < 1)
            {
                ModelState.AddModelError("", "It is wrong");
                return View();
            }
            if (product.HomeSize < 1)
            {
                ModelState.AddModelError("", "It is wrong");
                return View();
            }
            if (product.Files==null)
            {
                ModelState.AddModelError("", "It is wrong");
                return View();
            }
            if (product.ImageMain==null)
            {
                ModelState.AddModelError("", "It is wrong");
                return View();
            }
            if (!product.ImageMain.CheckFileType("image/"))
            {
                ModelState.AddModelError("", "Error");
                return View();
            }
            if (!product.ImageMain.CheckFileSize(2000))
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
            var user=await _userManager.FindByNameAsync(User.Identity.Name);
            if (user.IsAgent == true)
            {
                var team = await _context.Teams.FirstOrDefaultAsync(x => x.Email == user.Email);

                Product prd = new Product
                {
                    Name = product.Name,
                    Description = product.Description,
                    Price = product.Price,
                    Room = product.Room,
                    HomeSize = product.HomeSize,
                    CityId = product.CityId,
                    HomeTypeId = product.HomeTypeId,
                    StatusId = product.StatusId,
                    TeamId = team.Id,
                    CategoryId = product.CategoryId,
                    ProductImages = product.ProductImages,
                };
            await _context.Products.AddAsync(prd);
            await _context.SaveChangesAsync();
            }
            return RedirectToAction("Index", "Home");
        }
        public async Task<IActionResult> Edit(int id)
        {
            ViewBag.Categories = await _context.Categories.ToListAsync();
            ViewBag.Cities = await _context.Cities.ToListAsync();
            ViewBag.Type = await _context.HomeTypes.ToListAsync();
            ViewBag.Status = await _context.Statuses.ToListAsync();
            ViewBag.Team = await _context.Teams.ToListAsync();
            return View(await _context.Products
                .Where(x=>x.IsDeleted==false).Include(x=>x.Team).Include(x=>x.ProductImages).Include(x=>x.Category)
                .Include(x=>x.City).Include(x=>x.Status).Include(x=>x.HomeType).FirstOrDefaultAsync(x=>x.Id==id));
        }
        [HttpPost]
        public async Task<IActionResult>Edit(Product product)
        {
            ViewBag.Categories = await _context.Categories.ToListAsync();
            ViewBag.Cities = await _context.Cities.ToListAsync();
            ViewBag.Type = await _context.HomeTypes.ToListAsync();
            ViewBag.Status = await _context.Statuses.ToListAsync();
            ViewBag.Team = await _context.Teams.ToListAsync();
            if (!ModelState.IsValid) { return View(); }
            Product? exist= await _context.Products.Where(x=>x.IsDeleted==false).Include(x=>x.Team).Include(x => x.ProductImages).
            Include(x => x.Category)
           .Include(x => x.City).Include(x => x.Status).Include(x => x.HomeType).FirstOrDefaultAsync(x => x.Id ==product.Id);
            if (product.Price < 1)
            {
                ModelState.AddModelError("", "It is wrong");
                return View();
            }
            if (product.Room < 1)
            {
                ModelState.AddModelError("", "It is wrong");
                return View();
            }
            if (product.HomeSize < 1)
            {
                ModelState.AddModelError("", "It is wrong");
                return View();
            }
            exist.Name = product.Name;
            exist.Description = product.Description;
            exist.Room = product.Room;
            exist.Price=product.Price;
            exist.CityId = product.CityId;
            exist.CategoryId=product.CategoryId;
            exist.StatusId = product.StatusId;
            exist.HomeSize = product.HomeSize;
            exist.HomeTypeId = product.HomeTypeId;
            if (product.ImageMain != null)
            {
                if (!product.ImageMain.CheckFileType("image/"))
                {
                    ModelState.AddModelError("", "Error");
                    return View();
                }
                if (!product.ImageMain.CheckFileSize(2000))
                {
                    ModelState.AddModelError("", "Error");
                    return View();
                }
                product.ImageMain.DeleteFile(_environment.WebRootPath, "assets/img/product-3",exist.ProductImages.FirstOrDefault(x => x.IsMain == true).Image);

                var savedFile = await product.ImageMain.SaveFileAsync(_environment.WebRootPath, "assets/img/product-3");
                exist.ProductImages.FirstOrDefault(pi => pi.IsMain).Image = savedFile;
            }
            if(product.Files != null)
            {
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
                    exist.ProductImages.Add(new ProductImage
                    {
                        Image = await file.SaveFileAsync(_environment.WebRootPath, "assets/img/product-3"),
                        IsMain = false,
                        Product = product
                    });
                }
            }
            await _context.SaveChangesAsync();
            return RedirectToAction("Index","Home");
        }
        [HttpPost]
        public async Task<IActionResult> DeleteImage(int id, int pId)
        {
            var productImage = await _context.ProductImages.FirstOrDefaultAsync(x => x.Id == id);
            productImage.ImageFile.DeleteFile(_environment.WebRootPath,"assets/img/product-3", productImage.Image);
            _context.ProductImages.Remove(productImage);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index","Home", new { id = pId });
        }
        public async Task<IActionResult> Delete(int id)
        {
            Product? exist= await _context.Products.AsNoTracking().Include(x => x.ProductImages).Include(x => x.Category)
                .Include(x => x.City).Include(x => x.Status).Include(x => x.HomeType).FirstOrDefaultAsync(x => x.Id == id);
            if (exist == null)
            {
                ModelState.AddModelError("", "Product not found");
                return View();
            }
            _context.Products.Remove(exist);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index","Home");


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
        public async Task<IActionResult> OrderBuyer()
        {
            AppUser user = await _userManager.FindByNameAsync(User.Identity.Name);
            List<Order> orders = await _context.Order.Where(x => x.AppUserId == user.Id).ToListAsync();

            return View(orders);
        }

        public async Task<IActionResult> OrderSeller()
        {
            var user = await _userManager.FindByNameAsync(User.Identity.Name);
            if (user.IsAgent == true)
            {
                var team = await _context.Teams.Include(x => x.Orders).FirstOrDefaultAsync(x => x.Email == user.Email);
            return View(team);
            }
            return View();
        }

        public async Task<IActionResult> Editfororder(int? id)
        {
            return View(await _context.Order.Include(x=>x.Team).Include(x=>x.AppUser).FirstOrDefaultAsync(x=>x.Id==id));
        }

        [HttpPost]

        public async Task<IActionResult> Editfororder(Order order)
        {
            if (!ModelState.IsValid) { return View(); }
            Order? exist = await _context.Order.Include(x => x.Team).Include(x => x.AppUser).FirstOrDefaultAsync(x => x.Id == order.Id);
            if (exist == null)
            {
                ModelState.AddModelError("", "Error");
                return View();
            }
            exist.Status = order.Status;
            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }
        public async Task<IActionResult>Accept(int id)
        {
            if (!ModelState.IsValid) { return View(); }
            Order? exist = await _context.Order.Include(x => x.Team).Include(x => x.AppUser).FirstOrDefaultAsync(x => x.Id ==id);
            if (exist == null)
            {
                ModelState.AddModelError("", "Error");
                return View();
            }
            exist.Status = true;
            await _context.SaveChangesAsync();
            return RedirectToAction("OrderSeller");
        }
        public async Task<IActionResult> Reject(int id)
        {
            if (!ModelState.IsValid) { return View(); }
            Order? exist = await _context.Order.Include(x => x.Team).Include(x => x.AppUser).FirstOrDefaultAsync(x => x.Id ==id);
            if (exist == null)
            {
                ModelState.AddModelError("", "Error");
                return View();
            }
            exist.Status = false;
            await _context.SaveChangesAsync();
            return RedirectToAction("OrderSeller");
        }
    }
}
