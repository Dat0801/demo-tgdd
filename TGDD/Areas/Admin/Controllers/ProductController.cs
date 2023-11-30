using MyClass.DAO;
using MyClass.Models;
using System.Collections.Generic;
using System.Web.Mvc;
using PagedList;
using System;

namespace TGDD.Areas.Admin.Controllers
{
    public class ProductController : Controller
    {
        // GET: Admin/Product
        List<Product> listProduct = new List<Product>();
        //Vào menu Tools chọn NuGet Package Manager Cai goi Install-Package PagedList.Mvc
        public ActionResult XemSP(int? page)
        {
            int pagesize = 10;
            int pageNumber = (page ?? 1);
            var listProduct = ProductDAO.Instance.getData().ToPagedList(pageNumber, pagesize);
            ViewBag.listBrand = BrandDAO.Instance.getData();
            ViewBag.listCategory = CategoryDAO.Instance.getData();
            return View(listProduct);
        }

        public ActionResult ThemSP()
        {
            ViewBag.listCategory = CategoryDAO.Instance.getData();
            ViewBag.listUser = UsersDAO.Instance.getDataAdmin();
            ViewBag.listBrand = BrandDAO.Instance.getData();
            return View();
        }

        [HttpPost]
        public ActionResult ThemSP(Product product)
        {
            ViewBag.result = 0;
            ViewBag.listCategory = CategoryDAO.Instance.getData();
            ViewBag.listUser = UsersDAO.Instance.getDataAdmin();
            ViewBag.listBrand = BrandDAO.Instance.getData();
            if (ModelState.IsValid)
            {
                ViewBag.result = ProductDAO.Instance.AddProduct(product);
                return View();
            }
            return View();
        }

        public ActionResult SuaSP(int ProductID)
        {
            Product product = ProductDAO.Instance.getData(ProductID);
            ViewBag.listUser = UsersDAO.Instance.getDataAdmin();
            ViewBag.listCategory = CategoryDAO.Instance.getData();
            ViewBag.listBrand = BrandDAO.Instance.getData();
            ViewBag.ProductID = ProductID;
            return View(product);
        }

        [HttpPost]
        public ActionResult SuaSP(int ProductID, Product product)
        {
            ViewBag.result = 0;
            ViewBag.listUser = UsersDAO.Instance.getDataAdmin();
            ViewBag.listCategory = CategoryDAO.Instance.getData();
            ViewBag.listBrand = BrandDAO.Instance.getData();
            ViewBag.ProductID = ProductID;
            if (ModelState.IsValid)
            {
                ViewBag.result = ProductDAO.Instance.UpdateProduct(ProductID, product);
                return View(product);
            }
            return View(product);
        }

        public ActionResult XoaSP(int ProductID)
        {
            ProductDAO.Instance.DeleteProduct(ProductID);
            return RedirectToAction("XemSP");
        }
    }
}