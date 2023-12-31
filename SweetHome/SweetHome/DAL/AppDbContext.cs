﻿using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
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
        public DbSet<About> About { get; set; }
        public DbSet<Contact> Contacts { get; set; }
        public DbSet<Order> Order { get; set; }
        public DbSet<Faq> Faq { get; set; }
        public DbSet<Comment> Comments { get; set; }
        public DbSet<Settings> Settings { get; set; }

    }
}
