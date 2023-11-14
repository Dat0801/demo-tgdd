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
            
            return View();
        }
        
        public ActionResult BaoCaoNgay()
        {
            return View();
        }
        public ActionResult BaoCaoThang()
        {
            return View();
        }
        public ActionResult QuanLyUser()
        {
            return View();
        }
    }
}