using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SweetHome.DAL;
using SweetHome.Models;
using SweetHome.Utilities;

namespace SweetHome.Areas.EstateAdmin.Controllers
{
    [Area("EstateAdmin")]
    [Authorize(Roles ="admin")]
    public class SliderController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _environment;
        public SliderController(AppDbContext context, IWebHostEnvironment environment)
        {
            _context = context;
            _environment = environment;
        }
        public IActionResult Index()
        {
            return View(_context.Sliders.ToList());
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult>Create(Slider slider)
        {
            if (!ModelState.IsValid) { return View(); }
            if (slider == null) { return View(); }
                if (!slider.ImageFile.CheckFileType("image/"))
                {
                    ModelState.AddModelError("", "Error");
                    return View();
                }
                if (!slider.ImageFile.CheckFileSize(2000))
                {
                    ModelState.AddModelError("", "Error");
                    return View();
                }
            slider.Image = await slider.ImageFile.SaveFileAsync(_environment.WebRootPath, "assets/img/slider");
           
            await _context.AddAsync(slider);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Edit (int id)
        {
            return View(await _context.Sliders.FirstOrDefaultAsync(x => x.Id == id));
        }
        [HttpPost]
        public async Task<IActionResult>Edit(Slider slider)
        {
            Slider? exist = await _context.Sliders.FirstOrDefaultAsync(x => x.Id == slider.Id);
            if (!ModelState.IsValid) { return View(); }
            if (exist != null)
            {
                if (!slider.ImageFile.CheckFileType("image/"))
                {
                    ModelState.AddModelError("", "Error");
                    return View();
                }
                if (!slider.ImageFile.CheckFileSize(2000))
                {
                    ModelState.AddModelError("", "Error");
                    return View();
                }
            string path = Path.Combine(_environment.WebRootPath, "assets/img/slider", exist.Image);
            if (System.IO.File.Exists(path))
            {
                System.IO.File.Delete(path);
            }
            exist.Image = await slider.ImageFile.SaveFileAsync(_environment.WebRootPath, "assets/img/slider");
            }
            exist.Name = slider.Name;
            exist.Description=slider.Description;
            exist.Title = slider.Title;
            exist.Icon = slider.Icon;
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult>Delete(int id)
        {
            Slider? exist = await _context.Sliders.FirstOrDefaultAsync(x => x.Id == id);
            string path = Path.Combine(_environment.WebRootPath, "assets/img", exist.Image);
            if (exist != null)
            {
                if (System.IO.File.Exists(path))
                {
                    System.IO.File.Delete(path);
                }
            }
            _context.Remove(exist);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
    }
}
