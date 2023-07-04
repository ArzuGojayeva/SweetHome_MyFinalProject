using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SweetHome.DAL;
using SweetHome.Models;
using SweetHome.ViewModels;

namespace SweetHome.ViewComponents
{
    public class CommentViewComponent : ViewComponent
    {
        private readonly AppDbContext _appDbContext;
        private readonly UserManager<AppUser> _userManager;

        public CommentViewComponent(AppDbContext appDbContext, UserManager<AppUser> userManager)
        {
            _appDbContext = appDbContext;
            _userManager = userManager;
        }

        public async Task<IViewComponentResult> InvokeAsync(int id)
        {
            CommentVM vm = new CommentVM();
            if (User.Identity.IsAuthenticated)
            {
                var user = await _userManager.FindByNameAsync(User.Identity.Name);
                vm = new CommentVM() { ProductId = id, AppUserId = user.Id };
                return View(vm);
            }
            return View(vm);
        }
    }
}
