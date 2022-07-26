
Partial Class user_section_user_master
    Inherits System.Web.UI.MasterPage


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1))
            Response.Cache.SetCacheability(HttpCacheability.NoCache)
            Response.Cache.SetNoStore()
            If Session("username") IsNot vbNullString Then
                Dim username As String = "Welcome " & Session("fullname")
                LblUserFullName.Text = username
            Else
                Response.Redirect("~/pagenotfound.aspx")
            End If
        End If
    End Sub

    Protected Sub LBtnAddHerbs_Click(sender As Object, e As EventArgs) Handles LBtnAddHerbs.Click
        Response.Redirect("~/user_section/add_herbs.aspx")
    End Sub
    Protected Sub LBtnViewHerbs_Click(sender As Object, e As EventArgs) Handles LBtnViewHerbs.Click
        Response.Redirect("~/user_section/view_herbs.aspx")
    End Sub
    Protected Sub LBtnOrdersReceived_Click(sender As Object, e As EventArgs) Handles LBtnOrdersReceived.Click
        Response.Redirect("~/user_section/orders.aspx")
    End Sub
    Protected Sub LBtnLogout_Click(sender As Object, e As EventArgs) Handles LBtnLogout.Click
        Session.Clear()
        Session.Abandon()
        FormsAuthentication.SignOut()
        Response.Redirect("~/start.aspx")
    End Sub
End Class

