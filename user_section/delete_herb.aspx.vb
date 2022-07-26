Imports MySql.Data.MySqlClient
Imports System.Configuration

Partial Class user_section_delete_herb
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

        Try
            If Request("srno") IsNot vbNullString Then
                Dim srno As Integer = Integer.Parse(Request("srno"))
                Dim sql As String
                sql = "delete from herbs where srno=@srno"
                GetConnection()
                cmd = New MySqlCommand(sql, con)
                cmd.Parameters.AddWithValue("@srno", srno)
                Dim n As Integer = cmd.ExecuteNonQuery
                cmd.Dispose()
                CloseConnection()
                If n = 1 Then
                    Response.Redirect("~/user_section/view_herbs.aspx")
                Else
                    LblMsg.ForeColor = System.Drawing.Color.Red
                    LblMsg.Text = "Record not deleted.."
                End If
            End If
        Catch ex As Exception
            LblMsg.ForeColor = Drawing.Color.Red
            LblMsg.Text = ex.Message
        End Try
    End Sub
End Class
