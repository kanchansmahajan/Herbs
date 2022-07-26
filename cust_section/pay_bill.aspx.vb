
Imports MySql.Data.MySqlClient
Imports System.Configuration
Imports System.Data
Imports System.Net.Mail
Imports System.Net
Imports System.IO

Partial Class cust_section_pay_bill
    Inherits System.Web.UI.Page

    Private con As MySqlConnection
    Private cmd As MySqlCommand
    Private payment_mode As String
    Private payment_status As String
    Private order_status As String

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
            Panel1.Visible = False
            Panel2.Visible = False
        End If
    End Sub

    Protected Sub RbCard_CheckedChanged(sender As Object, e As EventArgs) Handles RbCard.CheckedChanged
        If RbCard.Checked Then
            Panel1.Visible = True
            Panel2.Visible = False
            payment_mode = "DEBIT CARD"
            payment_status = "PAID"
            order_status = "PENDING"
        End If
    End Sub

    Protected Sub RbCashOnDelivery_CheckedChanged(sender As Object, e As EventArgs) Handles RbCashOnDelivery.CheckedChanged
        If RbCashOnDelivery.Checked Then
            Panel1.Visible = False
            Panel2.Visible = True
            payment_mode = "CASH ON DELIVERY"
            payment_status = "UNPAID"
            order_status = "PENDING"
        End If
    End Sub
    Protected Sub BtnSubmit_Click(sender As Object, e As EventArgs) Handles BtnSubmit.Click
        If Page.IsValid Then
            Try
                Dim cust_email_id As String
                Dim cust_full_name As String
                Dim order_no As Integer

                If RbCard.Checked Then
                    payment_mode = "DEBIT CARD"
                    payment_status = "PAID"
                    order_status = "PENDING"
                ElseIf RbCashOnDelivery.Checked Then
                    payment_mode = "CASH ON DELIVERY"
                    payment_status = "UNPAID"
                    order_status = "PENDING"
                End If
                Dim card_holder_name As String = TxtCardHolderName.Text.Trim().ToUpper()
                Dim card_number As String = TxtCardNumber.Text.Trim().ToUpper()
                Dim expires As String = DdlMonth.SelectedItem.Text & "/" & DdlYear.SelectedItem.Text
                Dim cvv As Integer = Integer.Parse(TxtCvv.Text)
                Dim otp_or_pin As Integer = Integer.Parse(TxtPin.Text)
                Dim sql As String
                sql = "select card_holder_name, expires, cvv, pin_number, balance from debit_cards where card_number = @card_number"
                GetConnection()
                cmd = New MySqlCommand(sql, con)
                cmd.Parameters.AddWithValue("@card_number", card_number)
                Dim reader As MySqlDataReader = cmd.ExecuteReader
                If reader.Read() Then
                    Dim cname As String = reader.GetString("card_holder_name")
                    Dim exp As String = reader.GetString("expires")
                    Dim cvv_number As Integer = reader.GetInt32("cvv")
                    Dim pin As Integer = reader.GetInt32("pin_number")
                    Dim avail_balance As Double = reader.GetDouble("balance")
                    Dim total_bill As Double = Double.Parse(Session("total_bill"))
                    reader.Close()
                    cmd.Dispose()
                    CloseConnection()
                    If total_bill < avail_balance Then
                        If card_holder_name = cname And expires = exp And cvv = cvv_number And otp_or_pin = pin Then
                            Dim remaining_balance As Double = avail_balance - total_bill

                            sql = "update debit_cards set balance = @balance where card_number = @card_number"
                            GetConnection()
                            cmd = New MySqlCommand(sql, con)
                            cmd.Parameters.AddWithValue("@balance", remaining_balance)
                            cmd.Parameters.AddWithValue("@card_number", card_number)
                            cmd.ExecuteNonQuery()
                            cmd.Dispose()
                            CloseConnection()

                            sql = "update debit_cards set balance = balance + " & total_bill & " where card_number = 9999"
                            GetConnection()
                            cmd = New MySqlCommand(sql, con)
                            cmd.ExecuteNonQuery()
                            cmd.Dispose()
                            CloseConnection()

                            Dim order_date As String = DateTime.Now.ToString("dd/MM/yyyy")
                            Dim cust_user_name As String = Session("username")
                            cust_full_name = Session("cust_full_name")
                            Dim cust_mobile_no As String = Session("cust_mobile_no")
                            cust_email_id = Session("cust_email_id")
                            Dim cust_address As String = Session("cust_address")

                            sql = "insert into orders (order_date, cust_user_name, cust_name, cust_email_id, cust_mobile_no, cust_address, total_bill, payment_mode, payment_status, order_status) values(STR_TO_DATE(@order_date,'%d/%m/%Y'), @cust_user_name, @cust_name, @cust_email_id, @cust_mobile_no, @cust_address, @total_bill, @payment_mode, @payment_status, @order_status)"
                            GetConnection()
                            cmd = New MySqlCommand(sql, con)
                            cmd.Parameters.AddWithValue("@order_date", order_date)
                            cmd.Parameters.AddWithValue("@cust_user_name", cust_user_name)
                            cmd.Parameters.AddWithValue("@cust_name", cust_full_name)
                            cmd.Parameters.AddWithValue("@cust_email_id", cust_email_id)
                            cmd.Parameters.AddWithValue("@cust_mobile_no", cust_mobile_no)
                            cmd.Parameters.AddWithValue("@cust_address", cust_address)
                            cmd.Parameters.AddWithValue("@total_bill", total_bill)
                            cmd.Parameters.AddWithValue("@payment_mode", payment_mode)
                            cmd.Parameters.AddWithValue("@payment_status", payment_status)
                            cmd.Parameters.AddWithValue("@order_status", order_status)
                            cmd.ExecuteNonQuery()
                            cmd.Dispose()
                            CloseConnection()

                            sql = "select max(order_no) from orders"
                            GetConnection()
                            cmd = New MySqlCommand(sql, con)
                            Dim rd As MySqlDataReader = cmd.ExecuteReader()
                            rd.Read()
                            order_no = rd.GetInt32(0)
                            rd.Close()
                            cmd.Dispose()
                            CloseConnection()

                            Dim dt As DataTable = DirectCast(Session("cart"), DataTable)

                            If Session("cart") IsNot vbNullString Then
                                Dim data_table As DataTable = DirectCast(Session("cart"), DataTable)
                                GridView1.DataSource = data_table
                                GridView1.DataBind()
                            End If

                            Dim total_number_of_rows As Integer = dt.Rows.Count
                            For i As Integer = 0 To total_number_of_rows - 1
                                Dim herb_name As String = dt.Rows(i)(1)
                                Dim herb_rate As Double = dt.Rows(i)(2)
                                Dim unit As String = dt.Rows(i)(3)
                                Dim seller_user_name As String = dt.Rows(i)(4)
                                sql = "insert into order_details values(@order_no, STR_TO_DATE(@order_date,'%d/%m/%Y'), @herb_name, @herb_rate, @unit, @seller_username)"
                                GetConnection()
                                cmd = New MySqlCommand(sql, con)
                                cmd.Parameters.AddWithValue("@order_no", order_no)
                                cmd.Parameters.AddWithValue("@order_date", order_date)
                                cmd.Parameters.AddWithValue("@herb_name", herb_name)
                                cmd.Parameters.AddWithValue("@herb_rate", herb_rate)
                                cmd.Parameters.AddWithValue("@unit", unit)
                                cmd.Parameters.AddWithValue("@seller_username", seller_user_name)
                                cmd.ExecuteNonQuery()
                                cmd.Dispose()
                                CloseConnection()
                            Next

                            Try
                                Dim sender_email_id As String = "samikshamahore01@gmail.com"
                                Dim sender_password As String = "Samiksha@123"
                                Dim receiver_email_id = cust_email_id
                                Dim subject As String = "Order placed confirmation"
                                Dim email_body As String = "Dear user " & cust_full_name & ", your order is placed successfully. Your order number is " & order_no & ". Your order will be delivered within 7 working days." & vbNewLine & "Regards:" & vbNewLine & "Administrator Online Herbs"
                                Dim smtp As New SmtpClient("smtp.gmail.com", 587)
                                Dim mm As New MailMessage(sender_email_id, receiver_email_id, subject, email_body)
                                mm.IsBodyHtml = False

                                smtp.EnableSsl = True
                                smtp.UseDefaultCredentials = True

                                Dim netCred As New NetworkCredential(sender_email_id, sender_password)
                                smtp.Credentials = netCred

                                smtp.Send(mm)
                            Catch ex As Exception
                                LblEmail.ForeColor = Drawing.Color.Red
                                LblEmail.Text = ex.Message
                            End Try


                            LblMsg.ForeColor = Drawing.Color.Green
                            LblMsg.Text = "Order Placed."
                        Else
                            LblMsg.ForeColor = Drawing.Color.Red
                            LblMsg.Text = "Invalid credit card details."
                        End If
                    Else
                        LblMsg.ForeColor = Drawing.Color.Red
                        LblMsg.Text = "Insufficient funds.."
                    End If
                Else
                    reader.Close()
                    cmd.Dispose()
                    CloseConnection()
                    LblMsg.ForeColor = Drawing.Color.Red
                    LblMsg.Text = "Invalid credit card number"
                End If
            Catch ex As Exception
                LblMsg.ForeColor = Drawing.Color.Red
                LblMsg.Text = ex.Message
            End Try
        Else
            LblMsg.ForeColor = Drawing.Color.Red
            LblMsg.Text = "Validation errors"
        End If
    End Sub
    Protected Sub BtnPlaceOrder_Click(sender As Object, e As EventArgs) Handles BtnPlaceOrder.Click
        Try
            If RbCard.Checked Then
                payment_mode = "DEBIT CARD"
                payment_status = "PAID"
                order_status = "PENDING"
            ElseIf RbCashOnDelivery.Checked Then
                payment_mode = "CASH ON DELIVERY"
                payment_status = "UNPAID"
                order_status = "PENDING"
            End If

            Dim order_date As String = DateTime.Now.ToString("dd/MM/yyyy")
            Dim cust_user_name As String = Session("username")
            Dim cust_full_name As String = Session("cust_full_name")
            Dim cust_mobile_no As String = Session("cust_mobile_no")
            Dim cust_email_id As String = Session("cust_email_id")
            Dim cust_address As String = Session("cust_address")
            Dim total_bill As Double = Double.Parse(Session("total_bill"))
            Dim sql As String

            sql = "insert into orders (order_date, cust_user_name, cust_name, cust_email_id, cust_mobile_no, cust_address, total_bill, payment_mode, payment_status, order_status) values(STR_TO_DATE(@order_date,'%d/%m/%Y'), @cust_user_name, @cust_name, @cust_email_id, @cust_mobile_no, @cust_address, @total_bill, @payment_mode, @payment_status, @order_status)"
            GetConnection()
            cmd = New MySqlCommand(Sql, con)
            cmd.Parameters.AddWithValue("@order_date", order_date)
            cmd.Parameters.AddWithValue("@cust_user_name", cust_user_name)
            cmd.Parameters.AddWithValue("@cust_name", cust_full_name)
            cmd.Parameters.AddWithValue("@cust_email_id", cust_email_id)
            cmd.Parameters.AddWithValue("@cust_mobile_no", cust_mobile_no)
            cmd.Parameters.AddWithValue("@cust_address", cust_address)
            cmd.Parameters.AddWithValue("@total_bill", total_bill)
            cmd.Parameters.AddWithValue("@payment_mode", payment_mode)
            cmd.Parameters.AddWithValue("@payment_status", payment_status)
            cmd.Parameters.AddWithValue("@order_status", order_status)
            cmd.ExecuteNonQuery()
            cmd.Dispose()
            CloseConnection()

            sql = "select max(order_no) from orders"
            GetConnection()
            cmd = New MySqlCommand(sql, con)
            Dim rd As MySqlDataReader = cmd.ExecuteReader()
            rd.Read()
            Dim order_no As Integer = rd.GetInt32(0)
            rd.Close()
            cmd.Dispose()
            CloseConnection()

            Dim dt As DataTable = DirectCast(Session("cart"), DataTable)

            If Session("cart") IsNot vbNullString Then
                Dim data_table As DataTable = DirectCast(Session("cart"), DataTable)
                GridView1.DataSource = data_table
                GridView1.DataBind()
            End If

            Dim total_number_of_rows As Integer = dt.Rows.Count
            For i As Integer = 0 To total_number_of_rows - 1
                Dim herb_name As String = dt.Rows(i)(1)
                Dim herb_rate As Double = dt.Rows(i)(2)
                Dim unit As String = dt.Rows(i)(3)
                Dim seller_user_name As String = dt.Rows(i)(4)
                Sql = "insert into order_details values(@order_no, STR_TO_DATE(@order_date,'%d/%m/%Y'), @herb_name, @herb_rate, @unit, @seller_username)"
                GetConnection()
                cmd = New MySqlCommand(Sql, con)
                cmd.Parameters.AddWithValue("@order_no", order_no)
                cmd.Parameters.AddWithValue("@order_date", order_date)
                cmd.Parameters.AddWithValue("@herb_name", herb_name)
                cmd.Parameters.AddWithValue("@herb_rate", herb_rate)
                cmd.Parameters.AddWithValue("@unit", unit)
                cmd.Parameters.AddWithValue("@seller_username", seller_user_name)
                cmd.ExecuteNonQuery()
                cmd.Dispose()
                CloseConnection()
            Next

            Try
                Dim sender_email_id As String = "samikshamahore01@gmail.com"
                Dim sender_password As String = "Samiksha@123"
                Dim receiver_email_id = cust_email_id
                Dim subject As String = "Order placed confirmation"
                Dim email_body As String = "Dear user " & cust_full_name & ", your order is placed successfully. Your order number is " & order_no & ". Your order will be delivered within 7 working days." & vbNewLine & "Regards:" & vbNewLine & "Administrator Online Herbs"
                Dim smtp As New SmtpClient("smtp.gmail.com", 587)
                Dim mm As New MailMessage(sender_email_id, receiver_email_id, subject, email_body)
                mm.IsBodyHtml = False

                smtp.EnableSsl = True
                smtp.UseDefaultCredentials = True

                Dim netCred As New NetworkCredential(sender_email_id, sender_password)
                smtp.Credentials = netCred

                smtp.Send(mm)
            Catch ex As Exception
                LblResult.ForeColor = Drawing.Color.Red
                LblResult.Text = ex.Message
                Response.Write(ex.Message)
            End Try

            LblResult.ForeColor = Drawing.Color.Green
            LblResult.Text = "Order Placed."
        Catch ex As Exception
            LblResult.ForeColor = Drawing.Color.Red
            LblResult.Text = ex.Message
        End Try
    End Sub
End Class
