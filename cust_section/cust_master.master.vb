
Partial Class cust_section_cust_master
    Inherits System.Web.UI.MasterPage

    Protected Sub BtnLogout_Click(sender As Object, e As EventArgs) Handles BtnLogout.Click
        Session.Clear()
        Session.Abandon()
        FormsAuthentication.SignOut()
        Response.Redirect("~/start.aspx")
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1))
            Response.Cache.SetCacheability(HttpCacheability.NoCache)
            Response.Cache.SetNoStore()
            If Session("username") IsNot vbNullString Then
                Dim username As String = Session("username")
                Dim cust_name As String = Session("fullname")
                LblCustName.Text = "Welcome " & cust_name
            Else
                Response.Redirect("~/pagenotfound.aspx")
            End If
        End If
    End Sub

    Protected Sub BtnSearchHerbs_Click(sender As Object, e As EventArgs) Handles BtnSearchHerbs.Click
        Response.Redirect("~/cust_section/search.aspx")
    End Sub
    Protected Sub BtnMyOrders_Click(sender As Object, e As EventArgs) Handles BtnMyOrders.Click
        Response.Redirect("~/cust_section/my_orders.aspx")
    End Sub
    Protected Sub BtnComplaintFeedback_Click(sender As Object, e As EventArgs) Handles BtnComplaintFeedback.Click
        Response.Redirect("~/cust_section/complaint_feedback.aspx")
    End Sub
End Class

