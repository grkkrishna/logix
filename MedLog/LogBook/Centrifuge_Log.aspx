<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MedMaster.Master" CodeBehind="Centrifuge_Log.aspx.cs" Inherits="LogBook.UI.Centrifuge_Log" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>



<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder_Main">
    <div>
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
      <Triggers>
      <asp:PostBackTrigger ControlID="Button1" />
      <asp:PostBackTrigger ControlID= "txtBarcode" />
      </Triggers>
       <ContentTemplate>
       
              
        <div id ="pnlPop" runat="server"  class="modalPopup"  
               
               
               style=" border: 3px solid #5983BE; display:block; width:650px;  padding:5px 5px 5px 5px;">
          
            <table class="style1">
                <tr bgcolor="#E8F3FF">
                    <td colspan="2">
                        &nbsp;</td>
                    <td width="5">
                        <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument="1" 
                            CommandName="close" ImageUrl="~/images/icons/Close.gif" 
                            onclick="ImageButton1_Click" />
                    </td>
                </tr>
                 <tr>
                     <td class="style303">
                         Scan here</td>
                     <td>
                         <asp:TextBox ID="txtBarcode" runat="server" AutoPostBack="True" Height="30px" 
                             ontextchanged="txtBarcode_TextChanged" Width="100%"></asp:TextBox>
                     </td>
                     <td width="100%">
                         &nbsp;</td>
                </tr>
                 <tr>
                     <td class="style303" colspan="3">
                         <table class="style1">
                             <tr>
                                 <td>
                                     Deparment</td>
                                 <td>
                                     <asp:DropDownList ID="ddlDept" runat="server" AutoPostBack="True" 
                                         CssClass="ddl" onselectedindexchanged="ddlDepartment_SelectedIndexChanged" 
                                         Width="200px">
                                     </asp:DropDownList>
                                 </td>
                                 <td>
                                     Sample Type<asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                                         runat="server" ControlToValidate="ddlsampletype" ErrorMessage="*" 
                                         ValidationGroup="save"></asp:RequiredFieldValidator>
                                 </td>
                                 <td>
                                     <asp:DropDownList ID="ddlsampletype" runat="server" CssClass="ddl" 
                                         Width="200px" onselectedindexchanged="ddlsampletype_SelectedIndexChanged">
                                         <asp:ListItem Value="0">-select sample-</asp:ListItem>
                                         <asp:ListItem Value="1">serum</asp:ListItem>
                                     </asp:DropDownList>
                                 </td>
                             </tr>
                             <tr>
                                 <td>
                                     Instrument</td>
                                 <td>
                                     <asp:DropDownList ID="ddlInstru" runat="server" CssClass="ddl" Width="200px">
                                     </asp:DropDownList>
                                 </td>
                                 <td>
                                     RPM<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                         ControlToValidate="txtRpm" ErrorMessage="*" ValidationGroup="save"></asp:RequiredFieldValidator>
                                 </td>
                                 <td>
                                     <asp:TextBox ID="txtRpm" runat="server" CssClass="txtBox" Height="22px" 
                                         Width="125px"></asp:TextBox>
                                 </td>
                             </tr>
                         </table>
                     </td>
                </tr>
                <tr>
                    <td class="style303">
                        SID<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                            ControlToValidate="txtSids" ErrorMessage="*" ValidationGroup="save"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSids" runat="server" Height="50px" 
                            ontextchanged="txtSids_TextChanged" Rows="1" TextMode="MultiLine" Width="100%"></asp:TextBox>
                    </td>
                    <td width="100%">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style303">
                        <asp:Label ID="Label4" runat="server" Font-Size="12px" Text="Analysis Time"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="txtAnalysisTime" ErrorMessage="*" ValidationGroup="save"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAnalysisTime" runat="server" Height="50px" Rows="3" 
                            TextMode="MultiLine" Width="100%"></asp:TextBox>
                    </td>
                    <td width="100%">
                        &nbsp;</td>
                </tr>
                
                <tr>
                    <td rowspan="1" class="style303">
                        <asp:Label ID="Label2222" runat="server" Text="Analysis End Time" Width="125px"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ControlToValidate="txtendtime" ErrorMessage="*" ValidationGroup="save"></asp:RequiredFieldValidator>
                    </td>
                    <td rowspan="1">
                        
                    
                        <asp:TextBox ID="txtendtime" runat="server" Rows="3" TextMode="MultiLine" 
                            Width="450px"></asp:TextBox>
                    </td>
                    
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style303">
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
                    <td class="style303">
                        &nbsp;</td>
                    <td>
                        <asp:Label ID="lblMsg"  Font-Size="12px" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            
            
       </div>

    <asp:ModalPopupExtender ID="mpEx" runat="server" BackgroundCssClass="modalBackground" DropShadow="true" 
    CancelControlID="HyperLink2" TargetControlID="ImageButton2" PopupControlID="pnlPop" >
    </asp:ModalPopupExtender>
          
    
           <table class="style1">
          
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
                        <asp:Button ID="Button1" runat="server" onclick="Button1_Click1" 
                            Text="Verify" />
                        <asp:ImageButton ID="ImageButton2" runat="server" 
                           ImageUrl="~/images/icons/add.gif" onclick="ImageButton2_Click" />
                       </td>
               </tr>
               <tr>
                   <td colspan="2">
                       <asp:GridView ID="gvCentrifugeLog" runat="server" AllowPaging="True" CellPadding="3" 
                       CssClass="ddl" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr"
                           AutoGenerateColumns="False" DataKeyNames="id"  
                           onpageindexchanging="GridView1_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound" 
                           OnRowCommand="GridView1_RowCommand" onrowdeleting="GridView1_RowDeleting" 
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
                                       <asp:Label ID="lblAnalysisby" runat="server" ToolTip='<%# Eval("addeddate")%>' Text='<%# Eval("analysisby")%>'></asp:Label>
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
                             <%--  <asp:TemplateField HeaderText="Status">
                                   <ItemTemplate>
                                       <asp:ImageButton ID="imgStatus" runat="server" CausesValidation="false"  Width="20" Height="20" 
                                           CommandArgument='<%# Eval("id") %>' CommandName="Status" 
                                            />
                                   </ItemTemplate>
                                   <ItemStyle HorizontalAlign="Center" Width="5%" />
                               </asp:TemplateField>--%>
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
                               <b>Centrifuge log Not Found...</b>
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
        .style303
        {
        }
    </style>

</asp:Content>




<asp:Content ID="Content3" runat="server" 
    contentplaceholderid="contentPlaceholderHeading">

                        <asp:Label ID="Label22" CssClass="style300" runat="server" Font-Bold="False" 
        Text="&amp;nbsp;"></asp:Label>
                        <asp:Label ID="Label2221" CssClass="style301" runat="server" Font-Bold="False" 
        Text="&amp;nbsp;Centrifuge Log"></asp:Label>

</asp:Content>





