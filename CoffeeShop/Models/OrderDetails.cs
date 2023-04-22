using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CoffeeShop.Models
{
    public class OrderDetails
    {
        public int Id { get; set; }

        [Display(Name = "Order")]
        public int OrderId { get; set; }

        [Display(Name = "Item")]
        public int ItemId { get; set; }
        public int? Quantity { get; set; }

        [ForeignKey("OrderId")]
        public Order Order { get; set; }

        [ForeignKey("ItemId")]
        public Item Item { get; set; }

    }
}
