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
                    var product = new Product(row,1);
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
                string query = "Select distinct * from Product, DETAILPRO where Product.ProductID = DETAILPRO.ProductID AND Product.ProductID = '" + ProductID + "'";
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
                    var product = new Product(row,1);
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
                    var product = new Product(row,1);
                    listProduct.Add(product);
                }
                return listProduct;
            }
            catch
            {
                throw;
            }
        }
        public List<Product> GetLichSuMua(string name)
        {
            try
            {
                List<Product> listProduct = new List<Product>();
                string query = "Select p.ProductID, p.ProductName,ProductImage,od.Quantity,PromotionPrice,MetaKeywords " +
                                "from Product p inner join OrderDetail od on p.ProductID = od.ProductID " +
                                "inner join Orders o on od.OrderID = o.OrderID " +
                                "where o.UserName = '" + name + "'";
                DataTable dt = DataProvider.Instance.ExecuteQuery(query);
                foreach (DataRow row in dt.Rows)
                {
                    var product = new Product(row, "a");
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
            string query1 = "insert into DETAILPRO"+
                "values('" + product.DetailPro.ProductID + "', N'" + product.DetailPro.IDDetail + "', '" + product.DetailPro.ManHinh + "', '" + product.DetailPro.HeDieuHanh + "','" + product.DetailPro.Chip + "', '" + product.DetailPro.RAM + "', '" + product.DetailPro.DungLuong + "', '" + product.DetailPro.KetNoi + "', '" + product.DetailPro.Sim + "', '" + product.DetailPro.CamSau + "', '" + product.DetailPro.CamTruoc + "' ,'" + product.DetailPro.Pin_Sac + "' ,'" + product.DetailPro.Hang + "' ,'" + product.DetailPro.Loai + "')";
            int rs1 = DataProvider.Instance.ExecuteNonQuery(query);
            if(rs1==rs)
                return rs;
            return rs1;
        }

        public void DeleteProduct(int ProductID)
        {
            
            string query = "delete from Product where ProductID = '" + ProductID + "' ";
            string querydetail = "delete from DETAILPRO where ProductID = '" + ProductID + "' ";
            DataProvider.Instance.ExecuteNonQuery(query);
            DataProvider.Instance.ExecuteNonQuery(querydetail);
        }

        public int UpdateProduct(int ProductID, Product product)
        {
            
            string query = "Update Product Set ProductName = '" + product.ProductName + "', ProductDes = N'" + product.ProductDes + "', CatID = '" + product.CatID + "', BrandID = '" + product.BrandID + "', Price = '" + product.Price + "', PromotionPrice = '" + product.PromotionPrice + "', ProductImage = '" + product.ProductImage + "', MetaKeywords = '" + product.MetaKeywords + "', Quantity = '" + product.Quantity + "', Warranty = '" + product.Warranty + "', CreatedBy = '" + product.CreatedBy + "', Active = '" + product.Active + "' " +
                "where ProductID = '" + ProductID + "' ";
            string querydetail = "Update DETAILPRO Set ManHinh = '" + product.DetailPro.ManHinh + "', HeDieuHanh = N'" + product.DetailPro.HeDieuHanh + "', Chip = '" + product.DetailPro.Chip + "', RAM = '" + product.DetailPro.RAM + "', DungLuong = '" + product.DetailPro.DungLuong + "', KetNoi = '" + product.DetailPro.KetNoi + "', Sim = '" + product.DetailPro.Sim + "', CamSau = '" + product.DetailPro.CamSau + "', CamTruoc = '" + product.DetailPro.CamTruoc + "', Pin_Sac = '" + product.DetailPro.Pin_Sac + "', Hang = '" + product.DetailPro.Hang + "', Loai = '" + product.DetailPro.Loai + "' " +
               "where ProductID = '" + ProductID + "' ";
            int rs = DataProvider.Instance.ExecuteNonQuery(query);
            int rs1 = DataProvider.Instance.ExecuteNonQuery(querydetail);
            if (rs1 == rs)
                return rs;
            return rs1;
        }
    }
}
