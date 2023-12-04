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

        public Orders getData(int OrderID)
        {
            try
            {
                string query = "Select * from Orders where OrderID = '" + OrderID + "'";
                DataTable dt = DataProvider.Instance.ExecuteQuery(query);
                var Order = new Orders(dt.Rows[0]);
                return Order;
            }
            catch
            {
                throw;
            }
        }

        public int AddOrders(Orders Orders)
        {
            string queryOrders = "insert into Orders values('" + Orders.CreatedDate + "', '" + Orders.ShipDate + "', '" + Orders.Status + "', '" + Orders.ShipStatus + "', '" + Orders.UserName + "')";
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

        public void DeleteOrders(int OrderID)
        {
            string query = "Delete from Orders where OrderID = '" + OrderID + "'";
            DataProvider.Instance.ExecuteNonQuery(query);
        }

        public int UpdateOrders(int OrderID ,Orders order)
        {
            string query = "Update Orders Set CreatedDate = N'" + order.CreatedDate + "', ShipDate = '" + order.ShipDate + "', Status = '" + order.Status + "', ShipStatus = '" + order.ShipStatus + "', UserName = '" + order.UserName + "'" +
               "where OrderID = '" + OrderID + "' ";
            int rs = DataProvider.Instance.ExecuteNonQuery(query);
            return rs;
        }
        public List<Orders> TimKiem(string searchStr)
        {
            try
            {
                List<Orders> listOders = new List<Orders>();
                string query = "SELECT * FROM Orders WHERE UserName LIKE @nameUser";
                object[] parameters = { "%" + searchStr + "%" };

                using (DataTable dt = DataProvider.Instance.ExecuteQuery(query, parameters))
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        var ord = new Orders(row);
                        listOders.Add(ord);
                    }
                }

                return listOders;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
                throw;
            }
        }
    }
}
