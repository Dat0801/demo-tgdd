using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyClass.Models
{
    public class DetailLap
    {
        public virtual Product Product { get; set; }
        public int ProductID { get; set; }
        public int IDDetail { get; set; }
        public string CPU { get; set; }
        public string RAM { get; set; }
         [Display(Name = "Ổ Cứng")]
        public string OCung { get; set; }
        [Display(Name = "Màn Hình")]
        public string ManHinh { get; set; }
         [Display(Name = "Card Màn Hình")]
        public string CardMH { get; set; }
          [Display(Name = "Cổng Kết Nối")]
        public string CongKn { get; set; }
          [Display(Name = "Đặc Biệt")]
        public string DacBiet { get; set; }
        [Display(Name = "Hệ điều hành")]
        public string HeDieuHanh { get; set; }
        [Display(Name = "Thiết Kế")]
        public string ThietKe { get; set; }
        [Display(Name = "Kích Thước - Khối Lượng")]
        public string kt_kl { get; set; }
        [Display(Name = "Thời điểm ra mẳt")]
        public string thoidiemramat { get; set; }
        public string Hang { get; set; }
        public string Loai { get; set; }


        public DetailLap() { }
    }
}
