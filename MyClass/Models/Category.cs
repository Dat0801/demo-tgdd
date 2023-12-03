using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyClass.Models
{
    public class Category
    {
        public int CatID { get; set; }
        [Required(ErrorMessage = "Bắt buộc nhập tên danh mục")]
        public string CatName { get; set; }
        [Required(ErrorMessage = "Bắt buộc nhập SeoTitle")]
        public string SeoTitle { get; set; }
        public DateTime CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string ModifiedBy { get; set; }
        public string MetaKeywords { get; set; }
        public string MetaDescriptions { get; set; }
        public bool Active { get; set; }
        public string CategoryImage { get; set; }

        public Category(DataRow row)
        {
            this.CatID = (int)row["CatID"];
            this.CatName = row["CatName"].ToString();
            this.SeoTitle = row["SeoTitle"].ToString();
            this.CreatedDate = (DateTime)row["CreatedDate"];
            this.CreatedBy = row["CreatedBy"].ToString();
            this.ModifiedDate = (DateTime)row["ModifiedDate"];
            this.ModifiedBy = row["ModifiedBy"].ToString();
            this.MetaKeywords = row["MetaKeywords"].ToString();
            this.MetaDescriptions = row["MetaDescriptions"].ToString();
            this.Active = (bool)row["Active"];
            this.CategoryImage = row["CategoryImage"].ToString();
        }

        public Category() { }
    }
}
