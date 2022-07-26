Imports MySql.Data.MySqlClient
Imports System.Configuration
Imports System.Data

Partial Class admin_order_details
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
            If Request("order_no") IsNot vbNullString Then
                Dim order_no As Integer = Integer.Parse(Request("order_no"))
                LblOrderNo.Text = "Order Number: " & order_no
                Dim sql As String
                sql = "select herb_name, herb_rate, unit, seller_username from order_details where order_no=@order_no"
                GetConnection()
                cmd = New MySqlCommand(sql, con)
                cmd.Parameters.AddWithValue("@order_no", order_no)
                GridView1.DataSource = cmd.ExecuteReader()
                GridView1.DataBind()
                cmd.Dispose()
                CloseConnection()
            End If
        End If
    End Sub
    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.Header Then
            Dim col_names() As String = {"Herb Name", "Herb Rate (&#8377;)", "Unit", "Seller Username"}
            For i As Integer = 0 To col_names.Length - 1
                e.Row.Cells(i).Text = col_names(i)
            Next
        End If
    End Sub
End Class
