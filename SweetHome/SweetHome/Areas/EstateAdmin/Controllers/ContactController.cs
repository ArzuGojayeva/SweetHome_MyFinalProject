using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SweetHome.DAL;
using SweetHome.Models;
using SweetHome.Utilities;

namespace SweetHome.Areas.EstateAdmin.Controllers
{
    [Area("EstateAdmin")]
    public class ContactController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _environment;
        public ContactController(AppDbContext context, IWebHostEnvironment environment)
        {
            _context = context;
            _environment = environment;
        }
        public IActionResult Index()
        {
            return View(_context.Contacts.ToList());
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(Contact contact)
        {
            if (!ModelState.IsValid) { return View(); }
            if (contact == null) { return View(); }
            if(contact.ImageFile==null) { return View(); }
            if (!contact.ImageFile.CheckFileType("image/"))
            {
                ModelState.AddModelError("", "Error");
                return View();
            }
            if (!contact.ImageFile.CheckFileSize(2000))
            {
                ModelState.AddModelError("", "Error");
                return View();
            }
            contact.Image = await contact.ImageFile.SaveFileAsync(_environment.WebRootPath, "assets/img/icons");
            await _context.Contacts.AddAsync(contact);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Edit(int id)
        {
            return View(await _context.Contacts.FirstOrDefaultAsync(x => x.Id == id));
        }
        [HttpPost]
        public async Task<IActionResult> Edit(Contact contact)
        {
            Contact? exist = await _context.Contacts.FirstOrDefaultAsync(x => x.Id ==contact.Id);
            if (!ModelState.IsValid) { return View(); }
            if (exist != null)
            {
                if (!contact.ImageFile.CheckFileType("image/"))
                {
                    ModelState.AddModelError("", "Error");
                    return View();
                }
                if (!contact.ImageFile.CheckFileSize(2000))
                {
                    ModelState.AddModelError("", "Error");
                    return View();
                }
                string path = Path.Combine(_environment.WebRootPath, "assets/img/icons", exist.Image);
                if (System.IO.File.Exists(path))
                {
                    System.IO.File.Delete(path);
                }
                exist.Image = await exist.ImageFile.SaveFileAsync(_environment.WebRootPath, "assets/img/icons");
            }
            exist.Name = contact.Name;
            exist.Title = contact.Title;
            exist.Desc = contact.Desc;
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Delete(int id)
        {
            Contact? exist = await _context.Contacts.FirstOrDefaultAsync(x => x.Id == id);
            if (!ModelState.IsValid) { return View(); }
            if (exist == null) { return View(); }
            _context.Contacts.Remove(exist);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
    }
}
