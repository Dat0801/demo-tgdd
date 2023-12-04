using MyClass.DAO;
using MyClass.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TGDD.Areas.Admin.Controllers
{
    public class UsersController : Controller
    {
        List<Users> listUser = new List<Users>();
        public ActionResult XemUser()
        {
            listUser = UsersDAO.Instance.getData();
            return View(listUser);
        }

        public ActionResult ThemUser()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ThemUser(Users Users)
        {
            ViewBag.result = 0;
            if (ModelState.IsValid)
            {
                ViewBag.result = UsersDAO.Instance.AddUser(Users);
                return View();
            }
            return View();
        }

        public ActionResult SuaUser(string username)
        {
            Users Users = UsersDAO.Instance.getData(username);
            ViewBag.username = username;
            return View(Users);
        }

        [HttpPost]
        public ActionResult SuaUser(string username, Users Users)
        {
            ViewBag.result = UsersDAO.Instance.UpdateUser(username, Users);
            ViewBag.username = username;
            return View(Users);
        }

        public ActionResult XoaUser(string username)
        {
            UsersDAO.Instance.DeleteUser(username);
            return RedirectToAction("XemUser");
        }
    }
}