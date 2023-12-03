﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyClass.Models
{
    public class Orders
    {
        public int OrderID { get; set; }
        [Required(ErrorMessage = "Bắt buộc nhập ngày tạo")]
        public DateTime CreatedDate { get; set; }
        [Required(ErrorMessage = "Bắt buộc nhập ngày giao")]
        public DateTime ShipDate { get; set; }
        public bool Status { get; set; }
        public bool ShipStatus { get; set; }
        public string UserName { get; set; }
        public Orders(DataRow row)
        {
            this.OrderID = (int)row["OrderID"];
            this.CreatedDate = (DateTime)row["CreatedDate"];
            this.ShipDate = (DateTime)row["ShipDate"];   
            this.Status=(bool)row["Status"];
            this.ShipStatus = (bool)row["Status"];
            this.UserName = row["UserName"].ToString();
        }
        public Orders() { }

    }
}
