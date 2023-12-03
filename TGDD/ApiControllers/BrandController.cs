using MyClass.DAO;
using MyClass.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TGDD.Areas.Admin.ApiControllers
{
    public class BrandController : ApiController
    {
        public List<Brand> GetBrandByCatID(int CatID)
        {
            List<Brand> brands = BrandDAO.Instance.getData(CatID);
            return brands;
        }
    }
}
