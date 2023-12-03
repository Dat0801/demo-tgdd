using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyClass.DAO;
using MyClass.Models;
namespace TGDD.Areas.Admin.Controllers
{
    public class DashboardController : Controller
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            if (Session["user"] != null)
            {
                var user = Session["user"] as Users;
                if (UsersDAO.Instance.CheckAdmin(user.UserName))
                    return View();
                return RedirectToAction("DangNhap");
            }
            return RedirectToAction("DangNhap");
        }
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(string username, string password)
        {
            if (UsersDAO.Instance.Login(username, password))
            {
                Session["user"] = new Users { UserName = username, Password = password };
                if (UsersDAO.Instance.CheckAdmin(username))
                    return RedirectToAction("Index");
                return RedirectToAction("DangNhap");
            }
            else
            {
                ViewBag.ErrorMessage = "Tên đăng nhâp hoặc mật khẩu không đúng";
                return View();
            }
        }
        public ActionResult DangXuat()
        {
            Session.Clear();
            return RedirectToAction("DangNhap");
        }
    }
}