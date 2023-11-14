﻿using System;
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
                return RedirectToAction("Index", "Home");
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
	}
}