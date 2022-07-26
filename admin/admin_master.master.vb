
Partial Class admin_admin_master
    Inherits System.Web.UI.MasterPage
    Protected Sub BtnLogout_Click(sender As Object, e As EventArgs) Handles BtnLogout.Click
        Session.Clear()
        Session.Abandon()
        FormsAuthentication.SignOut()
        Response.Redirect("~/start.aspx")
    End Sub
    Protected Sub BtnRegisteredCustomers_Click(sender As Object, e As EventArgs) Handles BtnRegisteredCustomers.Click
        Response.Redirect("~/admin/reg_cust.aspx")
    End Sub
    Protected Sub BtnOrders_Click(sender As Object, e As EventArgs) Handles BtnOrders.Click
        Response.Redirect("~/admin/all_orders.aspx")
    End Sub
    Protected Sub BtnRegisteredSellers_Click(sender As Object, e As EventArgs) Handles BtnRegisteredSellers.Click
        Response.Redirect("~/admin/reg_sellers.aspx")
    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1))
            Response.Cache.SetCacheability(HttpCacheability.NoCache)
            Response.Cache.SetNoStore()
            If Session("username") IsNot vbNullString Then
            Else
                Response.Redirect("~/pagenotfound.aspx")
            End If
        End If
    End Sub
End Class

