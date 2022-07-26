
Imports MySql.Data.MySqlClient
Imports System.Configuration
Imports System.Data
Partial Class cust_section_my_orders
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
            Try
                If Session("username") IsNot vbNullString Then
                    Dim cust_user_name As String = Session("username")
                    Dim sql As String
                    sql = "select order_no, order_date, total_bill, payment_mode, order_status from orders where cust_user_name=@cust_user_name"
                    GetConnection()
                    cmd = New MySqlCommand(sql, con)
                    cmd.Parameters.AddWithValue("@cust_user_name", cust_user_name)
                    Dim reader As MySqlDataReader = cmd.ExecuteReader
                    While reader.Read()
                        Dim order_no As Integer = reader.GetInt32("order_no")
                        Dim order_date As String = reader.GetDateTime("order_date").ToString("dd/MM/yyyy")
                        Dim total_bill As Double = reader.GetDouble("total_bill")
                        Dim payment_mode As String = reader.GetString("payment_mode")
                        Dim order_status As String = reader.GetString("order_status")
                        Dim tr As TableRow, tc As TableCell

                        tr = New TableRow
                        tc = New TableCell
                        tc.Text = "Order Number"
                        tc.Font.Bold = True
                        tc.BackColor = Drawing.Color.Crimson
                        tc.ForeColor = Drawing.Color.White
                        tr.Cells.Add(tc)

                        tc = New TableCell
                        tc.Text = order_no
                        'tc.ColumnSpan = 2
                        tr.Cells.Add(tc)

                        Table1.Rows.Add(tr)

                        tr = New TableRow
                        tc = New TableCell
                        tc.Text = "Order Date"
                        tc.Font.Bold = True
                        tc.BackColor = Drawing.Color.Crimson
                        tc.ForeColor = Drawing.Color.White
                        tr.Cells.Add(tc)

                        tc = New TableCell
                        tc.Text = order_date
                        'tc.ColumnSpan = 2
                        tr.Cells.Add(tc)
                        Table1.Rows.Add(tr)

                        tr = New TableRow
                        tc = New TableCell
                        tc.Text = "Total Bill (&#8377;)"
                        tc.Font.Bold = True
                        tc.BackColor = Drawing.Color.Crimson
                        tc.ForeColor = Drawing.Color.White
                        tr.Cells.Add(tc)

                        tc = New TableCell
                        tc.Text = "&#8377" & " " & total_bill
                        'tc.ColumnSpan = 2
                        tr.Cells.Add(tc)
                        Table1.Rows.Add(tr)

                        tr = New TableRow
                        tc = New TableCell
                        tc.Text = "Payment Mode"
                        tc.Font.Bold = True
                        tc.BackColor = Drawing.Color.Crimson
                        tc.ForeColor = Drawing.Color.White
                        tr.Cells.Add(tc)

                        tc = New TableCell
                        tc.Text = payment_mode
                        'tc.ColumnSpan = 2
                        tr.Cells.Add(tc)
                        Table1.Rows.Add(tr)

                        tr = New TableRow
                        tc = New TableCell
                        tc.Text = "Order Status"
                        tc.Font.Bold = True
                        tc.BackColor = Drawing.Color.Crimson
                        tc.ForeColor = Drawing.Color.White
                        tr.Cells.Add(tc)

                        tc = New TableCell
                        tc.Text = order_status
                        'tc.ColumnSpan = 2
                        tr.Cells.Add(tc)
                        Table1.Rows.Add(tr)


                        tr = New TableRow
                        tc = New TableCell
                        tc.Text = "Item Name"
                        tc.Font.Bold = True
                        tr.Cells.Add(tc)

                        tc = New TableCell
                        tc.Text = "Rate (&#8377;) and Quantity"
                        tc.Font.Bold = True
                        tr.Cells.Add(tc)
                        tr.BackColor = Drawing.Color.Crimson
                        tr.ForeColor = Drawing.Color.White
                        Table1.Rows.Add(tr)

                        Dim query As String = "select herb_name, herb_rate, unit from order_details where order_no = @order_no"
                        Dim con_str As String = ConfigurationManager.ConnectionStrings("MyConnectionString").ConnectionString
                        Dim conn As New MySqlConnection(con_str)
                        conn.Open()
                        Dim command As New MySqlCommand(query, conn)
                        command.Parameters.AddWithValue("@Order_no", order_no)
                        Dim rd As MySqlDataReader = command.ExecuteReader
                        Dim herb_name As String
                        Dim herb_rate As Double
                        Dim unit As String

                        While rd.Read
                            herb_name = rd.GetString("herb_name")
                            herb_rate = rd.GetDouble("herb_rate")
                            unit = rd.GetString("unit")

                            tr = New TableRow
                            tc = New TableCell
                            tc.Text = herb_name
                            tr.Cells.Add(tc)

                            tc = New TableCell
                            tc.Text = "&#8377" & " " & herb_rate & " " & unit
                            tr.Cells.Add(tc)
                            Table1.Rows.Add(tr)
                        End While

                        tr = New TableRow
                        tc = New TableCell
                        tc.ColumnSpan = 2
                        tc.Text = "<hr/>"
                        tr.Cells.Add(tc)
                        Table1.Rows.Add(tr)

                        rd.Close()
                        command.Dispose()
                        conn.Close()
                    End While
                    reader.Close()
                    cmd.Dispose()
                    CloseConnection()
                Else
                    LblMsg.ForeColor = Drawing.Color.Red
                    LblMsg.Text = "Session error"
                End If
            Catch ex As Exception
                LblMsg.ForeColor = Drawing.Color.Red
                LblMsg.Text = ex.Message
            End Try
        End If
    End Sub
End Class
