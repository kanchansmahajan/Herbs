Imports MySql.Data.MySqlClient
Imports System.Configuration
Imports System.IO
Partial Class user_section_view_herbs
    Inherits System.Web.UI.Page

    Private con As MySqlConnection
    Private cmd As MySqlCommand

    Private Sub GetConnection()
        Dim CS As String
        CS = ConfigurationManager.ConnectionStrings("MyConnectionString").ConnectionString
        con = New MySqlConnection(CS)
        con.Open()
    End Sub

    Private Sub CloseConnection()
        con.Close()
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

        If Not Page.IsPostBack Then
            If Session("username") IsNot vbNullString Then
                Dim user_name = Session("username")
                Dim sql As String
                sql = "select * from herbs where user_name=@user_name"
                GetConnection()
                cmd = New MySqlCommand(sql, con)
                cmd.Parameters.AddWithValue("@user_name", user_name)

                Dim da As New MySqlDataAdapter(cmd)
                Dim ds As New System.Data.DataSet
                da.Fill(ds)
                GridView1.DataSource = ds
                GridView1.DataBind()
                CloseConnection()
            Else
                Response.Write("Session error")
            End If
        End If
    End Sub
End Class
