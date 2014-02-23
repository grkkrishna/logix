using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;




namespace MedCis.UI
{
    public partial class MedMaster : System.Web.UI.MasterPage
    {
       // PatientClass obj = new PatientClass();
        int usertypeId;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.AppendHeader("Refresh",Convert.ToString((Session.Timeout * 60)) +";URL=../Signout.aspx");
            
            if (!Page.IsPostBack)
            {
                if (Page.User.Identity.IsAuthenticated)
                {
                    Label lbl = (Label)LoginView1.FindControl("lblLogin");
                    lbl.Text = "Login as :" + Page.User.Identity.Name ;
            
                }
                else
                {
                    Response.Redirect("~/login.aspx");
                }

               
            }
        }

       

        protected void lbSignout_Click(object sender, EventArgs e)
        {
            System.Web.Security.FormsAuthentication.SignOut();
            
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/login.aspx");
        }






        private void loadMenus(int usertypeId)
        {
            //SecurityMasterClass objSec = new SecurityMasterClass();
           
            //var MainMenu = objSec.GetMainMenuItems(usertypeId);
           
            //repMainMenu.DataSource = MainMenu;
            //repMainMenu.DataBind(); 
           
            //objSec = null;
            
        }

        protected void repMainMenu_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //SecurityMasterClass objSec = new SecurityMasterClass();
                //Label lblMenuId = new Label();
                //lblMenuId = (Label)e.Item.FindControl("lblMenuId");
                //string  mainMenu = lblMenuId.Text;
                ////DataRowView drv = (DataRowView)e.Item.DataItem;
                ////string  mainmenu = drv["lblMain"].ToString();
                //Repeater Repeater2 = new Repeater();
                //Repeater2 = (Repeater)e.Item.FindControl("repDetail");
                //Repeater2.DataSource = objSec.GetMenuByUserType(usertypeId, mainMenu);
                //Repeater2.DataBind();
                //objSec = null;
            }
        }
    }
}
