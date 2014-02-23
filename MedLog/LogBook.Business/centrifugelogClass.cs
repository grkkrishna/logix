using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LogBook.Business;
using LogBook.DAL;
namespace LogBook.Business
{
    public class centrifugelogClass
    {
        LogBookDataContext dt = new LogBookDataContext();
        public object GetLogs(int deptid, int instrumentid, DateTime? from, DateTime? to, int verified)
        {
            return dt.tbl_logbook_centrifuges.Where(e => (deptid ==0 || e.department_id == deptid)  && 
                (instrumentid == 0 ||  e.machine_id == instrumentid) &&
                (verified ==0 || e.verified_by != string.Empty) &&
                (e.addeddate >= from && e.addeddate <= to)).ToList();
        }
        //public object GetLogs(int deptid, int instrumentid, DateTime from, DateTime to)
        //{
        //    var temp = (from c in dt.tbl_logbook_centrifuges
        //               // where ((deptid == 0 || c.department_id == deptid) ||
        //                //    (instrumentid == 0 || c.machine_id == instrumentid))
        //                select new
        //                {
        //                department =c.tbl_logbook_department_master.name,
        //                machine = c.tbl_logbook_instrument_master.name,
        //                testdate = c.testdate,// != null ? Convert.ToDateTime(c.testdate).ToShortDateString() : "",
        //                analysis_starttime = c.analysis_starttime,
        //                analysis_endtime = c.analysis_endtime,
        //                sid = c.sid,
        //                rpm = c.rpm,
        //                sampletype = c.sampletype,
        //                analysisby = c.analysisby,
        //                verified_by =c.verified_by,
        //                remarks =c.remarks,
        //                //verifieddate = c.verifieddate

        //                }).ToList();

        //    return temp;
        //               }
        public void SaveCentrifugeLog(LogBook.DAL.tbl_logbook_centrifuge obj)
        {
            if (obj.id == 0)
                dt.tbl_logbook_centrifuges.InsertOnSubmit(obj);
            dt.SubmitChanges();
        }

        public void UpdateVerification(int recId, string currentUser)
        {
            tbl_logbook_centrifuge obj = dt.tbl_logbook_centrifuges.Where(e => e.id == recId).SingleOrDefault();
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
            var temp = dt.tbl_logbook_centrifuges.Where(e => e.id == p).SingleOrDefault();
            if (temp.verified_by != null)
                isVer = true;

            return isVer;
        }
    }
}
