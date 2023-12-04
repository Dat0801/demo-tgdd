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
    public class OrdersController : Controller
    {
        // GET: Admin/Orders
        List<Orders> listOrder = new List<Orders>();
        public ActionResult XemOrders(int? page)
        {
            int pagesize = 20;
            int pageNumber = (page ?? 1);
            var listOD = OrdersDAO.Instance.getData().ToPagedList(pageNumber, pagesize);
             //ViewBag.listOrder = OrdersDAO.Instance.getData();
            return View(listOD);
        }

        public ActionResult ThemOrder()
        {
            ViewBag.listUser = UsersDAO.Instance.getDataUser();
            return View();
        }

        [HttpPost]
        public ActionResult ThemOrder(Orders order)
        {
            ViewBag.listUser = UsersDAO.Instance.getDataUser();
            if (ModelState.IsValid)
            {
                ViewBag.result = OrdersDAO.Instance.AddOrders(order);
                return View();
            }
            return View();
        }

        public ActionResult SuaOrder(int OrderID)
        {
            Orders order = OrdersDAO.Instance.getData(OrderID);
            ViewBag.listUser = UsersDAO.Instance.getDataUser();
            ViewBag.OrderID = OrderID;
            return View(order);
        }

        [HttpPost]
        public ActionResult SuaOrder(int OrderID, Orders order)
        {
            ViewBag.result = 0;
            ViewBag.listUser = UsersDAO.Instance.getDataUser();
            ViewBag.OrderID = OrderID;
            if (ModelState.IsValid)
            {
                ViewBag.result = OrdersDAO.Instance.UpdateOrders(OrderID, order);
                return View(order);
            }
            return View(order);
        }

        public ActionResult XoaOrder(int OrderID)
        {
            OrdersDAO.Instance.DeleteOrders(OrderID);
            return RedirectToAction("XemOrders");
        }
        public ActionResult TimKiem(string searchStr)
        {
            var kqtimkiem = OrdersDAO.Instance.TimKiem(searchStr);

            return View(kqtimkiem);
        }
    }
}