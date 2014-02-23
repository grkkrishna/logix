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
    public partial class Department_Master : System.Web.UI.Page
    {
        department_master_class objLog = new department_master_class();
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
            string str = string.Empty;
            if (txtSearch.Text != string.Empty)
                str = txtSearch.Text;
            gvDept.DataSource = objLog.GetDepartmentList(str);
            gvDept.DataBind();
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            bool isExist = false;
            string str = string.Empty;
            tbl_logbook_department_master obj = new  tbl_logbook_department_master();
            try
            {
                //////////duplicate name check
                isExist = objLog.CheckDepartmentName(txtDeptName.Text);
                   
                if (isExist == true)
                {
                    lblMsg.Text = "Department name already existed";
                    mpEx.Show();
                    return;
                }
                /////////////////////////////////dupl end


                if (ViewState["editId"] != null)
                {
                    
                    obj = objLog.GetDepartment(Convert.ToInt32(ViewState["editId"]));
                    str = ViewState["editId"].ToString();
                }
                obj.name = txtDeptName.Text;
                obj.IsActive = chkStatus.Checked ? true : false;
                obj.createdby = Page.User.Identity.Name;
                obj.updatedby = "1";
                objLog.SaveDepartment(obj);
                LoadGrid();
                ClearControls();
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message +  "Error while saving";
                mpEx.Show();
            }
            finally
            {
                obj = null;
               
            }
        
       
        }
    
        private void loadDropDown()
        {
            //objUtl.FillCombo(DropDownList1, "Department");
            

        }

       
        protected void ClearControls()
        {
           
            txtDeptName.Text = string.Empty;
          
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

                var temp = objLog.GetDepartment(id);// dt.tbl_cricket_league_divisions.Where(c => c.id == id).SingleOrDefault();
                if (temp != null)
                {
                    ClearControls();
                    ViewState["editId"] = id.ToString();
                    txtDeptName.Text = temp.name;
                    
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

                    lblMsg.Text = "Error while deleting";
                }
            }
            else if (e.CommandName == "Delete")
            {
                try
                {
                    int id = Convert.ToInt32(e.CommandArgument);
                    objLog.DeleteDepartment(id);
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
            gvDept.PageIndex = e.NewPageIndex;
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
    }
}
