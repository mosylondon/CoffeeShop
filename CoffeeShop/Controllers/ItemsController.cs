using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CoffeeShop.Data;
using CoffeeShop.Models;
using Microsoft.AspNetCore.Http;
using CoffeeShop.Utitlity;
using System.IO;
using System.Net.Http.Headers;
using static System.Net.Mime.MediaTypeNames;

namespace CoffeeShop.Controllers
{
    public class ItemsController : Controller
    {
        private readonly ApplicationDbContext _context;

        public ItemsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Items
        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _context.Items.Include(i => i.ProductTypes);
            return View(await applicationDbContext.ToListAsync());
        }

        // GET: Items/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var item = await _context.Items
                .Include(i => i.ProductTypes)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (item == null)
            {
                return NotFound();
            }

            return View(item);
        }

        // GET: Items/Create
        public IActionResult Create()
        {
            ViewData["ProductTypeId"] = new SelectList(_context.ProductTypes, "Id", "ProductType");
            return View();
        }

        // POST: Items/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        ////public async Task<IActionResult> Create([Bind("Id,Name,Price,ProductDescription,ItemImage,ProductTypeId")] Item item
        ////    , IFormFile images)
        ////{
        ////    if (ModelState.IsValid)
        ////    {
        ////        _context.Add(item);
        ////        await _context.SaveChangesAsync();
        ////        return RedirectToAction(nameof(Index));
        ////    }
        ////    ViewData["ProductTypeId"] = new SelectList(_context.ProductTypes, "Id", "ProductType", item.ProductTypeId);
        ////    return View(item);
        ////}
        ///
        public async Task<IActionResult> Create(Item item, IFormFile FormFile)
        {
            if (ModelState.IsValid)
            {
                var filePath = "";
                var dbPath = "";
                var filenames = "";

                if (FormFile != null)
                {
                    // check extension
                    string ext = Path.GetExtension(FormFile.FileName);
                    //if (ext == ".pdf")
                    //{
                    filenames = FormFile.FileName.Replace(" ", "-");
                    //get file name
                    // var filename = ContentDispositionHeaderValue.Parse(FormFile.ContentDisposition).FileName.Trim('"');
                    var filename = ContentDispositionHeaderValue.Parse(FormFile.ContentDisposition).FileName.Replace(" ", "-");


                    //get path
                    var MainPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "Images");

                    //var MainPath = Path.Combine("DocUploads");

                    //create directory "Uploads" if it doesn't exists
                    if (!Directory.Exists(MainPath))
                    {
                        Directory.CreateDirectory(MainPath);
                    }

                    //get file path 
                    //filePath = Path.Combine(MainPath, FormFile.FileName);
                    filePath = Path.Combine(MainPath, filenames);
                    dbPath = Path.Combine("Images", filenames);
                    using (System.IO.Stream stream = new FileStream(filePath, FileMode.Create))
                    {
                        await FormFile.CopyToAsync(stream);
                    }

                    //get extension
                    string extension = Path.GetExtension(filename);
                    
                }
                
                item.ItemImage = "Images/" + FormFile.FileName;
                _context.Add(item);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(item);
        }

        // GET: Items/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var item = await _context.Items.FindAsync(id);
            if (item == null)
            {
                return NotFound();
            }
            ViewData["ProductTypeId"] = new SelectList(_context.ProductTypes, "Id", "ProductType", item.ProductTypeId);
            return View(item);
        }

        // POST: Items/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Name,Price,ProductDescription,ItemImage,ProductTypeId")] Item item)
        {
            if (id != item.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(item);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ItemExists(item.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["ProductTypeId"] = new SelectList(_context.ProductTypes, "Id", "ProductType", item.ProductTypeId);
            return View(item);
        }

        // GET: Items/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var item = await _context.Items
                .Include(i => i.ProductTypes)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (item == null)
            {
                return NotFound();
            }

            return View(item);
        }

        // POST: Items/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var item = await _context.Items.FindAsync(id);
            _context.Items.Remove(item);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ItemExists(int id)
        {
            return _context.Items.Any(e => e.Id == id);
        }


        //Product details
        [HttpPost]
        [ActionName("Details")]
        public async Task<IActionResult> ProductDetails(int? id, Item itemR)
        {
            List<Item> items = new List<Item>();
            if (id == null)
            {
                return NotFound();
            }

            var item = await _context.Items
                .Include(i => i.ProductTypes)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (item == null)
            {
                return NotFound();
            }
            items = HttpContext.Session.Get<List<Item>>("items");
            if (items == null)
            {
                items = new List<Item>();
            }
            item.Quantity= itemR.Quantity;
            items.Add(item);
            HttpContext.Session.Set("items", items);
            return View(item);
        }

        public async Task<IActionResult> Cart()
        {
            List<Item> items = HttpContext.Session.Get<List<Item>>("items");
            if (items == null)
            {
                items = new List<Item>();
            }
            return View(items);
        }


        // Remove
        public async Task<IActionResult> Remove(int? id)
        {
            List<Item> items = HttpContext.Session.Get<List<Item>>("items");
            if (items != null)
            {
                var item = _context.Items.FirstOrDefault(i => i.Id == id);
                if (item != null)
                {
                    items.Remove(item);
                    HttpContext.Session.Set("items", items);
                }
                items = new List<Item>();
            }
            return View("Index");
        }
    }
}
