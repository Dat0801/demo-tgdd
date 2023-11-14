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
    public class CategoryDAO
    {
        private static CategoryDAO instance;
        public static CategoryDAO Instance
        {
            get { if (instance == null) instance = new CategoryDAO(); return CategoryDAO.instance; }
            private set { CategoryDAO.instance = value; }
        }

        private CategoryDAO() { }

        public List<Category> getData()
        {
            try
            {
                List<Category> listCategory = new List<Category>();
                string query = "Select * from ProductCategory";
                DataTable dt = DataProvider.Instance.ExecuteQuery(query);
                foreach (DataRow row in dt.Rows)
                {
                    var Category = new Category(row);
                    listCategory.Add(Category);
                }
                return listCategory;
            }
            catch
            {
                throw;
            }
        }
        public Category getData(int CatID)
        {
            try
            {
                string query = "Select * from ProductCategory where CatID = '" + CatID + "'";
                DataTable dt = DataProvider.Instance.ExecuteQuery(query);
                var Category = new Category(dt.Rows[0]);
                return Category;
            }
            catch
            {
                throw;
            }
        }

        public int AddCategory(Category category)
        {
            string query = "insert into ProductCategory(CatName, SeoTitle, CreatedBy, CategoryImage, Active)" +
                "values(N'" + category.CatName + "', '" + category.SeoTitle + "', '" + category.CreatedBy + "', '" + category.CategoryImage + "', '" + category.Active + "')";
            int rs = DataProvider.Instance.ExecuteNonQuery(query);
            return rs;
        }

        public void DeleteCategory(int? CatID)
        {
            string query = "delete from ProductCategory where CatID = '" + CatID + "' ";
            DataProvider.Instance.ExecuteNonQuery(query);
        }

        public int UpdateCategory(int? CatID, Category category)
        {
            string query = "Update ProductCategory Set CatName = N'" + category.CatName + "', SeoTitle = '" + category.SeoTitle + "', CreatedBy = '" + category.CreatedBy + "', CategoryImage = '" + category.CategoryImage + "', Active = '" + category.Active + "' " +
                "where CatID = '" + CatID + "' ";
            int rs = DataProvider.Instance.ExecuteNonQuery(query);
            return rs;
        }
    }
}
