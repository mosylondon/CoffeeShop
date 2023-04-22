using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;
using System;

namespace CoffeeShop.Models
{
    public class OrderListVm
    {
        public string OrderNo { get; set; }
        public string Name { get; set; }
        public string PhoneNo { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public DateTime OrderDate { get; set; }
        public string itemName { get; set; }

        [Required]
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public decimal  TotalPrice { get; set; }
    }
}
