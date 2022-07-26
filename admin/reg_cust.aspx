<%@ Page Title="" Language="VB" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="false" CodeFile="reg_cust.aspx.vb" Inherits="admin_reg_cust" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <center>
    <table style="text-align:left;">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Regisered Customers" Font-Bold="True" Font-Names="Calibri" Font-Size="X-Large" ForeColor="#990033"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" Font-Names="Calibri" Font-Size="Large" CellPadding="4" ForeColor="#333333" GridLines="None" Width="800px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LblMsg" runat="server" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
        </tr>
    </table>
        </center>
</asp:Content>

