using SweetHome.Models;

namespace SweetHome.ViewModels
{
    public class CommentVM
    {
        public string Description { get; set; }
        public DateTime? Date { get; set; }
        public string AppUserId { get; set; }
        public int ProductId { get; set; }
        public List<Comment> Comments { get; set; }
        public Product? Product { get; set; }
    }
}
