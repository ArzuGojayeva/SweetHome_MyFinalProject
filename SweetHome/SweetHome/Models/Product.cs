using System.ComponentModel.DataAnnotations.Schema;

namespace SweetHome.Models
{
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int Room { get; set; }
        public decimal Price { get; set; }
        public int HomeSize { get; set; }
        public int? TeamId { get; set; }
        public Team? Team { get; set; }
        public bool IsDeleted { get; set; }=false;
        public int StatusId { get; set; }
        public Status? Status { get; set; }  
        public int CityId { get; set; }
        public City? City { get; set; }
        public int HomeTypeId { get; set; }
        public HomeType? HomeType { get; set; }
        public ICollection<ProductImage>? ProductImages { get; set; }
        public int CategoryId { get; set; }
        public Category? Category { get; set; }
        [NotMapped]
        public IFormFile? ImageMain { get; set; } 
        [NotMapped]
        public List<IFormFile>? Files { get; set; }
        public List<Order>? Orders { get; set; }
        public List<Comment>? Comments { get; set; }

    }
}
