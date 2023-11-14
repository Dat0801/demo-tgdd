using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyClass.Models
{
    public class Brand
    {
        public int BrandID { get; set; }
        public string BrandName { get; set; }
        public string BrandImage { get; set; }
        public int CatID { get; set; }
        public bool Active { get; set; }

        public Brand(DataRow row)
        {
            this.BrandID = (int)row["BrandID"];
            this.BrandName = row["BrandName"].ToString();
            this.BrandImage = row["BrandImage"].ToString();
            this.CatID = (int)row["CatID"];
            this.Active = (bool)row["Active"];
        }

        public Brand() { }
    }
}
