﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyClass.DAO;
using MyClass.Models;
using System.Data.SqlClient;


namespace TGDD.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        // GET: /Home/
        Product prd = new Product();
        public ActionResult Index()
        {
            ViewBag.lstLaptop = ProductDAO.Instance.getDataCategory(2).Take(5);
            ViewBag.lstPhone = ProductDAO.Instance.getDataCategory(1).Take(5);
            ViewBag.lstTablet = ProductDAO.Instance.getDataCategory(3).Take(5);
            return View();
        }

        public ActionResult DangNhap()
        {
            if (Session["user"] != null)
            {
                var user = Session["user"] as Users;
                if (UsersDAO.Instance.CheckAdmin(user.UserName))
                    return RedirectToAction("Dashboard", "Admin");
                return RedirectToAction("Index");
            }
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(string username, string password)
        {
            if (UsersDAO.Instance.Login(username, password))
            {
                Session["user"] = new Users { UserName = username, Password = password };
                if (UsersDAO.Instance.CheckAdmin(username))
                    return RedirectToAction("Dashboard", "Admin");
                return RedirectToAction("Index");
            }
            else
            {
                ViewBag.ErrorMessage = "Tên đăng nhâp hoặc mật khẩu không đúng";
                return View();
            }
        }
        public ActionResult DangKy()
        {
            ViewBag.SuccessMessage = TempData["SuccessMessage"];
            ViewBag.ErrorMessage = TempData["ErrorMessage"];
            return View();
        }

        [HttpPost]
        public ActionResult DangKy(Users Users)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    ViewBag.result = UsersDAO.Instance.Register(Users);
                    ViewBag.SuccessMessage = "Đăng ký thành công!!!!";
                    return View();
                }
            }
            catch (Exception ex)
            {
                ViewBag.ErrorMessage = "Đăng ký không thành công. Tên đăng nhập đã tồn tại.";
            }
            return View();
            
            
        }
        
        public ActionResult DangXuat()
        {
            Session.Clear();
            return RedirectToAction("Index");
        }
        public ActionResult TimKiem(string searchStr) 
        {
            var kqtimkiem = ProductDAO.Instance.TimKiem(searchStr);
            return View(kqtimkiem);
        }
    }
}
