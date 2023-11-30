using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MyClass.Models;
using System.Data;

namespace MyClass.DAO
{
    public class OrdersDAO
    {
        private static OrdersDAO instance;
        public static OrdersDAO Instance
        {
            get { if (instance == null) instance = new OrdersDAO(); return OrdersDAO.instance; }
            private set { OrdersDAO.instance = value; }
        }

        private OrdersDAO() { }


        public List<Orders> getData()
        {
            try
            {
                List<Orders> listOrders = new List<Orders>();
                string query = "Select * from Orders";
                DataTable dt = DataProvider.Instance.ExecuteQuery(query);
                foreach (DataRow row in dt.Rows)
                {
                    var Order = new Orders(row);
                    listOrders.Add(Order);
                }
                return listOrders;
            }
            catch
            {
                throw;
            }
        }

        public int AddOrders(Orders Orders)
        {
            string queryOrders = "insert into Orders( UserName) values('" + Orders.UserName + "')";
            int rsOrders = DataProvider.Instance.ExecuteNonQuery(queryOrders);
            return rsOrders;
        }
        public int AddOrderDetail(OrderDetail OrderDetail)
        {
            string queryOrderDetail = "insert into OrderDetail " +
                "values(" + OrderDetail.OrderID + "," + OrderDetail.ProductID + "," + OrderDetail.Quantity + ", " + OrderDetail.Price + ")";
            int rsOrderDetail = DataProvider.Instance.ExecuteNonQuery(queryOrderDetail);
            return rsOrderDetail;
        }
    }
}
