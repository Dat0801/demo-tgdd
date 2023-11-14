using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyClass.Models
{
    public class Product
    {
        public int ProductID { get; set; }
        [Required(ErrorMessage = "Bắt buộc nhập tên sản phẩm")]
        public string ProductName { get; set; }
        public string MetaTitle { get; set; }
        [Required(ErrorMessage = "Bắt buộc nhập mô tả sản phẩm")]
        public string ProductDes { get; set; }
        [Required(ErrorMessage = "Bắt buộc chọn danh mục")]
        public int CatID { get; set; }
        [Required(ErrorMessage = "Bắt buộc chọn brand")]
        public int BrandID { get; set; }
        [Required(ErrorMessage = "Bắt buộc nhập giá")]
        public decimal Price { get; set; }
        public decimal PromotionPrice { get; set; }
        public string ProductImage { get; set; }
        [Required(ErrorMessage = "Bắt buộc nhập số lượng")]
        public int Quantity { get; set; }
        [Required(ErrorMessage = "Bắt buộc nhập bảo hành")]
        public int Warranty { get; set; }
        public DateTime CreatedDate { get; set; }
        [Required(ErrorMessage = "Bắt buộc chọn người tạo")]
        public string CreatedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string ModifiedBy { get; set; }
        public string MetaKeywords { get; set; }
        public string MetaDescriptions { get; set; }
        public bool Active { get; set; }

        public Product(DataRow row)
        {
            this.ProductID = (int)row["ProductID"];
            this.ProductName = row["ProductName"].ToString();
            this.MetaTitle = row["MetaTitle"].ToString();
            this.ProductDes = row["ProductDes"].ToString();
            this.CatID = (int)row["CatID"];
            this.BrandID = (int)row["BrandID"];
            this.Price = (decimal)row["Price"];
            this.PromotionPrice = (decimal)row["PromotionPrice"];
            this.ProductImage = row["ProductImage"].ToString();
            this.Quantity = (int)row["Quantity"];
            this.Warranty = (int)row["Warranty"];
            this.CreatedDate = (DateTime)row["CreatedDate"];
            this.CreatedBy = row["CreatedBy"].ToString();
            this.ModifiedDate = (DateTime)row["ModifiedDate"];
            this.ModifiedBy = row["ModifiedBy"].ToString();
            this.MetaKeywords = row["MetaKeywords"].ToString();
            this.MetaDescriptions = row["MetaDescriptions"].ToString();
            this.Active = (bool)row["Active"];
        }
        public Product() { }
    }
}
