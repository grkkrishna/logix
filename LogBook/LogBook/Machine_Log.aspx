<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MedMaster.Master" CodeBehind="Machine_Log.aspx.cs" Inherits="LogBook.UI.Machine_Log" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>



<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder_Main">
    <div>
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
      <Triggers>
      <asp:PostBackTrigger ControlID="btnVerify" />
      <asp:PostBackTrigger ControlID="txtBarcode" />
      </Triggers>
       <ContentTemplate>
       
              
        <div id ="pnlPop" runat="server"  class="modalPopup"  
               
               
               style=" border: 3px solid #5983BE; display:block; width:650px;  padding:5px 5px 5px 5px;">
          
            <table class="style1">
                <tr bgcolor="#E8F3FF">
                    <td colspan="2">
                        <b>LogBook</b></td>
                    <td>
                        <asp:ImageButton ID="ImageButton1" runat="server" 
                            ImageUrl="~/images/icons/Close.gif" CommandArgument="1" 
                            CommandName="close" onclick="ImageButton1_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2222" runat="server" Font-Size="12px" Text="Scan Barcode"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBarcode" runat="server" AutoPostBack="True" 
                            ontextchanged="txtBarcode_TextChanged" Width="480px" CssClass="txtBox" 
                            ForeColor="White"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                 <tr>
                     <td>
                         <asp:Label ID="Label3" runat="server" Font-Size="12px" Text="Analysis Date"></asp:Label>
                     </td>
                     <td>
                         <asp:TextBox ID="txtAnaDate" runat="server" Height="22px" Width="100px" 
                             CssClass="txtBox"></asp:TextBox>
                         <asp:CalendarExtender ID="txtAnaDate_CalendarExtender" runat="server" 
                             Enabled="True" TargetControlID="txtAnaDate">
                         </asp:CalendarExtender>
                     </td>
                     <td>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                             ControlToValidate="txtAnaDate" ErrorMessage="*" ValidationGroup="save"></asp:RequiredFieldValidator>
                     </td>
                </tr>
                 <tr>
                    <td >
                        <asp:Label ID="Label1" runat="server" Font-Size="12px" Text="SIDS"></asp:Label>
                    </td>
                    <td >
                        <asp:TextBox ID="txtSids" runat="server" Height="54px" Rows="5" 
                            TextMode="MultiLine" Width="480px"></asp:TextBox>
                    </td>
                    <td >
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="txtSids" ErrorMessage="*" ValidationGroup="save"></asp:RequiredFieldValidator>
                     </td>
                     <td>
                         &nbsp;</td>
                </tr>
                
                <tr>
                    <td>
                        
                    
                        <asp:TextBox ID="txtAnalysisTime" runat="server" Height="59px" 
                             Rows="5" TextMode="MultiLine" 
                            Width="480px"></asp:TextBox>
                        
                    
                    </td>
                    
                    <td>
                        <asp:Label ID="Label4" Font-Size="12px"  runat="server" Text="Analysis Time"></asp:Label>
                    </td>
                    
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="txtAnalysisTime" ErrorMessage="*" 
                            ValidationGroup="save"></asp:RequiredFieldValidator>
                    </td>
                </tr>


                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
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
       <%--        <tr>
                   <td align="left">
                       <table class="style1">
                           <tr>
                               <td>
                                   &nbsp;</td>
                               <td>
                                   &nbsp;</td>
                               <td>
                                   &nbsp;</td>
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
                               <td>
                                   &nbsp;</td>
                           </tr>
                       </table>
                   </td>
                   <td align="right" width="50%">
                     </td>
               </tr>--%>
               <tr>
                   <td align="left">
                       <asp:DropDownList ID="ddlDepartment" runat="server" AutoPostBack="True" 
                           CssClass="ddl" onselectedindexchanged="ddlDepartment_SelectedIndexChanged" 
                           Width="150px">
                       </asp:DropDownList>
                       <asp:DropDownList ID="ddlMachines" runat="server" CssClass="ddl" Width="150px">
                       </asp:DropDownList>
                       <asp:TextBox ID="txtFdate" runat="server" CssClass="txtBox" Width="100px"></asp:TextBox>
                       <asp:CalendarExtender ID="txtFdate_CalendarExtender" runat="server" 
                           Enabled="True" TargetControlID="txtFdate">
                       </asp:CalendarExtender>
                       <asp:TextBox ID="txtTdate" runat="server" CssClass="txtBox" Width="100px"></asp:TextBox>
                       <asp:CalendarExtender ID="txtTdate_CalendarExtender" runat="server" 
                           Enabled="True" TargetControlID="txtTdate">
                       </asp:CalendarExtender>
                       <asp:CheckBox ID="chkVerified" runat="server" Text="Verified" />
                       <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click1" 
                           Text="Search" CssClass="fb5" />
                   </td>
                   <td align="right" width="50%">
                        
                          <asp:HyperLink ID="HyperLink1" runat="server" CssClass="glassy_btn" 
                           Height="22px">Add New Log</asp:HyperLink> 
                           
                           <asp:Button ID="btnVerify" runat="server"  
                            Text="Verify" onclick="Button1_Click2" CssClass="fb5"  />
                       </td>
               </tr>
               <tr>
                   <td colspan="2">
                       <asp:GridView ID="gvMachineLog" runat="server" AllowPaging="True" CellPadding="3" 
                       CssClass="ddl" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr"
                           AutoGenerateColumns="False" DataKeyNames="id"  
                           onpageindexchanging="GridView1_PageIndexChanging" 
                           OnRowCommand="GridView1_RowCommand" onrowdeleting="GridView1_RowDeleting" 
                           OnRowDataBound="GridView1_RowDataBound"
                           PageSize="20" Width="100%">
                           <PagerSettings Mode="Numeric" />
                           <RowStyle Height="25px" />
                           <Columns>
                               <asp:TemplateField HeaderText="Date">
                                   <ItemTemplate>
                                       <asp:Label ID="lblDate" runat="server" Text='<%# Eval("testdate")%>'></asp:Label>
                                   </ItemTemplate>
                                   <HeaderStyle HorizontalAlign="Left" />
                               </asp:TemplateField>
                                                              <asp:TemplateField HeaderText="Analysis Time">
                                   <ItemTemplate>
                                       <asp:Label ID="analysis_starttime" runat="server" Text='<%# Eval("analysis_starttime")%>'></asp:Label>
                                   </ItemTemplate>
                                   <HeaderStyle HorizontalAlign="Left" />
                               </asp:TemplateField>
                               <asp:TemplateField HeaderText="SID">
                                   <ItemTemplate>
                                       <asp:Label ID="lblSId" runat="server" Text='<%# Eval("sid")%>'></asp:Label>
                                   </ItemTemplate>
                                   <HeaderStyle HorizontalAlign="Left" />
                               </asp:TemplateField>
                               <asp:TemplateField HeaderText="Analysis By">
                                   <ItemTemplate>
                                       <asp:Label ID="lblAnalysisby" ToolTip='<%# Eval("addeddate")%>' runat="server" Text='<%# Eval("analysisby")%>'></asp:Label>
                                   </ItemTemplate>
                                   <HeaderStyle HorizontalAlign="Left" />
                               </asp:TemplateField>
                               <asp:TemplateField HeaderText="Verifiedby">
                                   <ItemTemplate>
                                    <asp:CheckBox ID="chkVeri" runat="server" /> 
                                       <asp:Label ID="lblVeri" ToolTip='<%# Eval("verifieddate")%>' runat="server" Text='<%# Eval("verified_by")%>'></asp:Label>
                                   </ItemTemplate>
                                   <HeaderStyle HorizontalAlign="Left" />
                               </asp:TemplateField>

                                <asp:TemplateField HeaderText="Edit">
                                   <ItemTemplate>
                                   <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                       <asp:LinkButton ID="LinkButfdton1" runat="server" 
                                           CommandArgument='<%# Eval("id") %>' CommandName="Select">Edit</asp:LinkButton>
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
                               <b>Machine log Not Found...</b>
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
    </style>

</asp:Content>




<asp:Content ID="Content3" runat="server" 
    contentplaceholderid="contentPlaceholderHeading">
    </asp:Label><asp:Label ID="Label2221" CssClass="style301" runat="server" Font-Bold="False" 
        Text="&amp;nbsp; Machine Logbook"></asp:Label>

</asp:Content>





