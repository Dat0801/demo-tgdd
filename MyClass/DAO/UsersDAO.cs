﻿using MyClass.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyClass.DAO
{
    public class UsersDAO
    {
        private static UsersDAO instance;
        public static UsersDAO Instance
        {
            get { if (instance == null) instance = new UsersDAO(); return UsersDAO.instance; }
            private set { UsersDAO.instance = value; }
        }

        private UsersDAO() { }
        public List<Users> getData()
        {
            try
            {
                List<Users> listUsers = new List<Users>();
                string query = "Select * from Users";
                DataTable dt = DataProvider.Instance.ExecuteQuery(query);
                foreach (DataRow row in dt.Rows)
                {
                    var user = new Users(row);
                    listUsers.Add(user);
                }
                return listUsers;
            }
            catch
            {
                throw;
            }
        }

        public List<Users> getDataAdmin()
        {
            try
            {
                List<Users> listUsers = new List<Users>();
                string query = "Select * from Users where Role = 'Admin'";
                DataTable dt = DataProvider.Instance.ExecuteQuery(query);
                foreach (DataRow row in dt.Rows)
                {
                    var user = new Users(row);
                    listUsers.Add(user);
                }
                return listUsers;
            }
            catch
            {
                throw;
            }
        }

        public Users getData(string username)
        {
            try
            {
                string query = "Select * from Users where UserName = '" + username + "'";
                DataTable dt = DataProvider.Instance.ExecuteQuery(query);
                var user = new Users(dt.Rows[0]);
                return user;
            }
            catch
            {
                throw;
            }
        }

        public int AddUser(Users user)
        {
            string query = "insert into Users(UserName, Password, Name, Phone, Email, Address, Role, Active)" +
                "values('" + user.UserName + "', '" + user.Password + "', N'" + user.Name + "', '" + user.Phone + "', '" + user.Email + "', '" + user.Address + "', '" + user.Role + "', '" + user.Active + "')";
            int rs = DataProvider.Instance.ExecuteNonQuery(query);
            return rs;
        }

        public void DeleteUser(string username)
        {
            string query = "delete from Users where UserName = '" + username + "' ";
            DataProvider.Instance.ExecuteNonQuery(query);
        }

        public int UpdateUser(string username, Users user)
        {
            string query = "Update Users Set Password = '" + user.Password + "', Name = N'" + user.Name + "', Phone = '" + user.Phone + "', Email = '" + user.Email + "', Address = '" + user.Address + "', Role = '" + user.Role + "' , Active = '" + user.Active + "' " +
                "where UserName = '" + username + "' ";
            int rs = DataProvider.Instance.ExecuteNonQuery(query);
            return rs;
        }

        public bool Login(string username, string password)
        {
            string query = "Select * From Users where UserName = '" + username + "' and Password = '" + password + "'";
            DataTable result = DataProvider.Instance.ExecuteQuery(query);
            return result.Rows.Count > 0;
        }

        public bool CheckAdmin(string username)
        {
            string query = "Select * From Users where UserName = '" + username + "' and Role = 'Admin'";
            DataTable result = DataProvider.Instance.ExecuteQuery(query);
            return result.Rows.Count > 0;
        }
    }
}