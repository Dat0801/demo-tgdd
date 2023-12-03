﻿using MyClass.DAO;
using MyClass.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
namespace TGDD.Areas.Admin.Controllers
{
    public class BrandController : Controller
    {
        // GET: Admin/Brand
        List<Brand> listBrand = new List<Brand>();
        public ActionResult XemBrand(int? page)
        {
            int pagesize = 10;
            int pageNumber = (page ?? 1);
            var listBrand = BrandDAO.Instance.getData().ToPagedList(pageNumber, pagesize);
            ViewBag.listCategory = CategoryDAO.Instance.getData();
            return View(listBrand);
        }

        public ActionResult ThemBrand()
        {
            ViewBag.listCategory = CategoryDAO.Instance.getData();
            return View();
        }

        [HttpPost]
        public ActionResult ThemBrand(Brand brand)
        {
            ViewBag.result = 0;
            ViewBag.listCategory = CategoryDAO.Instance.getData();
            if (ModelState.IsValid)
            {
                ViewBag.result = BrandDAO.Instance.AddBrand(brand);
                return View();
            }
            return View();
        }

        public ActionResult SuaBrand(int BrandID)
        {
            Brand brand = BrandDAO.Instance.getDataBrandID(BrandID);
            ViewBag.listCategory = CategoryDAO.Instance.getData();
            ViewBag.BrandID = BrandID;
            return View(brand);
        }

        [HttpPost]
        public ActionResult SuaBrand(int BrandID, Brand brand)
        {
            ViewBag.result = BrandDAO.Instance.UpdateBrand(BrandID, brand);
            ViewBag.BrandID = BrandID;
            return View(brand);
        }

        public ActionResult XoaBrand(int BrandID)
        {
            BrandDAO.Instance.DeleteBrand(BrandID);
            return RedirectToAction("XemBrand");
        }
    }
}