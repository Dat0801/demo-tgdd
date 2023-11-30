using MyClass.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
namespace MyClass.DAO
{
    public class ProductDAO
    {
        private static ProductDAO instance;
        public static ProductDAO Instance
        {
            get { if (instance == null) instance = new ProductDAO(); return ProductDAO.instance; }
            private set { ProductDAO.instance = value; }
        }

        private ProductDAO() { }

        public List<Product> getData()
        {
            try
            {
                List<Product> listProduct = new List<Product>();
                string query = "Select * from Product";
                DataTable dt = DataProvider.Instance.ExecuteQuery(query);
                foreach (DataRow row in dt.Rows)
                {
                    var product = new Product(row);
                    listProduct.Add(product);
                }
                return listProduct;
            }
            catch
            {
                throw;
            }
        }

        public Product getData(int ProductID)
        {
            try
            {
                string query = "Select * from Product where ProductID = '" + ProductID + "'";
                DataTable dt = DataProvider.Instance.ExecuteQuery(query);
                var Product = new Product(dt.Rows[0]);
                return Product;
            }
            catch
            {
                throw;
            }
        }

        public List<Product> getDataBrand(int BrandID)
        {
            try
            {
                List<Product> listProduct = new List<Product>();
                string query = "Select * from Product where Active = 1 AND BrandID = " + BrandID;
                DataTable dt = DataProvider.Instance.ExecuteQuery(query);
                foreach (DataRow row in dt.Rows)
                {
                    var product = new Product(row);
                    listProduct.Add(product);
                }
                return listProduct;
            }
            catch
            {
                throw;
            }
        }

        public List<Product> getDataCategory(int CatID)
        {
            try
            {
                List<Product> listProduct = new List<Product>();
                string query = "Select * from Product where Active = 1 AND CatID = " + CatID;
                DataTable dt = DataProvider.Instance.ExecuteQuery(query);
                foreach (DataRow row in dt.Rows)
                {
                    var product = new Product(row);
                    listProduct.Add(product);
                }
                return listProduct;
            }
            catch
            {
                throw;
            }
        }

        public int AddProduct(Product product)
        {
            
            string query = "insert into Product(ProductName, ProductDes, CatID, BrandID, Price, PromotionPrice, ProductImage, MetaKeywords, Quantity, Warranty, CreatedBy, Active)" +
                "values('" + product.ProductName + "', N'" + product.ProductDes + "', '" + product.CatID + "', '" + product.BrandID + "','" + product.Price + "', '" + product.PromotionPrice + "', '" + product.ProductImage + "', '" + product.MetaKeywords + "', '" + product.Quantity + "', '" + product.Warranty + "', '" + product.CreatedBy + "' ,'" + product.Active + "')";
            int rs = DataProvider.Instance.ExecuteNonQuery(query);
            return rs;
        }

        public void DeleteProduct(int ProductID)
        {
            
            string query = "delete from Product where ProductID = '" + ProductID + "' ";
            DataProvider.Instance.ExecuteNonQuery(query);
        }

        public int UpdateProduct(int ProductID, Product product)
        {
            
            string query = "Update Product Set ProductName = '" + product.ProductName + "', ProductDes = N'" + product.ProductDes + "', CatID = '" + product.CatID + "', BrandID = '" + product.BrandID + "', Price = '" + product.Price + "', PromotionPrice = '" + product.PromotionPrice + "', ProductImage = '" + product.ProductImage + "', MetaKeywords = '" + product.MetaKeywords + "', Quantity = '" + product.Quantity + "', Warranty = '" + product.Warranty + "', CreatedBy = '" + product.CreatedBy + "', Active = '" + product.Active + "' " +
                "where ProductID = '" + ProductID + "' ";
            int rs = DataProvider.Instance.ExecuteNonQuery(query);
            return rs;
        }
    }
}
