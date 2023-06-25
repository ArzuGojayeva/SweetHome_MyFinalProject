using System.ComponentModel.DataAnnotations;

namespace SweetHome.ViewModels.Account
{
    public class RegisterVM
    {
        public string Name { get; set; }
        [MaxLength(100),DataType(DataType.EmailAddress)]
        public string Email { get; set; }
        [MaxLength(100),DataType(DataType.Password)]
        public string Password { get; set; }
        [MaxLength(100),DataType(DataType.Password),Compare(nameof(Password))]
        public string ConfirmPassword { get; set; }
        public bool IsAgent { get; set; }
        public string? Image { get; set; }
        public IFormFile ImageFile { get; set; }
        public string Phone { get; set; }
    }
}
