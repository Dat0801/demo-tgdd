using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using MyClass.DAO;

namespace MyClass.Models
{

    public class GioHang
    {
        List<GioHang> lst = new List<GioHang>();
        public int iMaSP { get; set; }
        public string sTenSP { get; set; }
        public string sAnhBia { get; set; }
        public double dDonGia { get; set; }
        public int iSoLuong { get; set; }
        public string iMetaType { get; set; }
        public double dThanhTien
        {
            get { return iSoLuong * (int)dDonGia; }
        }

        public GioHang(int Mapro)
        {
            iMaSP = Mapro;
            Product sp = ProductDAO.Instance.getData(Mapro); 
            sTenSP = sp.ProductName;
            sAnhBia = sp.ProductImage;
            dDonGia = double.Parse(sp.PromotionPrice.ToString());
            iMetaType = sp.MetaKeywords;
            iSoLuong = 1;
        }
    }
}
