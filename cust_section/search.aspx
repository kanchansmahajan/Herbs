<%@ Page Title="" Language="VB" MasterPageFile="~/cust_section/cust_master.master" AutoEventWireup="false" CodeFile="search.aspx.vb" Inherits="cust_section_search" %>



<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">    
    <center>
    <table>
        <tr>
            <td style="text-align:left;">
                <asp:Label ID="Label1" runat="server" Text="Search Here" Font-Names="Calibri" Font-Size="X-Large"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:RadioButton ID="RbHerb" runat="server" Font-Names="Calibri" Font-Size="Large" GroupName="SearchGroup" Text="Search by herb name" /></td>
            <td>
                <asp:RadioButton ID="RbDisease" runat="server" Font-Names="Calibri" Font-Size="Large" GroupName="SearchGroup" Text="Search by disease name" /></td>
        </tr>
         <tr>
            <td colspan="2">
                <asp:TextBox ID="TxtSearch" runat="server" Font-Names="Calibri" Font-Size="Large" Width="500px"></asp:TextBox>
            
                <asp:Button ID="BtnSearch" runat="server" Text="Search" Font-Names="Calibri" Font-Size="Large" /></td>
        </tr>
         <tr>
            <td colspan="2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Search text is required" Font-Names="Calibri" Font-Size="Large" ControlToValidate="TxtSearch" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator></td>            
        </tr>
         <tr>
            <td colspan="2">
                <asp:Label ID="LblMsg" runat="server" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>            
        </tr>
    </table>
    </center>
    <div style="text-align:left"> 
        <br />   
       <center>
    <table style="text-align:justify">
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Search Results" Font-Bold="False" Font-Names="Calibri" Font-Size="Large" Font-Underline="True" ForeColor="#FF3399"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LblResult" runat="server" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Table ID="Table1" runat="server" Font-Names="Calibri" Font-Size="Large" CellPadding="5" CellSpacing="0" Width="800px"></asp:Table>
            </td>
        </tr>
    </table>   
    </center>    
    </div>
</asp:Content>




