using SweetHome.Models;

namespace SweetHome.ViewModels
{
    public class HomeVM
    {
        public List<Slider>Sliders { get; set; }
        public List<Product> Products { get; set; }
        public List<About> Abouts { get; set; }
        public List<Team> Teams { get; set; }
    }
}
