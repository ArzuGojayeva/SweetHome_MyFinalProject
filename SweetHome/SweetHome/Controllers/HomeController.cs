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
            CommentVM commentVM = new CommentVM();
            commentVM.Product = await _context.Products.Where(x => x.IsDeleted == false).Include(x => x.Team).Include(x => x.ProductImages).
                Include(x => x.Category).Include(x => x.Status).Include(x => x.HomeType).Include(x => x.City).FirstOrDefaultAsync(x => x.Id == id); ;

            commentVM.Comments = await _context.Comments.Include(x => x.Product).
                Include(x => x.ApplicationUser).Where(x => x.ProductId == id).ToListAsync();
            return View(commentVM);
        }
        public async Task<IActionResult> Filter(FilterVM filtervm,int take=6,int page=1)
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
        public async Task<IActionResult> CreateComment(CommentVM comment)
        {
            if (!User.Identity.IsAuthenticated) return RedirectToAction("Login", "Account");
            await _context.Comments.AddAsync(new Comment
            {
                Description = comment.Description,
                Date = DateTime.UtcNow,
                AppUserId = comment.AppUserId,
                ProductId = comment.ProductId,
            });
            await _context.SaveChangesAsync();
            return RedirectToAction("Detail", new { id = comment.ProductId });
        }
    }
}
