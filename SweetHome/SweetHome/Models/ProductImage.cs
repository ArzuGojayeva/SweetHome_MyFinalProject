﻿using System.ComponentModel.DataAnnotations.Schema;

namespace SweetHome.Models
{
    public class ProductImage
    {
        public int Id { get; set; }
        public string Image { get; set; }
        public bool IsMain { get; set; }
        [NotMapped]
        public IFormFile ImageFile { get; set; }
        public int ProductId { get; set; }
        public Product? Product { get; set; }
    }
}
