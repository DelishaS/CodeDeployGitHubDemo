<%@ Page Language="VB" AutoEventWireup="false" CodeFile="EditUser.aspx.vb" Inherits="EditUser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit User Details</title>
   
 <script type= "text/javascript">
     function trim(stringToTrim) {
	return stringToTrim.replace(/^\s+|\s+$/g,"");
}


      function ValidateControl()
      {
      
        var mgremail =document.getElementById("TxtManagerEmail").value;
        if (trim(mgremail)=="")
        {
             alert("Please Enter manager email id"); 
            return false;
        }
        
    }
</script>



</head>
<body >

    <form id="form1" runat="server">
   <div id="wrapper" style="width:990px;">
       <table cellspacing="0" cellpadding="0" border="0" width="100%" align="center">
    <tr  valign="bottom">
    <td align ="center" class="style2" colspan="2"> <img alt="cscheader" src="Images/INT_csc_rgb_150.jpg" 
              style="width: 160px; height: 105px" hspace="0" /></td>
<td></td>
</tr>
  <tr  valign="bottom" align ="left">
  <td align="right" class="style4">
      <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Blue" >Logout</asp:LinkButton>
  </td>
  <td>
      &nbsp;&nbsp;&nbsp;&nbsp;</td>
  <td></td>
  </tr>
  <tr>
  <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:LinkButton ID="lnkApplyLeave" runat="server" 
          PostBackUrl="~/LeavePlan.aspx"  ForeColor="Blue">Apply for leave</asp:LinkButton>   
       &nbsp;   &nbsp;   
       <asp:LinkButton ID="lnkApprove" runat="server" 
          PostBackUrl="~/LeaveManagement.aspx?a=1" ForeColor="Blue">Approve/Cancel Employee Leave</asp:LinkButton>  
       &nbsp;   &nbsp;   <asp:LinkButton ID="lnkOverviewofTeamLeave" runat="server" 
          PostBackUrl="~/LeaveManagement.aspx?a=2" ForeColor="Blue">Overview of Team Leave </asp:LinkButton>  
&nbsp;   &nbsp;   <asp:LinkButton ID="LinkButton2" runat="server" 
          PostBackUrl="~/EditUser.aspx" ForeColor="Blue"> Edit Profile </asp:LinkButton>  
          &nbsp;   &nbsp;   <asp:LinkButton ID="LinkButton4" runat="server" 
          PostBackUrl="~/ChangePassword.aspx" ForeColor="Blue"> Change Password </asp:LinkButton>  


  </td>
  <td></td>
  </tr>
<tr><td height="10" class="style2" colspan="2"></td></tr>
<tr><td height="3" bgcolor="#e5e5e5" colspan="2" ></td></tr>
<tr> <td height="10" class="style2" colspan="2"></td></tr>
</table>

     <table cellspacing="0" cellpadding="0" border="0" width="660"   align="center">
    <tr>
      <td colspan ="5" align ="center" bgcolor="Silver">
          <asp:Label ID="Label1" runat="server" Text="Employee Record " Font-Bold ="true"></asp:Label></td>

   </tr>  

        <tr>
        <td height="17"></td>
  
			<td width="180" >  
                <asp:Label ID="lblEmp" runat="server" Text="Employee Name"></asp:Label>
            </td>

			<td class="style3" ><b>:</b></td>
            <td width="185">
                <asp:TextBox ID="TxtEmpName" runat="server" Enabled="False" Width="134px"></asp:TextBox>

            </td>
            <td></td>
            
        </tr>
        <tr>
              <td height="17"></td>  
			<td width="180" >  
                <asp:Label ID="lblEmail" runat="server" Text="Email-Id"></asp:Label>
            </td>

			<td class="style3" ><b>:</b></td>
            <td width="185">
                <asp:TextBox ID="txtEmail" runat="server" Enabled ="false" Width="135px" 
                    Height="22px"></asp:TextBox>
            </td>
            <td></td>
        </tr>
        <tr>
            <td height="17"></td>
  
			<td width="180" >  
                <asp:Label ID="lblEmpNo" runat="server" Text="Employee No"></asp:Label>
            </td>
        

			<td class="style3" ><b>:</b></td>
            <td width="185">
                <asp:TextBox ID="txtEmpNo" runat="server" Enabled ="false" Width="135px" 
                    Height="22px"></asp:TextBox>
            </td>
            <td></td>
        </tr>
        <tr>
          <td height="17"></td>
  
			<td width="180" >  
                <asp:Label ID="lblManagerEmail" runat="server" Text="ManagerEmail-Id"></asp:Label>
            </td>
           <td class="style3" ><b>:</b></td>
            <td width="185">
<asp:TextBox ID="TxtManagerEmail" runat="server" Enabled ="True" 
                    Width="135px" Height="22px"></asp:TextBox> 
                     </td>
                    <td colspan="2">
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                     ControlToValidate="TxtManagerEmail" 
                     ErrorMessage="Please Enter valid Email Id" 
                     ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            

            </td>
             <td></td>
        </tr>
        
     
			<td colspan="2"></td>
			<td colspan="3">
            
            <asp:Button ID="cmd_save" runat="server" Text="Save"  OnClientClick ="return ValidateControl();" />
      </td>
            </tr>
      <tr>
        <td colspan="5" align="center"></td>
        </tr>
  
        
    </table>

</div>
      </form>
    
</body>
</html>
