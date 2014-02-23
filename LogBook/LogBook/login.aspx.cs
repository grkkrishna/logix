using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LogBook.Business;
using LogBook.DAL;
using System.Web.Security;

namespace LogBook
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string strUsername = txtUsername.Text.Trim();
            string strPassword = txtPassword.Text.Trim();
            if (strUsername != string.Empty && strPassword != string.Empty)
            {
                user_master_class objUser = new user_master_class();

                bool isAuth = objUser.GetUserAuth(strUsername, strPassword);
                if (isAuth == true)
                {
                    FormsAuthentication.SetAuthCookie(strUsername, false);
                    
                    

                    //Session["loginUser"] = objUser.GetLoginUserDetails(Page.User.Identity.Name);

                    //objUser.GetUserLog(strUsername, "LogIn");
                    objUser = null;
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    lblMsg.Text = "Username or Password not correct...";
                    Response.Redirect("login.aspx");
                }

            }
            else
            {
                lblMsg.Text = "Username or Password not correct...";
                //Response.Redirect("login.aspx");
            }
        }
    }
}
