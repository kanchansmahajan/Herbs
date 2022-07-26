
Imports MySql.Data.MySqlClient
Imports System.Configuration
Imports System.Data

Partial Class admin_all_orders
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
            Table1.Rows.Clear()
            Dim col_names() As String = {"Order No.", "Order Date", "Customer Name", "Email-Id", "Mobile No.", "Address", "Total Bill (&#8377;)", "Payment Mode", "Order Status", "Details"}
            Dim tr As TableRow
            Dim tc As TableCell

            tr = New TableRow
            For i As Integer = 0 To col_names.Length - 1
                tc = New TableCell
                tc.Text = col_names(i)
                tc.Height = 35
                tc.BackColor = Drawing.Color.Crimson
                tc.ForeColor = Drawing.Color.White
                tr.Cells.Add(tc)
            Next
            Table1.Rows.Add(tr)

            Try
                Dim sql As String
                sql = "select * from orders"
                GetConnection()
                cmd = New MySqlCommand(sql, con)
                Dim reader As MySqlDataReader = cmd.ExecuteReader
                While reader.Read
                    Dim order_no As Integer = reader.GetInt32("order_no")
                    Dim order_date As String = reader.GetDateTime("order_date").ToString("dd/MM/yyyy")
                    Dim cust_name As String = reader.GetString("cust_name")
                    Dim cust_email_id As String = reader.GetString("cust_email_id")
                    Dim cust_mobno As String = reader.GetString("cust_mobile_no")
                    Dim cust_address As String = reader.GetString("cust_address")
                    Dim total_bill As Double = reader.GetDouble("total_bill")
                    Dim payment_mode As String = reader.GetString("payment_mode")
                    Dim order_status As String = reader.GetString("order_status")

                    tr = New TableRow()

                    tc = New TableCell
                    tc.Text = order_no
                    tr.Cells.Add(tc)

                    tc = New TableCell
                    tc.Text = order_date
                    tr.Cells.Add(tc)

                    tc = New TableCell
                    tc.Text = cust_name
                    tr.Cells.Add(tc)

                    tc = New TableCell
                    tc.Text = cust_email_id
                    tr.Cells.Add(tc)

                    tc = New TableCell
                    tc.Text = cust_mobno
                    tr.Cells.Add(tc)

                    tc = New TableCell
                    tc.Text = cust_address
                    tr.Cells.Add(tc)

                    tc = New TableCell
                    tc.Text = total_bill
                    tr.Cells.Add(tc)

                    tc = New TableCell
                    tc.Text = payment_mode
                    tr.Cells.Add(tc)

                    tc = New TableCell
                    tc.Text = order_status
                    tr.Cells.Add(tc)

                    tc = New TableCell
                    tc.Text = "<a href=order_details.aspx?order_no=" & order_no & ">Details</a>"
                    tr.Cells.Add(tc)

                    Table1.Rows.Add(tr)
                End While
                reader.Close()
                cmd.Dispose()
                CloseConnection()
            Catch ex As Exception
                LblMsg.ForeColor = Drawing.Color.Red
                LblMsg.Text = ex.Message
            End Try
        End If
    End Sub
End Class
