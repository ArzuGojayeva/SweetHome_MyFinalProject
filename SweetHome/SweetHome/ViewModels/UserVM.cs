using SweetHome.Models;

namespace SweetHome.ViewModels
{
    public class UserVM
    {
        public string UserName { get; set; }
        public string Phone { get;set; }
        public string Email { get; set; }
        public string Image { get;set; }
        public List<Product>? products { get; set; }

    }
}
