<%@ Page Title="" Language="VB" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="false" CodeFile="all_orders.aspx.vb" Inherits="admin_all_orders" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <center>
    <table style="text-align:left;">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="All Orders" Font-Bold="True" Font-Names="Calibri" Font-Size="X-Large" ForeColor="#990033"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Table ID="Table1" runat="server" CellPadding="5" CellSpacing="0" Font-Names="Calibri" Font-Size="Large" GridLines="Horizontal"></asp:Table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LblMsg" runat="server" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
        </tr>
    </table>
        </center>
</asp:Content>

