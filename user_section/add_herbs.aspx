<%@ Page Title="" Language="VB" MasterPageFile="~/user_section/user_master.master" AutoEventWireup="false" CodeFile="add_herbs.aspx.vb" Inherits="user_section_add_herbs" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <center>
    <table style="text-align:left;">
        <tr>
            <td colspan="3">
                <asp:Label ID="Label1" runat="server" Text="Add Herb" Font-Bold="True" Font-Names="Calibri" Font-Size="X-Large" ForeColor="#660033"></asp:Label></td>            
        </tr>
        <tr>
            <td>
                <asp:label runat="server" text="Herb Name" Font-Names="Calibri" Font-Size="Large"></asp:label>
            </td>
            <td>
                <asp:TextBox ID="TxtHerbName" runat="server" Font-Names="Calibri" Font-Size="Large" Width="300px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Herb name is required" ControlToValidate="TxtHerbName" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:label runat="server" text="Herb Image" Font-Names="Calibri" Font-Size="Large"></asp:label>
            </td>
            <td>
                <asp:FileUpload ID="FuHerbImage" runat="server" Font-Names="Calibri" Font-Size="Large" Width="300px" /></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Herb image is required" ControlToValidate="FuHerbImage" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
        </tr>

        <tr>
            <td>
                <asp:label runat="server" text="Rate (&amp;#8377;)" Font-Names="Calibri" Font-Size="Large"></asp:label>
            </td>
            <td>
                <asp:TextBox ID="TxtRate" runat="server" Font-Names="Calibri" Font-Size="Large" Width="150px"></asp:TextBox><asp:DropDownList ID="DdlRateUnit" runat="server" Font-Names="Calibri" Font-Size="Large">
                    <asp:ListItem Value="-1">Select unit</asp:ListItem>
                    <asp:ListItem>For 10 Grams</asp:ListItem>
                    <asp:ListItem>For 100 Grams</asp:ListItem>
                    <asp:ListItem>For 1000 Grams</asp:ListItem>
                </asp:DropDownList></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Herb rate is required" ControlToValidate="TxtRate" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Rate unit is required" ControlToValidate="DdlRateUnit" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="Red" InitialValue="-1" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
        </tr>

        <tr>
            <td>
                <asp:label runat="server" text="Useful for diseases" Font-Names="Calibri" Font-Size="Large"></asp:label>
            </td>
            <td>
                <asp:TextBox ID="TxtUDisease" runat="server" Font-Names="Calibri" Font-Size="Large" Rows="5" TextMode="MultiLine" Width="300px" Wrap="False"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Diseases are required" ControlToValidate="TxtUDisease" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
        </tr>

        <tr>
            <td>
                <asp:label runat="server" text="Benefits" Font-Names="Calibri" Font-Size="Large"></asp:label>
            </td>
            <td>
                <asp:TextBox ID="TxtBenefits" runat="server" Font-Names="Calibri" Font-Size="Large" Rows="5" TextMode="MultiLine" Width="300px" Wrap="False"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Benefits required" ControlToValidate="TxtBenefits" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:button runat="server" text="Save" ID="BtnSave" Font-Names="Calibri" Font-Size="Large" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:label runat="server" ID="LblMsg" Font-Names="Calibri" Font-Size="Large"></asp:label>
            </td>            
        </tr>
    </table>
    </center>
</asp:Content>

