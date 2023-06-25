namespace SweetHome.Models
{
    public class Team
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Phone { get; set; }
        public string? Email { get; set; }
        public string? Image { get; set; }
        public List<Product>? Products{ get; set; }
    }
}
