using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SweetHome.DAL;
using SweetHome.Models;
using SweetHome.Utilities;
using SweetHome.ViewModels.Account;
using System.Net;
using System.Net.Mail;

namespace SweetHome.Controllers
{
    public class AccountController : Controller
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly SignInManager<AppUser> _signInManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly IWebHostEnvironment _environment;
        private readonly AppDbContext _context;
        public AccountController(UserManager<AppUser> userManager, SignInManager<AppUser> signInManager, RoleManager<IdentityRole> roleManager, AppDbContext context, IWebHostEnvironment environment)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _roleManager = roleManager;
            _context = context;
            _environment = environment;
        }

        public IActionResult Register()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult>Register(RegisterVM registerVM)
        {
            if (!ModelState.IsValid) { return View(); }

            if (!registerVM.ImageFile.CheckFileType("image/"))
            {
                ModelState.AddModelError("", "Error");
                return View();
            }
            if (!registerVM.ImageFile.CheckFileSize(2000))
            {
                ModelState.AddModelError("", "Error");
                return View();
            }
            AppUser newUser=new AppUser()
            {
                UserName=registerVM.Name,
                Email=registerVM.Email,
                IsAgent=registerVM.IsAgent,
                PhoneNumber=registerVM.Phone,
                Image = await registerVM.ImageFile.SaveFileAsync(_environment.WebRootPath, "assets/img/buyer")
            };
            IdentityResult result = await _userManager.CreateAsync(newUser, registerVM.Password);
            if (!result.Succeeded)
            {
                foreach (var item in result.Errors)
                {
                    ModelState.AddModelError("", item.Description);
                    return View();
                }
            }
            if (registerVM.IsAgent == true)
            {
                await _userManager.AddToRoleAsync(newUser, "agent");


                Team team = new Team()
                {
                    Name = registerVM.Name,
                    Email = registerVM.Email,
                    Phone = registerVM.Phone,
                    Image = await registerVM.ImageFile.SaveFileAsync(_environment.WebRootPath, "assets/img/team"),
                    Products = new List<Product>()

                };
                await _context.Teams.AddAsync(team);
                await _context.SaveChangesAsync();
            }
            else
            {
                await _userManager.AddToRoleAsync(newUser, "buyer");
            }
            var token = await _userManager.GenerateEmailConfirmationTokenAsync(newUser);
            var confirmationUrl = Url.Action("ConfirmEmail", "Account",
                new { userId = newUser.Id, token = token }, Request.Scheme);
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com")
            {
                Port = 587,
                Credentials = new NetworkCredential("arzu.gojayeva03@gmail.com", "lsmbbubdiuboddaw"),
                EnableSsl = true,
            };
            MailMessage mailMessage = new MailMessage("arzu.gojayeva03@gmail.com", newUser.Email, "Email Confirmation", $@"
<a href={confirmationUrl}>Verify Email</a>
");
            mailMessage.IsBodyHtml = true;

            smtpClient.Send(mailMessage);
            return RedirectToAction("Login", "Account");
        }

        public IActionResult Login()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult>Login(LoginVM loginVM)
        {
            if (!ModelState.IsValid) { return View(); }
            if (loginVM.UserNameOrEmail.Contains("@"))
            {
                AppUser user=await _userManager.FindByEmailAsync(loginVM.UserNameOrEmail);
                if (user != null)
                {
                    var result=await _signInManager.PasswordSignInAsync(user, loginVM.Password,true,false);
                    if (!result.Succeeded)
                    {
                        ModelState.AddModelError("", "Error");
                        return View();
                    }
                    return RedirectToAction("Index","Home");
                }
            }
            else
            {
                AppUser user = await _userManager.FindByNameAsync(loginVM.UserNameOrEmail);
                if (user != null)
                {
                    var result = await _signInManager.PasswordSignInAsync(user, loginVM.Password, true, false);
                    if (!result.Succeeded)
                    {
                        ModelState.AddModelError("", "Error");
                        return View();
                    }
                    return RedirectToAction("Index", "Home");
                }

            }
            return View();
        }
        public async Task<IActionResult> LogOut()
        {
            await _signInManager.SignOutAsync();
            return RedirectToAction("Index","Home");
        }
        //public async Task<IActionResult> AddRole()
        //{
        //    await _roleManager.CreateAsync(new IdentityRole { Name = "agent" });
        //    await _roleManager.CreateAsync(new IdentityRole { Name = "buyer" });
        //    await _roleManager.CreateAsync(new IdentityRole { Name = "admin" });
        //    return NoContent();
        //}
        public async Task<IActionResult> AdminRole()
        {
            //AppUser admin = new AppUser()
            //{
            //    UserName = "admin"
            //};
            //var result = await _userManager.CreateAsync(admin, "Admin123");
            //if (!result.Succeeded)
            //{
            //    foreach(var item in result.Errors)
            //    {
            //        ModelState.AddModelError("", item.Description);
            //    return View();
            //    }
            //}
            //var user = await _userManager.FindByNameAsync("admin");
            //await _userManager.AddToRoleAsync(user, "admin");
            //await _signInManager.SignInAsync(user, false);
            return Json("Okay");

        }
        public async Task<IActionResult> ConfirmEmail(string userId, string token)
        {
            var user = await _userManager.FindByIdAsync(userId);
            if (user == null) return NotFound();

            var confirm = await _userManager.ConfirmEmailAsync(user, token);
            if (confirm.Succeeded)
            {
                await _signInManager.SignInAsync(user, false);
                return RedirectToAction("Index", "Home");
            }
            return View();
        }
    }
}
