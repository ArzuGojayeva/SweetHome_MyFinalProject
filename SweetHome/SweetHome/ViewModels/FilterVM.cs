using SweetHome.Models;

namespace SweetHome.ViewModels
{
    public class FilterVM
    {
        public List<Category> Categories { get; set; } = null!;
        public int? CategoryId { get; set; }
        public List<City> Citys { get; set; } = null!;
        public int? CityId { get; set; }
        public List<HomeType> HomeTypes { get; set; } = null!;
        public int? HomeTypeId { get; set; }
        public List<Product> Products { get; set; }=null!;
    }
}
