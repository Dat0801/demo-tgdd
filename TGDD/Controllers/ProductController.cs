using MyClass.DAO;
using MyClass.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TGDD.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        List<Product> listProduct = new List<Product>();
        public ActionResult ShowTheoCatID(int CatID)
        {
            listProduct = ProductDAO.Instance.getDataCategory(CatID);
            ViewBag.CatID = CatID;
            return View(listProduct);
        }

        public ActionResult ShowTheoBrandID(int BrandID, int CatID)
        {
            listProduct = ProductDAO.Instance.getDataBrand(BrandID);
            ViewBag.CatID = CatID;
            return View(listProduct);
        }

        public ActionResult Detail(int ProductID)
        {
            var pro = ProductDAO.Instance.getData(ProductID);
            return View(pro);
        }
    }
}