<%@ Page Language="VB" AutoEventWireup="false" CodeFile="start.aspx.vb" Inherits="start" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="bootstrap_slider/themes/2/js-image-slider.css" rel="stylesheet" />
    <script src="bootstrap_slider/themes/2/js-image-slider.js"></script>
    <link href="bootstrap_slider/generic.css" rel="stylesheet" />
</head>
<body style="background-image: url(images/back_3.jpg)">
    <form id="form1" runat="server">
    <div>
        <div style="position:absolute;left:850px;top:20px;width:500px;height:auto;">
        <table cellspacing="0" cellpadding="5">
        <tr>
            
            <td>
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Calibri" Font-Size="20px" ForeColor="White" NavigateUrl="~/regfrm.aspx" Font-Bold="False">Seller Registration</asp:HyperLink></td>
            <td>
                <asp:HyperLink ID="HyperLink3" runat="server" Font-Names="Calibri" Font-Size="20px" ForeColor="White" Font-Bold="False" NavigateUrl="~/cust_registration.aspx">Customer Registration</asp:HyperLink></td>
            <td>
                <asp:HyperLink ID="HyperLink2" runat="server" Font-Names="Calibri" Font-Size="20px" ForeColor="White" NavigateUrl="~/login.aspx" Font-Bold="False">Login</asp:HyperLink></td>
            
        </tr>
    </table>
            </div>
    <table>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="The Natural's&lt;br/&gt;We provide the precious and rare herbs" Font-Bold="True" Font-Names="Lucida Calligraphy" Font-Size="XX-Large" ForeColor="White" BorderStyle="None" BorderWidth="1px"></asp:Label></td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    </div>
        <div id="sliderFrame">
        <div id="slider">
            <a href="#" target="_blank">
                <img src="images/i1.jpg" alt="Online Attendance" />
            </a>
            <a class="lazyImage" href="images/i2.jpg" title="Government Polytechnic, Amravati">Government Polytechnic, Amravati</a>
            <a href="#"><b data-src="images/i3.jpg">Image Slider</b></a>
            <a class="lazyImage" href="images/i4.jpg" title="">Slide 4</a>
        </div>

        <!--thumbnails-->
        <div id="thumbs">
            <div class="thumb">
                <div class="frame"><img src="images/thumb1.jpg" /></div>
                <div class="thumb-content"><p>Lord Dhanvantariji</p>Dhanvantari is the Hindu god of medicine</div>
                <div style="clear:both;"></div>
            </div>
            <div class="thumb">
                <div class="frame"><img src="images/thumb2.jpg" /></div>
                <div class="thumb-content"><p>Natural Medicines</p>Use herbal medicines to heal yourself</div>
                <div style="clear:both;"></div>
            </div>
            <div class="thumb">
                <div class="frame"><img src="images/thumb3.jpg" /></div>
                <div class="thumb-content"><p>Ayurveda</p>The Science of Life.</div>
                <div style="clear:both;"></div>
            </div>
            <div class="thumb">
                <div class="frame"><img src="images/thumb4.jpg" /></div>
                <div class="thumb-content"><p>Yoga</p> Physical, mental, and spiritual disciplines originated in ancient India. </div>
                <div style="clear:both;"></div>
            </div>
        </div>
        <!--clear above float:left elements. It is required if above #slider is styled as float:left. -->
        <div style="clear:both;height:0;"></div>
    </div>
    </form>
</body>
</html>
