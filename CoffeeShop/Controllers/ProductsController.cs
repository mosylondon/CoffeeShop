using CoffeeShop.Data;
using CoffeeShop.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace CoffeeShop.Controllers
{
    public class ProductsController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IHostEnvironment _he;

        public ProductsController(ApplicationDbContext context, IHostEnvironment he)
        {
            _context = context;
            _he = he;  
        }
        public async Task<IActionResult> Index()
        {
            return View(await _context.Products.Include(p => p.ProductTypes).ToListAsync());
        }

        public IActionResult Create()
        {
            ViewData["productTypeId"] = new SelectList(_context.ProductTypes.ToList(), "Id", "ProductType");
            return View();
        }

       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Product product, IFormFile image)
        {
            if (ModelState.IsValid)
            {

                //if (image != null) { 
                //    var name = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "Images");
                //    await image.CopyToAsync(new FileStream(name, FileMode.Create));
                //    product.ProductImage = "Images/" + image.FileName;

                //}
                _context.Add(product);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(product);
        }
    }
}
