<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="LogBook.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
   
<style type="text/css">

body {
    background-image: url(http://free2ads.in/styles/m_bg.png);
  
  
  
    font-family: "Helvetica Neue", Helvetica, Arial;
    padding-top: 20px;
}

.container {
    width: 406px;
    max-width: 406px;
    margin: 0 auto; margin-top:0px;
}

#signup {
    padding: 0px 25px 25px;
    background: #F1FFFF;
    box-shadow: 
        0px 0px 0px 5px rgba( 255,255,255,0.4 ), 
        0px 4px 20px rgba( 0,0,0,0.33 );
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    border-radius: 5px;
    display: table;
    position: static;
}
#img {
    padding: 0px 2px 2px;
    
    box-shadow: 
        0px 0px 0px 5px rgba( 255,255,255,0.4 ), 
        0px 4px 20px rgba( 0,0,0,0.33 );
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    border-radius: 5px;
    
}
.fb5 {
	background-color: #db6600;
	padding-left:6px;
	padding-right:6px;
	height:26px;
	 cursor:pointer;	border:1;-webkit-border-radius: 3px;
  -moz-border-radius: 3px; -ms-border-radius: 3px;border-radius:3px;
	color: #ffffff;
	border:1px solid #db6600;
	background-image: url(images/button_bg.jpg);
}
.fb5:hover {
	background-color: #000000;	
	border:1px solid #000000; cursor:hand;border:1;-webkit-border-radius:3px;
  -moz-border-radius: 3px;-ms-border-radius: 3px;border-radius:3px;
	background-image: url(images/button_bg_over.jpg);
}
.txtBox
{
	background-image:url(images/form_bg.jpg);
	background-repeat:repeat-x;
	border:1px solid #d1c7ac;
	width: 230px; height:18px;
	color:Gray;
	padding:3px;
	margin-right:2px;
	margin-bottom:2px;
	border-radius:4px;-webkit-border-radius:4px;
  -moz-border-radius: 4px;-ms-border-radius: 4px;
}
#signup .header {
    margin-bottom: 20px;
}

#signup .header h3 {
    color: #333333;
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 5px;
}

#signup .header p {
    color: #8f8f8f;
    font-size: 14px;
    font-weight: 300;
}

#signup .sep {
    height: 1px;
    background: #e8e8e8;
    width: 406px;
    margin: 0px -25px;
}

#signup .inputs {
    margin-top: 25px;
}

#signup .inputs label {
    color: #8f8f8f;
    font-size: 12px;
    font-weight: 300;
    letter-spacing: 1px;
    margin-bottom: 7px;
    display: block;
}

input::-webkit-input-placeholder {
    color:    #b5b5b5;
}

input:-moz-placeholder {
    color:    #b5b5b5;
}

#signup .inputs input {
    background: #f5f5f5;
    font-size: 0.8rem;
    -webkit-border-radius:3px;
  -moz-border-radius: 3px;-ms-border-radius: 3px;border-radius:3px;
    border-radius: 3px;
    border: none;
    padding: 13px 10px;
    width: 330px;
    margin-bottom: 20px;
    box-shadow: inset 0px 2px 3px rgba( 0,0,0,0.1 );
    clear: both;
}

#signup .inputs input:focus {
    background: #fff;
    box-shadow: 0px 0px 0px 3px #fff38e, inset 0px 2px 3px rgba( 0,0,0,0.2 ), 0px 5px 5px rgba( 0,0,0,0.15 );
    outline: none;   
}

#signup .inputs .checkboxy {
    display: block;
    position: static;
    height: 25px;
    margin-top: 10px;
    clear: both;
}

#signup .inputs input[type=checkbox] {
    float: left;
    margin-right: 10px;
    margin-top: 3px;
}

#signup .inputs label.terms {
    float: left;
    font-size: 14px;
    font-style: italic;
}

