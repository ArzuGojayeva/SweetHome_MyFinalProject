using System.ComponentModel.DataAnnotations.Schema;

namespace SweetHome.Models
{
    public class Slider
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Icon { get; set; }
        public string? Title { get; set; }
        public string? Description { get; set; }
        public string? Image { get; set; }
        [NotMapped]
        public IFormFile ImageFile { get; set; }
    }
}
