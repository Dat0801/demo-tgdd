using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyClass.Models;
using MyClass.DAO;

namespace TGDD.Controllers
{
    public class GioHangController : Controller
    {
        //
        // GET: /GioHang/
        public List<GioHang> LayGioHang()
        {
            List<GioHang> listGioHang = Session["GioHang"] as List<GioHang>;
            if (listGioHang == null)
            {
                listGioHang = new List<GioHang>();
                Session["GioHang"] = listGioHang;
            }
            return listGioHang;
        }

        private int TongSoLuong()
        {
            int tsl = 0;
            List<GioHang> listGioHang = Session["GioHang"] as List<GioHang>;
            if (listGioHang != null)
            {
                tsl = listGioHang.Sum(sp => sp.iSoLuong);
            }
            return tsl;
        }

        private double TongThanhTien()
        {
            double ttt = 0;
            List<GioHang> listGioHang = Session["GioHang"] as List<GioHang>;
            if (listGioHang != null)
            {
                ttt += listGioHang.Sum(sp => sp.dThanhTien);
            }
            return ttt;
        }

        //
        // GET: /GioHang/
        public ActionResult GioHang()
        {
            if (Session["GioHang"] == null)
                return RedirectToAction("DangNhap", "Home");
            List<GioHang> listGioHang = LayGioHang();
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongThanhTien = TongThanhTien();
            return View(listGioHang);
        }

        public ActionResult GioHangPartial()
        {
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongThanhTien = TongThanhTien();
            return View();
        }

        public ActionResult ThemGioHang(int ms, string strURL)
        {
            if (Session["user"] != null)
            {
                List<GioHang> listGioHang = LayGioHang();
                GioHang sanpham = listGioHang.Find(sp => sp.iMaSP == ms);
                if (sanpham == null)
                {
                    sanpham = new GioHang(ms);
                    listGioHang.Add(sanpham);
                    return Redirect(strURL);
                }
                else
                {
                    sanpham.iSoLuong++;
                    return View();
                }
            }
            else
            {
                return RedirectToAction("DangNhap", "home");
            }
        }

        public ActionResult XoaGioHang(int MaSP)
        {
            List<GioHang> listGioHang = LayGioHang();
            GioHang sp = listGioHang.Single(s => s.iMaSP == MaSP);
            if (sp != null)
            {
                listGioHang.RemoveAll(s => s.iMaSP == MaSP);
                return RedirectToAction("GioHang", "GioHang");
            }

            if (listGioHang.Count == 0)
            {
                return RedirectToAction("Index", "Home");
            }
            return RedirectToAction("GioHang", "GioHang");
        }

        public ActionResult XoaGioHangAll()
        {
            List<GioHang> listGioHang = LayGioHang();
            listGioHang.Clear();
            Session["GioHang"] = null;
            return RedirectToAction("Index", "Home");
        }

        public ActionResult CapNhatGioHang(int? MaSP, FormCollection f)
        {
            List<GioHang> listGioHang = LayGioHang();
            GioHang sp = listGioHang.Single(s => s.iMaSP == MaSP);
            if (sp != null)
            {
                sp.iSoLuong = int.Parse(f["txtSoLuong"].ToString());
            }
            return RedirectToAction("GioHang", "GioHang");
        }

        public List<Orders> LayHoaDon()
        {
            List<Orders> listOrders = new List<Orders>();
            listOrders = OrdersDAO.Instance.getData();
            return listOrders;
        }
        public void LuuHoaDon(Orders order)
        {
            OrdersDAO.Instance.AddOrderUser(order);
        }
        public ActionResult LuuHoaDonDetail()
        {
            List<GioHang> listGioHang = LayGioHang();
            List<OrderDetail> listOrderDetail = new List<OrderDetail>();
            List<Orders> listOrders = new List<Orders>();

            Users user = Session["user"] as Users;
            Orders orderadd = new Orders();
            orderadd.UserName = user.UserName;
            LuuHoaDon(orderadd);

            listOrders = LayHoaDon();
            Orders order = new Orders();
            order = listOrders.Last();

            foreach (var a in listGioHang)
            {
                OrderDetail detail = new OrderDetail();
                detail.OrderID = order.OrderID;
                detail.ProductID = a.iMaSP;
                detail.Price = (decimal)a.dDonGia;
                detail.Quantity = a.iSoLuong;

                listOrderDetail.Add(detail);
            }
            foreach (var item in listOrderDetail)
            {
                OrdersDAO.Instance.AddOrderDetail(item);
            }


            return RedirectToAction("XoaGioHangAll", "GioHang");


        }
    }
}