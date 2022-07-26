<%@ Page Title="" Language="VB" MasterPageFile="~/cust_section/cust_master.master" AutoEventWireup="false" CodeFile="my_orders.aspx.vb" Inherits="cust_section_my_orders" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <center>
    <table style="text-align:left;">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="My Orders" Font-Names="Calibri" Font-Size="X-Large" ForeColor="#660033"></asp:Label>
            </td>
        </tr>
         <tr>
            <td>
                <asp:Table ID="Table1" runat="server" Font-Names="Calibri" CellPadding="10" CellSpacing="0" GridLines="Horizontal" Width="500px"></asp:Table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LblMsg" runat="server" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
        </tr>
    </table>
        </center>
</asp:Content>

