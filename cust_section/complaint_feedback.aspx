<%@ Page Title="" Language="VB" MasterPageFile="~/cust_section/cust_master.master" AutoEventWireup="false" CodeFile="complaint_feedback.aspx.vb" Inherits="cust_section_complaint_feedback" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <center>
    <table style="text-align:left;">
        <tr>
            <td><asp:Label ID="Label4" runat="server" Text="Complaint/Feedback" Font-Bold="True" Font-Names="Calibri" Font-Size="X-Large" ForeColor="#990033"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Subject:" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="TxtSubject" runat="server" Font-Names="Calibri" Font-Size="Large" Width="700px"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Subject is required" ControlToValidate="TxtSubject" Display="Dynamic" Font-Names="Calibri" ForeColor="#CC0000" SetFocusOnError="True" Font-Size="Large"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Complaint/Feedback:" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="TxtComplaint" runat="server" Font-Names="Calibri" Font-Size="Large" Rows="10" TextMode="MultiLine" Width="700px"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Complaint / Feedback is required" ControlToValidate="TxtComplaint" Display="Dynamic" Font-Names="Calibri" ForeColor="#CC0000" SetFocusOnError="True" Font-Size="Large"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td><asp:Label ID="Label3" runat="server" Text="Sender Password: " Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
        </tr>
        <tr>
            <td><asp:TextBox ID="TxtSenderPassword" runat="server" Font-Names="Calibri" Font-Size="Large" TextMode="Password" Width="700px"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Sender password is required" ControlToValidate="TxtSenderPassword" Display="Dynamic" Font-Names="Calibri" ForeColor="#CC0000" SetFocusOnError="True" Font-Size="Large"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="BtnSubmit" runat="server" Text="Submit" Font-Names="Calibri" Font-Size="Large" /></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LblMsg" runat="server" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
        </tr>
    </table>
    </center>
</asp:Content>

