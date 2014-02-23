using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LogBook.Business;
using LogBook.DAL;
namespace LogBook.Business
{
    public class machinelogClass
    {
        LogBookDataContext dt = new LogBookDataContext();
        public object GetLogs(int deptid, int instrumentid, DateTime from, DateTime to)
        {
            return dt.tbl_logbook_machines.Where(e=>e.department_id == deptid && e.machine_id == instrumentid).ToList();
        }
        public object GetMachineLogs(int deptid, int instrumentid, DateTime? from, DateTime? to, int verified)
        {
           return dt.tbl_logbook_machines.Where(e => (deptid == 0 || e.department_id == deptid) && 
               (instrumentid ==0 || e.machine_id == instrumentid)
               && (e.addeddate >= from && e.addeddate <= to) &&
               (verified ==0 || e.verified_by != string.Empty)).ToList();
        }

        public void SaveMachineLog(LogBook.DAL.tbl_logbook_machine obj)
        {
            if (obj.id == 0)
                dt.tbl_logbook_machines.InsertOnSubmit(obj);
            dt.SubmitChanges();
        }
         public void UpdateVerification(int recId, string currentUser)
        {
            tbl_logbook_machine obj = dt.tbl_logbook_machines.Where(e => e.id == recId).SingleOrDefault();
            if (obj != null)
            {
                obj.verified_by = currentUser;
                obj.verifieddate = DateTime.Now;
            }
            dt.SubmitChanges();
            
        }

        public bool CheckVerified(int p)
        {
            bool isVer = false;
            var temp = dt.tbl_logbook_machines.Where(e => e.id == p).SingleOrDefault();
            if (temp.verified_by != null)
                isVer = true;

            return isVer;
        }
    }
}
