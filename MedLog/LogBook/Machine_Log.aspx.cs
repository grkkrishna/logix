using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LogBook.Business;
using LogBook.DAL;

namespace LogBook.UI
{
    public partial class Machine_Log : System.Web.UI.Page
    {
        machinelogClass objLog = new machinelogClass();
        Utilities objUtl = new Utilities();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!Page.IsPostBack)
            {
                txtFdate.Text = DateTime.Now.ToString("MM/dd/yyyy");
                txtTdate.Text = DateTime.Now.ToString("MM/dd/yyyy");
                txtAnaDate.Text = DateTime.Now.ToString("MM/dd/yyyy");
               
                loadDropDown();
                LoadGrid();
                if (objLog.GetLoginUserType(Page.User.Identity.Name) > 1)
                {
                    gvMachineLog.Columns[5].Visible = false;
                    gvMachineLog.Columns[6].Visible = false;
                }
            }
            //txtBarcode.Focus();
            txtBarcode.Focus();
            
        }
        private void LoadGrid()
        {
            int deptid = 0; int macId = 0;
            if (ddlDepartment.SelectedIndex > 0)
                deptid = Convert.ToInt32(ddlDepartment.SelectedValue);
            if (ddlMachines.SelectedIndex > 0)
                macId = Convert.ToInt32(ddlMachines.SelectedValue);
            int verified = 0;
            DateTime? fdate, tdate;
            fdate = Convert.ToDateTime(Convert.ToDateTime(txtFdate.Text).ToShortDateString()).AddHours(0).AddMinutes(0).AddSeconds(1);
            tdate = Convert.ToDateTime(Convert.ToDateTime(txtTdate.Text).ToShortDateString()).AddHours(23).AddMinutes(59).AddSeconds(59);
        
           if(chkVerified.Checked == true)
               verified = 1;

            gvMachineLog.DataSource = objLog.GetMachineLogs(deptid, macId,fdate, tdate,verified );
            gvMachineLog.DataBind();
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            bool isExist = false;
            string str = string.Empty;
           tbl_logbook_machine obj = new tbl_logbook_machine();
            try
            {
               

                //if (ViewState["editId"] != null)
                //{
                    
                //    obj = objLog.GetDepartment(Convert.ToInt32(ViewState["editId"]));
                //    str = ViewState["editId"].ToString();
                //}
                obj.department_id = Convert.ToInt32(ddlDepartment0.SelectedValue);
                obj.machine_id = Convert.ToInt32(ddlMachines0.SelectedValue);
                obj.testdate = Convert.ToDateTime(txtAnaDate.Text);
                obj.analysis_starttime = txtAnalysisTime.Text;
                obj.sid = txtSids.Text;
                obj.analysisby = Page.User.Identity.Name;
                obj.addeddate = DateTime.Now;
                objLog.SaveMachineLog(obj);
                LoadGrid();
                ClearControls();
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message +  "Error while saving";
               // mpEx.Show();
            }
            finally
            {
                obj = null;
               
            }
        
       
        }
    
        private void loadDropDown()
        {
            objUtl.FillCombo(ddlDepartment,"Department");
            objUtl.FillCombo(ddlMachines, "Machine");

            objUtl.FillCombo(ddlDepartment0, "Department");
            objUtl.FillCombo(ddlMachines0, "Machine");

           // objUtl.FillCombo(d, "Department");
            objUtl.FillCombo(ddlMachines, "Machine");


            

        }

       
        protected void ClearControls()
        {
            txtAnaDate.Text = string.Empty;
            txtAnalysisTime.Text = string.Empty;
            txtBarcode.Text = string.Empty;
                      
            ViewState["editId"] = null;
            lblMsg.Text = string.Empty;
            
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                //int id = Convert.ToInt32(e.CommandArgument);
                //mpEx.Show();

                //var temp = objLog.GetDepartment(id);// dt.tbl_cricket_league_divisions.Where(c => c.id == id).SingleOrDefault();
                //if (temp != null)
                //{
                //    ClearControls();
                //    ViewState["editId"] = id.ToString();
                //    txtDeptName.Text = temp.name;
                    
                //    if (temp.IsActive == true)
                //        chkStatus.Checked = true;
                //    else
                //        chkStatus.Checked = false;
                    
                //    //rfFile.ValidationGroup = "rk";
                //}
            }
            else if (e.CommandName == "Status")
            {
                try
                {
                    int id = Convert.ToInt32(e.CommandArgument);
                   // objLog.ChangeStatus(id);
                    //objDept.ChangeStatus(id);
                    LoadGrid();

                }

                catch (Exception ex)
                {

                    lblMsg.Text = "Error while deleting";
                }
            }
            else if (e.CommandName == "Delete")
            {
                try
                {
                    int id = Convert.ToInt32(e.CommandArgument);
                   // objLog.DeleteDepartment(id);
                    LoadGrid();

                }

                catch (Exception ex)
                {

                    lblMsg.Text = "Error while deleting";
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadGrid();
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMachineLog.PageIndex = e.NewPageIndex;
            LoadGrid();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            ClearControls();
            
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton l = (ImageButton)e.Row.FindControl("imgDel2");
                l.Attributes.Add("onclick", "javascript:return " +
                "confirm('Are you sure you want to delete this record " +
                DataBinder.Eval(e.Row.DataItem, "id") + "')");



                Label lblId = new Label();
                CheckBox chk = new CheckBox();
                lblId = (Label)e.Row.FindControl("lblid");
                chk = (CheckBox)e.Row.FindControl("chkVeri");
                bool isVerified = false;
                isVerified = objLog.CheckVerified(Convert.ToInt32(lblId.Text));
                if (isVerified == true)
                {
                    chk.Visible = false;
                    chk.Checked = false;
                }
            }
        }

        private void VerifiedBy()
        {
            foreach (GridViewRow row in gvMachineLog.Rows)
            {
                Label lblId = new Label();
                CheckBox chk = new CheckBox();
                lblId = (Label)row.FindControl("lblid");
                chk = (CheckBox)row.FindControl("chkVeri");
                if (chk.Checked == true)
                {

                    objLog.UpdateVerification(Convert.ToInt32(lblId.Text), this.Page.User.Identity.Name.ToString());

                }

            }
        }
        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            ClearControls();
           
            
        }

        protected void btnSearch_Click1(object sender, EventArgs e)
        {
            if (ddlDepartment.SelectedIndex > 0 && ddlMachines.SelectedIndex > 0)
            {
                LoadGrid();
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ClearControls();
            
        }


        protected void txtBarcode_TextChanged(object sender, EventArgs e)
        {
            if (txtBarcode.Text != string.Empty)
            {
                string strTime = txtAnalysisTime.Text.Trim();
                if (strTime == string.Empty)
                    txtAnalysisTime.Text = DateTime.Now.ToShortTimeString() + ",";
                else
                {
                    strTime = strTime +  DateTime.Now.ToShortTimeString() + ",";
                    txtAnalysisTime.Text = strTime;
                }

                string strSid = txtSids.Text.Trim();
                if (strSid == string.Empty)
                    txtSids.Text = txtBarcode.Text + ",";
                else
                {
                    strSid = strSid +  txtBarcode.Text + ",";
                    txtSids.Text = strSid;
                }
            }
        
            txtBarcode.Text = string.Empty;
            txtBarcode.Focus();
            CPE1.Collapsed = true;
            CPE1.ClientState = "true";//mpEx.Show();
        }


        private class machinesids
        {
            public string time { get; set; }
            public string sid { get; set; }
        }
        

        protected void Button1_Click2(object sender, EventArgs e)
        {
            VerifiedBy();
            LoadGrid();
        }

        protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDepartment.SelectedIndex > 0)
            {
                objUtl.FillCombo(ddlMachines, "Machine", Convert.ToInt32(ddlDepartment.SelectedValue));
            }
            else
            {
                ddlMachines.SelectedIndex = -1;
            }
        }
    }
}
