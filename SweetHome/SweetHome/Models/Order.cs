namespace SweetHome.Models
{
    public class Order
    {
        public int Id { get; set; }
        public AppUser? AppUser { get; set; }
        public string? AppUserId { get; set; }
        public bool? Status { get; set; }
        public int? ProductId { get; set; }
        public Product? Product { get; set; }
        public string? ProductName { get; set; } 
        public decimal Price { get; set; }
        public int? TeamId { get; set; }
        public Team? Team { get; set; }
        public DateTime PurchasedAt { get; set; }
    }
}
