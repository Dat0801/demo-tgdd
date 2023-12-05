using MyClass.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyClass.DAO
{
    public class BrandDAO
    {
        private static BrandDAO instance;
        public static BrandDAO Instance
        {
            get { if (instance == null) instance = new BrandDAO(); return BrandDAO.instance; }
            private set { BrandDAO.instance = value; }
        }

        private BrandDAO() { }

        public List<Brand> getData()
        {
            try
            {
                List<Brand> listBrand = new List<Brand>();
                string query = "Select * from Brand";
                DataTable dt = DataProvider.Instance.ExecuteQuery(query);
                foreach (DataRow row in dt.Rows)
                {
                    var brand = new Brand(row);
                    listBrand.Add(brand);
                }
                return listBrand;
            }
            catch
            {
                throw;
            }
        }

        public Brand getDataBrandID(int BrandID)
        {
            try
            {
                string query = "Select * from Brand where BrandID = '" + BrandID + "'";
                DataTable dt = DataProvider.Instance.ExecuteQuery(query);
                var brand = new Brand(dt.Rows[0]);
                return brand;
            }
            catch
            {
                throw;
            }
        }

        public List<Brand> getData(int CatID)
        {
            try
            {
                List<Brand> listBrand = new List<Brand>();
                string query = "Select * from Brand where Brand.CatID = '" + CatID + "'";
                DataTable dt = DataProvider.Instance.ExecuteQuery(query);
                foreach (DataRow row in dt.Rows)
                {
                    var brand = new Brand(row);
                    listBrand.Add(brand);
                }
                return listBrand;
            }
            catch
            {
                throw;
            }
        }

        public int AddBrand(Brand brand)
        {
            string query = "insert into Brand(BrandName, BrandImage, CatID, Active)" +
                "values(N'" + brand.BrandName + "', '" + brand.BrandImage + "', '" + brand.CatID + "', '" + brand.Active + "')";
            int rs = DataProvider.Instance.ExecuteNonQuery(query);
            return rs;
        }

        public void DeleteBrand(int BrandID)
        {
            string query = "delete from Brand where BrandID = '" + BrandID + "' ";
            DataProvider.Instance.ExecuteNonQuery(query);
        }

        public int UpdateBrand(int BrandID, Brand brand)
        {
            string query = "Update Brand Set BrandName = N'" + brand.BrandName + "', BrandImage = '" + brand.BrandImage + "', CatID = '" + brand.CatID + "', Active = '" + brand.Active + "' " +
                "where BrandID = '" + BrandID + "' ";
            int rs = DataProvider.Instance.ExecuteNonQuery(query);
            return rs;
        }
        
        public List<Brand> TimKiem(string searchStr)
        {
            try
            {
                List<Brand> listBrand = new List<Brand>();
                string query = "SELECT * FROM Brand WHERE BrandName LIKE @tenbrand";
                object[] parameters = { "%" + searchStr + "%" };

                using (DataTable dt = DataProvider.Instance.ExecuteQuery(query, parameters))
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        var brand = new Brand(row);
                        listBrand.Add(brand);
                    }
                }

                return listBrand;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
                throw;
            }
        }
    }
}
