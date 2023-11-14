using MyClass.DAO;
using MyClass.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TGDD.Areas.Admin.Controllers
{
    public class CategoryController : Controller
    {
        List<Category> listCategory = new List<Category>();
        // GET: Admin/Category
        public ActionResult XemDanhMuc()
        {
            listCategory = CategoryDAO.Instance.getData();
            return View(listCategory);
        }

        public ActionResult ThemDanhMuc()
        {
            ViewBag.listUser = UsersDAO.Instance.getDataAdmin();
            return View();
        }

        [HttpPost]
        public ActionResult ThemDanhMuc(Category category)
        {
            ViewBag.listUser = UsersDAO.Instance.getDataAdmin();
            if (ModelState.IsValid)
            {
                ViewBag.result = CategoryDAO.Instance.AddCategory(category);
                return View();
            }
            return View();
        }

        public ActionResult SuaDanhMuc(int CatID)
        {
            Category category = CategoryDAO.Instance.getData(CatID);
            ViewBag.listUser = UsersDAO.Instance.getDataAdmin();
            ViewBag.CatID = CatID;
            return View(category);
        }

        [HttpPost]
        public ActionResult SuaDanhMuc(int? CatID, Category category)
        {
            ViewBag.result = CategoryDAO.Instance.UpdateCategory(CatID, category);
            ViewBag.listUser = UsersDAO.Instance.getDataAdmin();
            ViewBag.CatID = CatID;
            return View(category);
        }

        public ActionResult XoaDanhMuc(int? CatID)
        {
            CategoryDAO.Instance.DeleteCategory(CatID);
            return RedirectToAction("XemDanhMuc");
        }
    }
}