using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LogBook
{
    public partial class SignOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Web.Security.FormsAuthentication.SignOut();
            Session.Abandon();
            Session.Clear();
           
           
            Response.Redirect("~/login.aspx"); 
        }
    }
}
