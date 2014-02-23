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
using LogBook.Business;
using LogBook.DAL;


namespace LogBook.UI
{
    public partial class User_Master : System.Web.UI.Page
    {
        user_master_class objLog = new user_master_class();
        Utilities objUtl = new Utilities();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {


                LoadGrid();
                loadDropDown();
            }
            HyperLink2.Text = string.Empty;
        }
        private void LoadGrid()
        {
            string strName = string.Empty;
            if (txtSearch.Text != string.Empty)
                strName = txtSearch.Text;
            int usertypeid = 0;

            if (ddlSearUsertype.SelectedIndex > 0)
                usertypeid = Convert.ToInt32(ddlSearUsertype.SelectedValue);
            int deptid =0;
            if (ddlDepartmentSearch.SelectedIndex>0)
                deptid = Convert.ToInt32(ddlDepartmentSearch.SelectedValue);
            gvUser.DataSource = objLog.GetUserList(strName, usertypeid, deptid);
            gvUser.DataBind();
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {

            string str = string.Empty;
            tbl_logbook_user_master obj = new tbl_logbook_user_master();
            try
            {
                if (ViewState["editId"] != null)
                {
                    obj = objLog.GetUser(Convert.ToInt32(ViewState["editId"]));
                    str = ViewState["editId"].ToString();
                }
                obj.username = txtUserName.Text;
                obj.password = txtPassword.Text;
                obj.createdby = Page.User.Identity.Name;
                obj.updatedby = "1";
                obj.deptid = Convert.ToInt32(ddlDepartment.SelectedValue);
                obj.usertype = Convert.ToInt32(ddlUsertype.SelectedValue);
                obj.IsActive = chkStatus.Checked ? true : false;
                objLog.SaveUser(obj);
                LoadGrid();
                ClearControls();
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message+"Error while saving";
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

            txtUserName.Text = string.Empty;

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

                var temp = objLog.GetUser(id);// dt.tbl_cricket_league_divisions.Where(c => c.id == id).SingleOrDefault();
                if (temp != null)
                {
                    ClearControls();
                    ViewState["editId"] = id.ToString();
                    txtUserName.Text = temp.username;

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

                    lblMsg.Text = ex.Message+"Error while deleting";
                }
            }
            else if (e.CommandName == "Delete")
            {
                try
                {
                    int id = Convert.ToInt32(e.CommandArgument);
                    objLog.DeleteUser(id);
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
            gvUser.PageIndex = e.NewPageIndex;
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

        protected void txtUserName_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
