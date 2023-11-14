using MyClass.DAO;
using MyClass.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TGDD.Controllers
{
    public class BrandController : Controller
    {
        List<Brand> listBrand = new List<Brand>();
        // GET: Brand
        public ActionResult BrandPartial(int CatID)
        {
            listBrand = BrandDAO.Instance.getData(CatID);
            return View(listBrand);
        }
    }
}