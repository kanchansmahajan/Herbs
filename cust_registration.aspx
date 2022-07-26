<%@ Page Language="VB" AutoEventWireup="false" CodeFile="cust_registration.aspx.vb" Inherits="cust_registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 32px;
        }
    </style>
</head>
<body style="background-image: url(images/b1.jpg)">
    <form id="form1" runat="server">
    <div>
        <center>
            <br />

    <table>
        <tr>
            <td><asp:Label ID="Label9" runat="server" Text="Customer Registration" Font-Bold="True" Font-Names="Lucida Calligraphy" Font-Size="XX-Large" ForeColor="White"></asp:Label></td>
        </tr>
    </table>
            <br /><br />
    <table style="text-align:left">
        
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Full Name" Font-Names="Calibri" Font-Size="Large" ForeColor="White"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtCustName" runat="server" Font-Names="Calibri" Font-Size="Large" Width="300px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Customer name is required" ControlToValidate="TxtCustName" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" SetFocusOnError="True" ForeColor="White"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid customer name" ControlToValidate="TxtCustName" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" SetFocusOnError="True" ValidationExpression="^[a-zA-Z.\s]+$" ForeColor="White"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Mobile Number" Font-Names="Calibri" Font-Size="Large" ForeColor="White"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtCustMobileNo" runat="server" Font-Names="Calibri" Font-Size="Large" Width="300px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Mobile number is required" ControlToValidate="TxtCustMobileNo" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" SetFocusOnError="True" ForeColor="White"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid mobile number" ControlToValidate="TxtCustMobileNo" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" SetFocusOnError="True" ValidationExpression="\d{10}" ForeColor="White"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Email-Id" Font-Names="Calibri" Font-Size="Large" ForeColor="White"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtCustEmailId" runat="server" Font-Names="Calibri" Font-Size="Large" Width="300px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Email-id is required" ControlToValidate="TxtCustEmailId" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="White" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid email-id" ControlToValidate="TxtCustEmailId" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="#CC0000" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Address:" Font-Names="Calibri" Font-Size="Large" ForeColor="White"></asp:Label></td>
            <td>
                <asp:TextBox ID="TXtCustAddress" runat="server" Font-Names="Calibri" Font-Size="Large" Rows="5" TextMode="MultiLine" Width="300px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Address is required" ControlToValidate="TXtCustAddress" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" SetFocusOnError="True" ForeColor="White"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label6" runat="server" Text="Username" Font-Names="Calibri" Font-Size="Large" ForeColor="White"></asp:Label></td>
            <td class="auto-style1">
                <asp:TextBox ID="TxtCustUsername" runat="server" Font-Names="Calibri" Font-Size="Large" Width="300px"></asp:TextBox></td>
            <td class="auto-style1">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Username is required" ControlToValidate="TxtCustUsername" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" SetFocusOnError="True" ForeColor="White"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Password" Font-Names="Calibri" Font-Size="Large" ForeColor="White"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtCustPassword" runat="server" Font-Names="Calibri" Font-Size="Large" TextMode="Password" Width="300px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Password is required" ControlToValidate="TxtCustPassword" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" SetFocusOnError="True" ForeColor="White"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="Confirm Password" Font-Names="Calibri" Font-Size="Large" ForeColor="White"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtCustConfirmPasssword" runat="server" Font-Names="Calibri" Font-Size="Large" TextMode="Password" Width="300px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Confirm password is required" ControlToValidate="TxtCustConfirmPasssword" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" SetFocusOnError="True" ForeColor="White"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password and confirm password must be same" ControlToCompare="TxtCustPassword" ControlToValidate="TxtCustConfirmPasssword" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="White" SetFocusOnError="True"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="BtnRegister" runat="server" Text="Register" Font-Names="Calibri" Font-Size="Large" Height="35px" /></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="LblMsg" runat="server" Font-Names="Calibri" Font-Size="Large" ForeColor="White"></asp:Label>
            </td>
        </tr>
    </table>
                    
            <table>
                <tr>
                    <td><asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/images/greenHomeLogo.png" ImageWidth="80px" NavigateUrl="~/start.aspx">HyperLink</asp:HyperLink></td>
                </tr>
            </table>
        </center>
    </div>
    
    </form>
</body>
</html>
