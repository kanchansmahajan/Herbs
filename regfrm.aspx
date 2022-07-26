<%@ Page Language="VB" AutoEventWireup="false" CodeFile="regfrm.aspx.vb" Inherits="regfrm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-image: url(images/b1.jpg)">
    <form id="form1" runat="server">
    <div>
        <center>
            <br />
    <table>
        <tr>
            <td><asp:Label ID="Label9" runat="server" Text="Registration" Font-Bold="True" Font-Names="Lucida Calligraphy" Font-Size="XX-Large" ForeColor="White"></asp:Label></td>
        </tr>
    </table>
            <br />
            <br />
    <table style="text-align:left">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Firm Name" Font-Names="Calibri" Font-Size="Large" ForeColor="White"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtFirmName" runat="server" Font-Names="Calibri" Font-Size="Large" Width="300px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Firm name is required" ControlToValidate="TxtFirmName" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="White" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Owner Name" Font-Names="Calibri" Font-Size="Large" ForeColor="White"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtOwnerName" runat="server" Font-Names="Calibri" Font-Size="Large" Width="300px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Owner name is required" ControlToValidate="TxtOwnerName" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="White" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid owner name" ControlToValidate="TxtOwnerName" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="White" SetFocusOnError="True" ValidationExpression="^[a-zA-Z.\s]+$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Mobile Number" Font-Names="Calibri" Font-Size="Large" ForeColor="White"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtMobileNo" runat="server" Font-Names="Calibri" Font-Size="Large" Width="300px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Mobile number is required" ControlToValidate="TxtMobileNo" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="White" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid mobile number" ControlToValidate="TxtMobileNo" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="White" SetFocusOnError="True" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Email-Id" Font-Names="Calibri" Font-Size="Large" ForeColor="White"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtEmailId" runat="server" Font-Names="Calibri" Font-Size="Large" Width="300px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Email-id is required" ControlToValidate="TxtEmailId" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="White" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid email-id" ControlToValidate="TxtEmailId" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="White" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Firm Address" Font-Names="Calibri" Font-Size="Large" ForeColor="White"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtFirmAddress" runat="server" Font-Names="Calibri" Font-Size="Large" Rows="5" TextMode="MultiLine" Width="300px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Firm address is required" ControlToValidate="TxtFirmAddress" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="White" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Username" Font-Names="Calibri" Font-Size="Large" ForeColor="White"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtUserName" runat="server" Font-Names="Calibri" Font-Size="Large" Width="300px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Username is required" ControlToValidate="TxtUserName" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="White" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Password" Font-Names="Calibri" Font-Size="Large" ForeColor="White"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtPassword" runat="server" Font-Names="Calibri" Font-Size="Large" TextMode="Password" Width="300px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Password is required" ControlToValidate="TxtPassword" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="White" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="Confirm Password" Font-Names="Calibri" Font-Size="Large" ForeColor="White"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtConfirmPassword" runat="server" Font-Names="Calibri" Font-Size="Large" TextMode="Password" Width="300px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Confirm password is required" ControlToValidate="TxtConfirmPassword" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="White" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password and confirm password must be same" ControlToCompare="TxtPassword" ControlToValidate="TxtConfirmPassword" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="White" SetFocusOnError="True"></asp:CompareValidator>
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
                <asp:Label ID="LblMsg" runat="server" Font-Names="Calibri" Font-Size="Large" ForeColor="#990033"></asp:Label>
            </td>
        </tr>
    </table>
            <hr />
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
