using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyClass.Models
{
    public class DetailPro
    {
        public virtual Product Product { get; set; }
        public int ProductID { get; set; }
        public int IDDetail { get; set; }
        [Display(Name = "Màn Hình")]
        public string ManHinh { get; set; }
        [Display(Name = "Hệ điều hành")]
        public string HeDieuHanh { get; set; }
        public string Chip { get; set; }
        public string RAM { get; set; }
        [Display(Name = "Dung lượng")]
        public string DungLuong { get; set; }
        [Display(Name = "Kết nối")]
        public string KetNoi { get; set; }
        public string Sim { get; set; }
        [Display(Name = "Cam sau")]
        public string CamSau { get; set; }
        [Display(Name = "Cam trước")]
        public string CamTruoc { get; set; }
        [Display(Name = "Pin - Sạc")]
        public string Pin_Sac { get; set; }
        [Display(Name = "Hãng")]
        public string Hang { get; set; }
        public string Loai { get; set; }


        //public DetailPro()
        //{
        //    this.Product = new Product();
        //}
        public DetailPro() { }
    }
}