#signup .inputs #submit {
    width: 100%;
    margin-top: 20px;
    padding: 15px 0;
    color: #fff;
    font-size: 14px;
    font-weight: 500;
    letter-spacing: 1px;
    text-align: center;
    text-decoration: none;
        background: -moz-linear-gradient(
        top,
        #b9c5dd 0%,
        #a4b0cb);
    background: -webkit-gradient(
        linear, left top, left bottom, 
        from(#b9c5dd),
        to(#a4b0cb));
    -webkit-border-radius:5px;
  -moz-border-radius: 5px;-ms-border-radius: 5px;
    border-radius: 5px;
    border: 1px solid #737b8d;
    -moz-box-shadow:
        0px 5px 5px rgba(000,000,000,0.1),
        inset 0px 1px 0px rgba(255,255,255,0.5);
    -webkit-box-shadow:
        0px 5px 5px rgba(000,000,000,0.1),
        inset 0px 1px 0px rgba(255,255,255,0.5);
    box-shadow:
        0px 5px 5px rgba(000,000,000,0.1),
        inset 0px 1px 0px rgba(255,255,255,0.5);
    text-shadow:
        0px 1px 3px rgba(000,000,000,0.3),
        0px 0px 0px rgba(255,255,255,0);
    display: table;
    position: static;
    clear: both;
}

#signup .inputs #submit:hover {
    background: -moz-linear-gradient(
        top,
        #a4b0cb 0%,
        #b9c5dd);
    background: -webkit-gradient(
        linear, left top, left bottom, 
        from(#a4b0cb),
        to(#b9c5dd));
}

    .style1
    {
        width: 100%;
    }

#signup0 {
    padding: 0px 25px 25px;
    background: #fff;
    box-shadow: 
        0px 0px 0px 5px rgba( 255,255,255,0.4 ), 
        0px 4px 20px rgba( 0,0,0,0.33 );
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    border-radius: 5px;
    display: table;
    position: static;
}

    </style>
    <title>Welcome to MedCisPathLabs</title>
</head>
<body>
<form id="Form" runat="server">
    
        <%--<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>--%>
               <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>--%>
    
        
        
        <table width="980" align="center">
        <tr>
        <td rowspan="3">
                    <div id="img">
                    </div>
                </td>
        <td>
            &nbsp;</td>
        
        <td>
        
            &nbsp;</td>
        </tr>
        
        <tr>
        <td>
        </td>
        
        <td>
        
<div class="container">

    <div id="signup">
    

      <div class="header">
        
          <h3>MEDCIS - LOG BOOK ENTRY<br />
              <br />
              Sign In </h3>
        </div>
        
       

        
        
        
                
                 <table class="style1" align="center">
            <tr>
                <td>
                    &nbsp;</td>
                <td height="25">
                    Usernamebr />
                </td>
                <td height="25">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td height="25">
                
                <asp:TextBox ID="txtUsername" CssClass="txtBox" runat="server" Width="250px" 
                        Height="28px" ></asp:TextBox>
                  
               
            
                </td>
                <td height="25">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td height="25">
                    Password<td height="25">
                    &nbsp;</td>
            </tr>
                     <tr>
                         <td>
                             &nbsp;</td>
                         <td height="25">
                             <asp:TextBox ID="txtPassword" runat="server" CssClass="txtBox" Height="28px" 
                                 Width="250px" TextMode="Password"></asp:TextBox>
                           
                             <td height="25">
                                 &nbsp;</td>
                         </td>
                     </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td height="25">
                    <asp:CheckBox runat="server" 
                        Text="Remember me next time." ID="RememberMe"></asp:CheckBox>
                </td>
                <td height="25">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td height="25">
                    
                        <a id="A2" href="#">
                        <asp:Button ID="A1" runat="server" Height="28px" onclick="btnSave_Click" 
                        Text="Login" Width="50%" CssClass="fb5" /></a>
                </td>
                <td height="25">
                   </td>
            </tr>
            <tr>
                <td>
                    </td>
                <td>
                 <asp:Label ID="lblMsg" runat="server" ForeColor="#FF3300" Font-Bold="True" 
                        Font-Italic="False" Font-Size="13px"></asp:Label>
                   <%-- <asp:Literal runat="server" ID="FailureText" EnableViewState="False">
                       </asp:Literal>--%>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#044B7A">Forgot Password?</asp:HyperLink>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
                     <tr>
                         <td>
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                     </tr>
        </table>
        
        </td>
        </tr>
        
        <tr>
        <td>
        </td>
        
        <td>
        
<div class="container">

  </div>
        
        </td>
        </tr>
        </table>
       
  
     
              <%-- </ContentTemplate>
               </asp:UpdatePanel>--%>
              
  
    </form>
       
         </body>
</html>
