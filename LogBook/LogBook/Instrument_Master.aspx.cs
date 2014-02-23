using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using LogBook.DAL;
using LogBook.Business;

namespace LogBook.UI
{
    public partial class Instrument_Master : System.Web.UI.Page
    {
        instrument_master_class objLog = new instrument_master_class();
        Utilities objUtl = new Utilities();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                loadDropDown();

                LoadGrid();
                
            }
            HyperLink2.Text = string.Empty;
        }
        private void LoadGrid()
        {
            string strIns = string.Empty;
            int dept = 0;
            if (txtSearch.Text != string.Empty)
                strIns = txtSearch.Text;
            if (ddlDepartmentSearch.SelectedIndex > 0)
                dept = Convert.ToInt32(ddlDepartmentSearch.SelectedValue);
            gvInstrument.DataSource = objLog.GetInstrumentList(strIns,dept);
            gvInstrument.DataBind();
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {

            string str = string.Empty;
            tbl_logbook_instrument_master obj = new tbl_logbook_instrument_master();
            try
            {
                if (ViewState["editId"] != null)
                {
                    obj = objLog.GetInstrument(Convert.ToInt32(ViewState["editId"]));
                    str = ViewState["editId"].ToString();
                }
                obj.name = txtName.Text;
                
                obj.createdby = Page.User.Identity.Name;
                obj.updatedby = "1";
                obj.deptid = Convert.ToInt32(ddlDepartment.SelectedValue);
                obj.IsActive = chkStatus.Checked ? true : false;
                objLog.SaveInstrument(obj);
                LoadGrid();
                ClearControls();
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message + "Error while saving";
                mpEx.Show();
            }
            finally
            {
                obj = null;

            }


        }

        private void loadDropDown()
        {
            objUtl.FillCombo(ddlDepartment, "Department");

            objUtl.FillCombo(ddlDepartmentSearch, "Department");
        }


        protected void ClearControls()
        {

            txtName.Text = string.Empty;

            chkStatus.Checked = false;

            ViewState["editId"] = null;
            lblMsg.Text = string.Empty;

        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                mpEx.Show();

                var temp = objLog.GetInstrument(id);// dt.tbl_cricket_league_divisions.Where(c => c.id == id).SingleOrDefault();
                if (temp != null)
                {
                    ClearControls();
                    ViewState["editId"] = id.ToString();
                    txtName.Text = temp.name;

                    if (temp.IsActive == true)
                        chkStatus.Checked = true;
                    else
                        chkStatus.Checked = false;

                    //rfFile.ValidationGroup = "rk";
                }
            }
            else if (e.CommandName == "Status")
            {
                try
                {
                    int id = Convert.ToInt32(e.CommandArgument);
                    objLog.ChangeStatus(id);
                    //objDept.ChangeStatus(id);
                    LoadGrid();

                }

                catch (Exception ex)
                {

                    lblMsg.Text = ex.Message + "Error while deleting";
                }
            }
            else if (e.CommandName == "Delete")
            {
                try
                {
                    int id = Convert.ToInt32(e.CommandArgument);
                    objLog.DeleteInstrument(id);
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
            gvInstrument.PageIndex = e.NewPageIndex;
            LoadGrid();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            ClearControls();
            mpEx.Hide();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton l = (ImageButton)e.Row.FindControl("imgDel2");
                l.Attributes.Add("onclick", "javascript:return " +
                "confirm('Are you sure you want to delete this record " +
                DataBinder.Eval(e.Row.DataItem, "id") + "')");
            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            ClearControls();

            mpEx.Show();
        }

        protected void btnSearch_Click1(object sender, EventArgs e)
        {
            LoadGrid();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ClearControls();
            mpEx.Hide();
        }

        protected void txtDept_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtName_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
