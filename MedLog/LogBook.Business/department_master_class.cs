using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LogBook.DAL;

namespace LogBook.Business
{
    public class department_master_class
    {
        LogBookDataContext dt = new LogBookDataContext();
        public void SaveDepartment(tbl_logbook_department_master tblObj)
        {

            if (tblObj.id == 0)
                dt.tbl_logbook_department_masters.InsertOnSubmit(tblObj);

            dt.SubmitChanges();

        }
        public tbl_logbook_department_master GetDepartment(int deptId)
        {

            return dt.tbl_logbook_department_masters.Where(e => e.id == deptId).SingleOrDefault();


        }
        public List<tbl_logbook_department_master> GetDepartments(string strDept)
        {

            return dt.tbl_logbook_department_masters.ToList();


        }

        public object GetDepartmentList(string strDept)
        {
            var temp = (from c in dt.tbl_logbook_department_masters
                        where (strDept == string.Empty || c.name.Contains(strDept))
                        select new
                        {
                            id= c.id,
                            name =c.name,
                            status = c.IsActive ,
                            statusUrl = c.IsActive == true ? "~/Images/Icons/active.png" : "~/Images/Icons/inactive.png",
             
                        }).ToList();
                        return temp;
                        


        }

        public void DeleteDepartment(int deptId)
        {
            tbl_logbook_department_master obj = dt.tbl_logbook_department_masters.Where(e => e.id == deptId).SingleOrDefault();
            if (obj != null)
                dt.tbl_logbook_department_masters.DeleteOnSubmit(obj);
            dt.SubmitChanges();

        }


        public void ChangeStatus(int id)
        {
            tbl_logbook_department_master obj = dt.tbl_logbook_department_masters.Where(e => e.id == id).SingleOrDefault();
            if (obj != null)
                obj.IsActive = obj.IsActive == true ? false : true;
            // dt.tbl_logbook_department_masters.DeleteOnSubmit(obj);
            dt.SubmitChanges();
        }

        public bool CheckDepartmentName(string p)
        {
            bool isExist = false;
            var temp = dt.tbl_logbook_department_masters.Where(e => e.name == p).ToList();
            if (temp.Count > 0)
                isExist = true;

            return isExist;
        }
    }
   
}
