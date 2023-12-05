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
        public int BrandID { get; set; }
        [Required(ErrorMessage = "Bắt buộc nhập giá")]
        [DisplayFormat(DataFormatString="{0:0,0}")]
        public decimal Price { get; set; }
        [Required(ErrorMessage = "Bắt buộc nhập giảm giá")]
        [DisplayFormat(DataFormatString = "{0:0,0}")]
        public decimal PromotionPrice { get; set; }
        public string ProductImage { get; set; }
        [Required(ErrorMessage = "Bắt buộc nhập số lượng")]
        public int Quantity { get; set; }
        [Required(ErrorMessage = "Bắt buộc nhập bảo hành")]
        public int Warranty { get; set; }
        public DateTime CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string ModifiedBy { get; set; }
        [Required(ErrorMessage = "Bắt buộc nhập metakeywords")]
        public string MetaKeywords { get; set; }
        public string MetaDescriptions { get; set; }
        public bool Active { get; set; }
        public virtual DetailPro DetailPro { get; set; }
        public virtual DetailLap DetailLap { get; set; }


        public Product(DataRow row,int data)
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


        public Product(DataRow row, string lichsumuahang)
        {
            this.ProductID = (int)row["ProductID"];
            this.ProductName = row["ProductName"].ToString();
            this.ProductImage = row["ProductImage"].ToString();
            this.Quantity = (int)row["Quantity"];
            this.PromotionPrice = (decimal)row["PromotionPrice"];
            this.MetaKeywords = row["MetaKeywords"].ToString();
        }
        public Product(DataRow row, char a)
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

            this.DetailPro = new DetailPro();

            this.DetailPro.ProductID = this.ProductID;
            this.DetailPro.IDDetail = (int)row["IDDetail"];
            this.DetailPro.ManHinh = row["ManHinh"].ToString();
            this.DetailPro.HeDieuHanh = row["HeDieuHanh"].ToString();
            this.DetailPro.Chip = row["Chip"].ToString();
            this.DetailPro.RAM = row["RAM"].ToString();
            this.DetailPro.DungLuong = row["DungLuong"].ToString();
            this.DetailPro.KetNoi = row["KetNoi"].ToString();
            this.DetailPro.Sim = row["Sim"].ToString();
            this.DetailPro.CamSau = row["CamSau"].ToString();
            this.DetailPro.CamTruoc = row["CamTruoc"].ToString();
            this.DetailPro.Pin_Sac = row["Pin_Sac"].ToString();
            this.DetailPro.Hang = row["Hang"].ToString();
            this.DetailPro.Loai = row["Loai"].ToString();

        }

        public Product(DataRow row, float a)
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

            this.DetailLap = new DetailLap();

            this.DetailLap.ProductID = this.ProductID;
            this.DetailLap.IDDetail = (int)row["IDDetailLap"];
            this.DetailLap.CPU = row["CPU"].ToString();
            this.DetailLap.RAM = row["RAM"].ToString();
            this.DetailLap.OCung = row["OCung"].ToString();
            this.DetailLap.ManHinh = row["ManHinh"].ToString();
            this.DetailLap.CardMH = row["CardMH"].ToString();
            this.DetailLap.CongKn = row["CongKetNoi"].ToString();
            this.DetailLap.DacBiet = row["DacBiet"].ToString();
            this.DetailLap.HeDieuHanh = row["HeDieuHanh"].ToString();
            this.DetailLap.ThietKe = row["ThietKe"].ToString();
            this.DetailLap.kt_kl = row["KichThuoc_Kl"].ToString();
            this.DetailLap.thoidiemramat = row["ThoiDiemRaMat"].ToString();
            this.DetailLap.Hang = row["Hang"].ToString();
            this.DetailLap.Loai = row["Loai"].ToString();

        }
        public Product() { }
    }
}
