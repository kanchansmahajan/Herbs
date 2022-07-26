Imports MySql.Data.MySqlClient
Imports System.Configuration
Imports System.Data

Partial Class admin_reg_sellers
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
            Dim sql As String
            sql = "select * from regusers"
            GetConnection()
            cmd = New MySqlCommand(sql, con)
            Dim da As New MySqlDataAdapter(sql, con)
            Dim ds As New DataSet
            da.Fill(ds)
            GridView1.DataSource = ds
            GridView1.DataBind()
        End If
    End Sub
    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.Header Then
            Dim col_names() As String = {"Firm Name", "Owner Name", "Mobile No.", "Email-id", "Firm Address", "Username", "Password"}
            For i As Integer = 0 To col_names.Length - 1
                e.Row.Cells(i).Text = col_names(i)
            Next
        End If
    End Sub
End Class
