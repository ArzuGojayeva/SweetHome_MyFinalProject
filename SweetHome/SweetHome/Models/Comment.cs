namespace SweetHome.Models
{
    public class Comment
    {
        public int Id { get; set; }
        public string Description { get; set; }
        public DateTime? Date { get; set; }
        public AppUser? ApplicationUser { get; set; }
        public string AppUserId { get; set; }
        public Product? Product { get; set; }
        public int ProductId { get; set; }
    }
}
