using MyClass.DAO;
using MyClass.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TGDD.Controllers
{
    public class MenuController : Controller
    {
        List<Category> listCategory = new List<Category>();
        // GET: Menu
        public ActionResult MenuPartial()
        {
            listCategory = CategoryDAO.Instance.getData();
            return View(listCategory);
        }
    }
}