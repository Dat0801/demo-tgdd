using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyClass.Models
{
    public class Users
    {
        [Required(ErrorMessage = "UserName không được để trống")]
        public string UserName { get; set; }
         [Required(ErrorMessage = "Password không được để trống")]
        public string Password { get; set; }
         [Required(ErrorMessage = "Name không được để trống")]
        public string Name { get; set; }
         [Required(ErrorMessage = "Phone không được để trống")]
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public DateTime CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string ModifiedBy { get; set; }
        public string Role { get; set; }
        public bool Active { get; set; }

        public Users(DataRow row)
        {
            this.UserName = row["UserName"].ToString();
            this.Password = row["Password"].ToString();
            this.Name = row["Name"].ToString();
            this.Phone = row["Phone"].ToString();
            this.Email = row["Email"].ToString();
            this.Address = row["Address"].ToString();
            this.CreatedDate = (DateTime)row["CreatedDate"];
            this.CreatedBy = row["CreatedBy"].ToString();
            this.ModifiedDate = (DateTime)row["ModifiedDate"];
            this.ModifiedBy = row["ModifiedBy"].ToString();
            this.Role = row["Role"].ToString();
            this.Active = (bool)row["Active"];
        }

        public Users() { }
    }
}
