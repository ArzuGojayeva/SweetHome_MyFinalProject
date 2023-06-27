using System.ComponentModel.DataAnnotations.Schema;

namespace SweetHome.Models
{
    public class Contact
    {
        public int Id { get; set; }
        public string? Image { get; set; }
        [NotMapped]
        public IFormFile ImageFile { get; set; }
        public string? Name { get; set; }
        public string? Title { get; set; }
        public string? Desc { get; set; }

    }
}
