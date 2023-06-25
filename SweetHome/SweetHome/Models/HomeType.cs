namespace SweetHome.Models
{
    public class HomeType
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public List<Product>? Products{ get; set; }
    }
}
