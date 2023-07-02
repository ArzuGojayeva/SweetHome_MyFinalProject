using SweetHome.Models;

namespace SweetHome.ViewModels
{
    public class PaginateVM<T>
    {
        public List<T> Items { get; set; }
        public int PageCount { get; set; }
        public int CurrentPage { get; set; }

        public static implicit operator PaginateVM<T>(PaginateVM<Product> v)
        {
            throw new NotImplementedException();
        }
    }
}
