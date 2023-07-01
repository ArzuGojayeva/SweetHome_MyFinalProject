using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ViewComponents;
using Microsoft.EntityFrameworkCore;
using SweetHome.DAL;
using SweetHome.ViewModels;

namespace SweetHome.ViewComponents
{
    public class SearchViewComponent:ViewComponent
    {
        private readonly AppDbContext _context;

        public SearchViewComponent(AppDbContext context)
        {
            _context = context;
        }
        public async Task<IViewComponentResult> InvokeAsync()
        {
            SearchVM vM = new SearchVM();
            return View(vM);
        }
    }
}
