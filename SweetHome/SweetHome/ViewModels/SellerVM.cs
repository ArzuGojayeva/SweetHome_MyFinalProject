using SweetHome.Models;

namespace SweetHome.ViewModels
{
    public class SellerVM
    {
        public Team? Team { get; set; }
        public Product? Product { get;set; }
        public int PageCount { get; set; }
        public int CurrentPage { get; set; }
    }
}
