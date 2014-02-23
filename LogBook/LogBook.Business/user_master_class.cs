using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LogBook.Business;
using LogBook.DAL;

namespace LogBook.Business
{
    public class user_master_class
    {
        LogBookDataContext dt = new LogBookDataContext();
        public void SaveUser(tbl_logbook_user_master tblObj)
        {

            if (tblObj.id == 0)
                dt.tbl_logbook_user_masters.InsertOnSubmit(tblObj);

            dt.SubmitChanges();

        }
        public tbl_logbook_user_master GetUser(int UserId)
        {

            return dt.tbl_logbook_user_masters.Where(e => e.id == UserId).SingleOrDefault();


        }
        public List<tbl_logbook_user_master> GetUsers(string strUser)
        {

            return dt.tbl_logbook_user_masters.ToList();


        }
        public object GetUserList(string userName, int  userType, int deptId)
        {

            var temp = (from c in dt.tbl_logbook_user_masters
                        where
                    (userName == string.Empty || c.username.Contains(userName)) &&
                    (userType == 0 || c.usertype == userType) &&
                    (deptId == 0 || c.deptid == deptId)
                        select new 
                        {
                            id = c.id,
                            name = c.username,
                            dept = c.tbl_logbook_department_master.name,
                            usertype = c.usertype ==1 ? "Admin" : "User",
                            status = c.IsActive,
                            statusUrl = c.IsActive == true ? "~/Images/Icons/active.png" : "~/Images/Icons/inactive.png"
             

                        }).ToList();

            return temp;


        }
        public void DeleteUser(int UserId)
        {
            tbl_logbook_user_master obj = dt.tbl_logbook_user_masters.Where(e => e.id == UserId).SingleOrDefault();
            if (obj != null)
                dt.tbl_logbook_user_masters.DeleteOnSubmit(obj);
            dt.SubmitChanges();

        }


        public void ChangeStatus(int id)
        {
            tbl_logbook_user_master obj = dt.tbl_logbook_user_masters.Where(e => e.id == id).SingleOrDefault();
            if (obj != null)
                obj.IsActive = obj.IsActive == true ? false : true;
            // dt.tbl_logbook_user_masters.DeleteOnSubmit(obj);
            dt.SubmitChanges();
        }

        public bool GetUserAuth(string strUsername, string strPassword)
        {
            bool isauth = false;
            var temp = dt.tbl_logbook_user_masters.Where(e => e.username == strUsername && e.password == strPassword).SingleOrDefault();
            if (temp != null)
                isauth = true;

            return isauth;
        }
    }
}
