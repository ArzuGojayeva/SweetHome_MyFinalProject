using Microsoft.AspNetCore.Identity;

namespace SweetHome.Models
{
    public class AppUser:IdentityUser
    {
        public string? FullName { get; set; }
        public bool IsAgent { get; set; } =false;
        public string? Image { get; set; }
        public List<Order>? Orders { get; set; }
        public List<Comment>? Comments { get; set; }

    }
}
