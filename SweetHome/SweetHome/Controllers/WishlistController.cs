using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using SweetHome.DAL;
using SweetHome.Models;
using SweetHome.ViewModels;

namespace SweetHome.Controllers
{
    public class WishlistController : Controller
    {
        private readonly AppDbContext _context;
        public WishlistController(AppDbContext context)
        {
            _context= context;
        }
        public IActionResult Index()
        {
            List<WishlistVM> wishlist;

            if (Request.Cookies["Wishlist"] != null)
            {
                wishlist = JsonConvert.DeserializeObject<List<WishlistVM>>(Request.Cookies["Wishlist"]);
            }
            else
            {
                wishlist = new List<WishlistVM>();
            }

            List<WishlistItemVM> products = new List<WishlistItemVM>();

            foreach (var item in wishlist)
            {
                Product product = _context.Products.Include(x=>x.ProductImages).Include(x => x.Category).FirstOrDefault(x => x.Id == item.Id);

                products.Add(new WishlistItemVM
                {
                    Id = product.Id,
                    Price = product.Price,
                    Name = product.Name,
                    Image=product.ProductImages.Where(x=>x.IsMain==true).FirstOrDefault()?.Image
                });
            }
            return View(products);
        }
        public async Task<IActionResult> AddWishlist(int id)
        {
            if (id == null) { return BadRequest(); }

            Product? product = await _context.Products.FirstOrDefaultAsync(x => x.Id == id);

            if (product == null) { return NotFound(); }

            WishlistVM wishlistitem = null;

            List<WishlistVM> wishlist = new List<WishlistVM>();

            if (Request.Cookies["Wishlist"] != null)
            {
                wishlist = JsonConvert.DeserializeObject<List<WishlistVM>>(Request.Cookies["Wishlist"]);

                wishlistitem = wishlist.FirstOrDefault(x => x.Id == id);
            }

            if (wishlistitem == null)
            {
                wishlist.Add(new WishlistVM
                {
                    Id = id
                });
            }
            else
            {
                wishlist.Remove(wishlistitem);
            }

            Response.Cookies.Append("Wishlist", JsonConvert.SerializeObject(wishlist));

            return RedirectToAction(nameof(Index));
        }
        public async Task<IActionResult> DeleteWishlist(int? id)
        {
            if (id == null) { return BadRequest(); }

            List<WishlistVM> wishlist;

            WishlistVM wishlistitem = null;

            if (Request.Cookies["Wishlist"] != null)
            {
                wishlist = JsonConvert.DeserializeObject<List<WishlistVM>>(Request.Cookies["Wishlist"]);

                wishlistitem = wishlist.FirstOrDefault(x => x.Id == id);
            }
            else
            {
                wishlist = new List<WishlistVM>();
            }



            wishlist.Remove(wishlistitem);




            Response.Cookies.Append("Wishlist", JsonConvert.SerializeObject(wishlist));

            return RedirectToAction(nameof(Index));
        }

    }
}
