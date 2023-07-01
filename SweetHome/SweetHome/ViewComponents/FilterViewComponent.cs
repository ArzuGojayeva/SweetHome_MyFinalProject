using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SweetHome.DAL;
using SweetHome.ViewModels;

namespace SweetHome.ViewComponents
{
    public class FilterViewComponent:ViewComponent
    {
        private readonly AppDbContext _context;
        public FilterViewComponent(AppDbContext context)
        {
            _context=context;
        }
        public async Task<IViewComponentResult> InvokeAsync()
        {
            FilterVM filterVM = new FilterVM();
            filterVM.Categories=await _context.Categories.ToListAsync();
            filterVM.Citys = await _context.Cities.ToListAsync();
            filterVM.HomeTypes=await _context.HomeTypes.ToListAsync();
            return View(filterVM);
        }
    }
}
