<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MedMaster.Master" CodeBehind="Instrument_Master.aspx.cs" Inherits="LogBook.UI.Instrument_Master" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>



<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder_Main">
   <div>
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
      
       <ContentTemplate>
       
       
       
        <div id ="pnlPop" runat="server"  class="modalPopup"  
               
               
               style=" border: 3px solid #5983BE; display:block; width:425px;  padding:5px 5px 5px 5px;">
          
            <table class="style1">
                <tr bgcolor="#E8F3FF">
                    <td colspan="2">
                        <b>Add/Edit Instrument
                    <td>
                        <asp:ImageButton ID="ImageButton1" runat="server" 
                            ImageUrl="~/images/icons/Close.gif" CommandArgument="1" 
                            CommandName="close" onclick="ImageButton1_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" Font-Size="12px"  runat="server" Text="Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" Width="250px" Height="22px" 
                            ontextchanged="txtName_TextChanged" CssClass="txtBox" 
                           ></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtName" ErrorMessage="*" ValidationGroup="save"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 
                
                <tr>
                    <td>
                        <asp:Label ID="Label1" Font-Size="12px"  runat="server" Text="Department"></asp:Label>
                    </td>
                    <td>
                        
                    
                        <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="ddl">
                           
                        </asp:DropDownList>
                        
                    
                    </td>
                    
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ErrorMessage="*" ControlToValidate="ddlDepartment" 
                            InitialValue="-- select department--" ValidationGroup="save"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                


                <tr>
                    <td>
                        <asp:Label ID="Label7" Font-Size="12px"  runat="server" Text="Status"></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkStatus" runat="server" Checked="True" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:HyperLink ID="HyperLink2" runat="server">[HyperLink2]</asp:HyperLink>
                    </td>
                    <td>
                        <asp:Button ID="btnSave" runat="server" Height="28px" onclick="btnSave_Click" 
                            Text="Save" Width="75px" ValidationGroup="save" CssClass="fb5" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Label ID="lblMsg"  Font-Size="12px" runat="server"></asp:Label>
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
            
            
       </div>

    <asp:ModalPopupExtender ID="mpEx" runat="server" BackgroundCssClass="modalBackground" DropShadow="true" 
    CancelControlID="HyperLink2" TargetControlID="HyperLink1" PopupControlID="pnlPop" >
    </asp:ModalPopupExtender>
    
           <table class="style1">
               <tr>
                   <td align="left">
                       <asp:TextBox ID="txtSearch" CssClass="txtBox" runat="server"></asp:TextBox>
                       <asp:DropDownList ID="ddlDepartmentSearch" runat="server" CssClass="ddl">
                       </asp:DropDownList>
                       <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click1" 
                           Text="Search" CssClass="fb5" />
                   </td>
                   <td align="right">
                          <asp:HyperLink ID="HyperLink1" runat="server" CssClass="glassy_btn" 
                           Height="22px">Add New Instrument</asp:HyperLink>
                       <%--<asp:ImageButton ID="ImageButton2" runat="server" 
                           ImageUrl="~/images/icons/add.gif" onclick="ImageButton2_Click" />--%>
                   </td>
               </tr>
               <tr>
                   <td colspan="2">
                       <asp:GridView ID="gvInstrument" runat="server" AllowPaging="True" CellPadding="3" 
                       CssClass="mGrid" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr"
                           AutoGenerateColumns="False" DataKeyNames="id"  
                           onpageindexchanging="GridView1_PageIndexChanging" 
                           OnRowCommand="GridView1_RowCommand" onrowdeleting="GridView1_RowDeleting" 
                           PageSize="20" Width="100%">
                           <PagerSettings Mode="Numeric" />
                           <RowStyle Height="25px" />
                           <Columns>
                               <asp:TemplateField HeaderText="Instrument Name">
                                   <ItemTemplate>
                                       <asp:Label ID="lblDoctorName" runat="server" Text='<%# Eval("name")%>'></asp:Label>
                                   </ItemTemplate>
                                   <HeaderStyle HorizontalAlign="Left" />
                               </asp:TemplateField>
                               <asp:TemplateField HeaderText="Department">
                                   <ItemTemplate>
                                       <asp:Label ID="lbldept" runat="server" Text='<%# Eval("dept")%>'></asp:Label>
                                   </ItemTemplate>
                                   <HeaderStyle HorizontalAlign="Left" />
                               </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit">
                                   <ItemTemplate>
                                       <asp:LinkButton ID="LinkButfdton1" runat="server" 
                                           CommandArgument='<%# Eval("id") %>' CommandName="Select">Edit</asp:LinkButton>
                                   </ItemTemplate>
                                   <ItemStyle HorizontalAlign="Center" Width="5%" />
                               </asp:TemplateField>
                               <asp:TemplateField HeaderText="Status">
                                   <ItemTemplate>
                                       <asp:ImageButton ID="imgDel" runat="server" CausesValidation="false" 
                                           CommandArgument='<%# Eval("id") %>' CommandName="Status" 
                                           ImageUrl='<%#  Eval("statusUrl")  %>' />
                                   </ItemTemplate>
                                   <ItemStyle HorizontalAlign="Center" Width="5%" />
                               </asp:TemplateField>
                               <asp:TemplateField HeaderText="Delete">
                                   <ItemTemplate>
                                       <asp:ImageButton ID="imgDel2" runat="server" CausesValidation="false"  Width="20" Height="20" 
                                           CommandArgument='<%# Eval("id") %>' CommandName="Delete" 
                                           ImageUrl="~/Images/Icons/delete.gif" />
                                   </ItemTemplate>
                                   <ItemStyle HorizontalAlign="Center" Width="5%" />
                               </asp:TemplateField>
                           </Columns>
                           <PagerStyle Font-Bold="True" Font-Size="14pt" />
                           <EmptyDataTemplate>
                               <b>Instrument Not Found...</b>
                           </EmptyDataTemplate>
                           <HeaderStyle BackColor="#E8F3FF" Height="35px" />
                           <AlternatingRowStyle CssClass="alt" />
                       </asp:GridView>
                   </td>
               </tr>
           </table>
        
        </ContentTemplate>
       </asp:UpdatePanel>
        </div>      
</asp:Content>



<asp:Content ID="Content2" runat="server" contentplaceholderid="head">

    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style302
        {
            height: 26px;
        }
    </style>

</asp:Content>




<asp:Content ID="Content3" runat="server" 
    contentplaceholderid="contentPlaceholderHeading">

        <asp:Label ID="Label2221" CssClass="style301" runat="server" Font-Bold="False" 
        Text="&amp;nbsp; Instrument Master.."></asp:Label>

</asp:Content>





