using System.ComponentModel.DataAnnotations;

namespace SweetHome.ViewModels.Account
{
    public class LoginVM
    {
        public string UserNameOrEmail { get; set; }
        [MaxLength(100), DataType(DataType.Password)]
        public string Password { get; set; }
    }
}
