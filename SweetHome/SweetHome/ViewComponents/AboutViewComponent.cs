using Microsoft.AspNetCore.Mvc;
using SweetHome.DAL;

namespace SweetHome.ViewComponents
{
    public class AboutViewComponent:ViewComponent
    {
        private readonly AppDbContext _context;
        public AboutViewComponent(AppDbContext context)
        {
            _context = context;
        }
        public async Task<IViewComponentResult> InvokeAsync()
        {
            var about = _context.About.Take(4).ToList();
            return View(about);
        }
    }
}
