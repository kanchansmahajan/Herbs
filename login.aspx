<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-image: url(images/h8.jpg)">
    <form id="form1" runat="server">
    <div>
    <br /><br /><br />
        <center>
        <table style="text-align:left">
            <tr>
                <td colspan="3">
                    <asp:Label ID="Label1" runat="server" Text="Seller and Admin Login" Font-Names="Calibri" Font-Size="X-Large" ForeColor="White" Font-Underline="True"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Username" Font-Names="Calibri" Font-Size="Large" ForeColor="White"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TxtUsername" runat="server" Font-Names="Calibri" Font-Size="Large" ValidationGroup="AdminSeller"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username is required" ControlToValidate="TxtUsername" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="White" SetFocusOnError="True" ValidationGroup="AdminSeller"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Password" Font-Names="Calibri" Font-Size="Large" ForeColor="White"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TxtPassword" runat="server" Font-Names="Calibri" Font-Size="Large" TextMode="Password" ValidationGroup="AdminSeller"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is required" ControlToValidate="TxtPassword" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="White" SetFocusOnError="True" ValidationGroup="AdminSeller"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="BtnLogin" runat="server" Text="Login" Font-Names="Calibri" Font-Size="Large" BackColor="#339933" BorderColor="#006600" BorderStyle="Solid" ForeColor="White" ValidationGroup="AdminSeller" /></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="LblMsg" runat="server" Font-Names="Calibri" Font-Size="Large" ForeColor="#990033"></asp:Label></td>
            </tr>
        </table>
        </center>

         <center>
        <table style="text-align:left">
            <tr>
                <td colspan="3">
                    <asp:Label ID="Label4" runat="server" Text="Customer Login" Font-Names="Calibri" Font-Size="X-Large" ForeColor="White" Font-Underline="True"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Username" Font-Names="Calibri" Font-Size="Large" ForeColor="White"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TxtCustUsername" runat="server" Font-Names="Calibri" Font-Size="Large" ValidationGroup="Customer"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Customer username is required" ControlToValidate="TxtCustUsername" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="White" SetFocusOnError="True" ValidationGroup="Customer"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Password" Font-Names="Calibri" Font-Size="Large" ForeColor="White"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TxtCustPassword" runat="server" Font-Names="Calibri" Font-Size="Large" TextMode="Password" ValidationGroup="Customer"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Customer Password is required" ControlToValidate="TxtCustPassword" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="White" SetFocusOnError="True" ValidationGroup="Customer"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="BtnCistLogin" runat="server" Text="Login" Font-Names="Calibri" Font-Size="Large" BackColor="#339933" BorderColor="#006600" BorderStyle="Solid" ForeColor="White" ValidationGroup="Customer" /></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="LblResult" runat="server" Font-Names="Calibri" Font-Size="Large" ForeColor="#990033"></asp:Label></td>
            </tr>
        </table>
        <br />
             <br />
                          <table>
                 <tr>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Calibri" Font-Size="Medium" NavigateUrl="~/start.aspx" ImageUrl="~/images/greenHomeLogo.png" ImageWidth="80px">HOME</asp:HyperLink></td>
                </tr>
             </table>
        </center>
    </div>
    </form>
</body>
</html>
