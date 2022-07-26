<%@ Page Language="VB" AutoEventWireup="false" CodeFile="success.aspx.vb" Inherits="success" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    
        <div>
            <table style="text-align: center; width: 100%">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Registered successfuly.." Font-Names="Calibri" Font-Size="X-Large" ForeColor="#660033"></asp:Label></td>
                </tr>

                <tr>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Calibri" Font-Size="Medium" NavigateUrl="~/start.aspx" ImageUrl="~/images/greenHomeLogo.png" ImageWidth="80px">HOME</asp:HyperLink></td>
                </tr>
            </table>
        </div>
    
    </form>
</body>
</html>
