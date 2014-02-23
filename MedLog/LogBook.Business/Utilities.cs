using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI;
using LogBook.DAL;
namespace LogBook.Business
{
    public class Utilities : Page
    {

        public void FillCombo(DropDownList ddl, string Desc)
        {
            LogBookDataContext dt = new LogBookDataContext();
            if (Desc == "Department")
            {
                var temp = (from c in dt.tbl_logbook_department_masters
                            orderby c.name ascending
                            select c).ToList().Distinct();

                ddl.Items.Clear();
                ddl.DataSource = temp.ToArray();
                ddl.DataTextField = "name";
                ddl.DataValueField = "id";
                ddl.DataBind();
                ddl.Items.Insert(0, "--Select department--");
                ddl.Items[0].Selected = true;
            }
            else if (Desc == "Machine")
            {
             
                var temp = (from c in dt.tbl_logbook_instrument_masters
                            orderby c.name ascending
                            select c).ToList().Distinct();

                ddl.Items.Clear();
                ddl.DataSource = temp.ToArray();
                ddl.DataTextField = "name";
                ddl.DataValueField = "id";
                ddl.DataBind();
                ddl.Items.Insert(0, "--Select department--");
                ddl.Items[0].Selected = true;
            }
        }
        public void FillCombo(DropDownList ddl, string Desc, int value)
        {
            LogBookDataContext dt = new LogBookDataContext();
            
            if (Desc == "Machine" && value >0)
            {

                var temp = (from c in dt.tbl_logbook_instrument_masters
                            where c.deptid == value
                            orderby c.name ascending
                            select c).ToList().Distinct();

                ddl.Items.Clear();
                ddl.DataSource = temp.ToArray();
                ddl.DataTextField = "name";
                ddl.DataValueField = "id";
                ddl.DataBind();
                ddl.Items.Insert(0, "--Select instrument--");
                ddl.Items[0].Selected = true;
            }
        }
   
    }
}
