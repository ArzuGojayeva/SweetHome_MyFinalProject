using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using SweetHome.Models;

namespace SweetHome.DAL
{
    public class AppDbContext:IdentityDbContext<AppUser>
    {
        public AppDbContext(DbContextOptions<AppDbContext>options):base(options)
        {
            
        }
        public DbSet<Slider>Sliders { get; set; }
        public DbSet<Team> Teams { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<City> Cities { get; set; }
        public DbSet<HomeType> HomeTypes { get; set; }
        public DbSet<Status> Statuses { get; set; }
        public DbSet<ProductImage> ProductImages { get; set; }
        public DbSet<Category> Categories { get; set; }

    }
}
