using CoffeeShop.Data;
using CoffeeShop.Models;
using CoffeeShop.Utitlity;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;

namespace CoffeeShop.Controllers
{
    public class OrdersController : Controller
    {
        private readonly ApplicationDbContext _context;

        public OrdersController(ApplicationDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> CheckOut()
        {
            var userInfo = HttpContext.Session.GetString("Userdetails");

            var entitty = _context.Users.Where(e => e.Password == userInfo).FirstOrDefault();

            HttpContext.Session.SetString("name", entitty.Name);
            HttpContext.Session.SetString("phone", entitty.PhoneNumber);
            HttpContext.Session.SetString("email", entitty.Email);
            HttpContext.Session.SetString("address", entitty.Address);
            //HttpContext.Session.Set("name", entitty.Name);
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CheckOut(Order order)
        {
            List<Item> items = HttpContext.Session.Get<List<Item>>("items");
            if (items != null)
            {
                foreach (var item in items)
                {
                    order.OrderDate = DateTime.Now.Date;
                    OrderDetails orderDetails = new OrderDetails();
                    orderDetails.ItemId = item.Id;
                    orderDetails.Quantity = item.Quantity;
                    order.OrderDetails.Add(orderDetails);

                }
            }
            order.OrderNo = GetOrderNo();
            _context.Orders.Add(order);
            await _context.SaveChangesAsync();
            HttpContext.Session.Set("items", new List<Item>());
            ViewBag.Order = "Your Order is placed successfully";
            return View();
        }


        public string GetOrderNo()
        {
            int rowCount = _context.Orders.ToList().Count() + 1;
            return rowCount.ToString("000");
        }


        public async Task<IActionResult> OrderList()
        {

            List<Order> orders = _context.Orders.ToList();
            List<OrderDetails> odetails = _context.OrderDetails.ToList();
            List<Item> items = _context.Items.ToList();

            var orderList = from e in orders
                                 join d in odetails on e.Id equals d.OrderId into table1
                                 from d in table1.ToList()
                                 join i in items on d.ItemId equals i.Id into table2
                                 from i in table2.ToList()
                                 select new OrderListVm
                                 {
                                     Name = e.Name,
                                     PhoneNo = e.PhoneNo,
                                     Address = e.Address,
                                     OrderDate = e.OrderDate,
                                     OrderNo = e.OrderNo,
                                     itemName = i.Name,
                                     Price = i.Price,
                                     Quantity = Convert.ToInt32(d.Quantity),
                                     TotalPrice = i.Price * Convert.ToInt32(d.Quantity)
                                 };
            return View(orderList.Where(o => o.OrderDate == DateTime.Today));

        }
    }
}
