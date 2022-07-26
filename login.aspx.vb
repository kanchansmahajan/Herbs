
Imports MySql.Data.MySqlClient
Imports System.Configuration
Partial Class login
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

    Protected Sub BtnLogin_Click(sender As Object, e As EventArgs) Handles BtnLogin.Click
        If Page.IsValid Then
            Try
                Dim username As String = TxtUsername.Text
                Dim pwd As String = TxtPassword.Text

                If username = "admin" And pwd = "admin" Then
                    Session("username") = "admin"
                    Response.Redirect("~/admin/admin_home.aspx")
                    Return
                End If

                Dim sql As String
                sql = "select owner_name, upassword from regusers where user_name = @user_name"
                GetConnection()
                cmd = New MySqlCommand(sql, con)
                cmd.Parameters.AddWithValue("@user_name", username)
                Dim rd As MySqlDataReader = cmd.ExecuteReader
                If rd.Read Then
                    Dim owner_name As String = rd.GetString("owner_name")
                    Dim upass As String = rd.GetString("upassword")
                    rd.Close()
                    cmd.Dispose()
                    CloseConnection()
                    If pwd = upass Then
                        Session("username") = username
                        Session("fullname") = owner_name
                        Response.Redirect("~/user_section/user_home.aspx")
                    Else
                        LblMsg.ForeColor = Drawing.Color.Red
                        LblMsg.Text = "Invalid username or password"
                    End If
                Else
                    rd.Close()
                    cmd.Dispose()
                    CloseConnection()
                    LblMsg.ForeColor = Drawing.Color.Red
                    LblMsg.Text = "Invalid user. Not registered"
                End If
            Catch ex As Exception
                LblMsg.ForeColor = Drawing.Color.Red
                LblMsg.Text = ex.Message
            End Try
        Else
            LblMsg.ForeColor = Drawing.Color.Red
            LblMsg.Text = "Validation failed.."
        End If
    End Sub
    Protected Sub BtnCistLogin_Click(sender As Object, e As EventArgs) Handles BtnCistLogin.Click
        If Page.IsValid Then
            Try
                Dim cust_username As String = TxtCustUsername.Text
                Dim cust_pwd As String = TxtCustPassword.Text
                Dim sql As String
                sql = "select cust_name, cust_mobile_no, cust_email_id, cust_address, cust_upassword from reg_customers where cust_user_name = @cust_user_name"
                GetConnection()
                cmd = New MySqlCommand(sql, con)
                cmd.Parameters.AddWithValue("@cust_user_name", cust_username)
                Dim rd As MySqlDataReader = cmd.ExecuteReader
                If rd.Read Then
                    Dim cust_full_name As String = rd.GetString("cust_name")
                    Dim cust_mobile_no As String = rd.GetString("cust_mobile_no")
                    Dim cust_email_id As String = rd.GetString("cust_email_id")
                    Dim cust_address As String = rd.GetString("cust_address")
                    Dim upass As String = rd.GetString("cust_upassword")
                    rd.Close()
                    cmd.Dispose()
                    CloseConnection()
                    If cust_pwd = upass Then
                        Session("cust_full_name") = cust_full_name
                        Session("cust_mobile_no") = cust_mobile_no
                        Session("cust_email_id") = cust_email_id
                        Session("cust_address") = cust_address
                        Session("username") = cust_username
                        Session("fullname") = cust_full_name
                        Response.Redirect("~/cust_section/cust_home.aspx")
                    Else
                        LblMsg.ForeColor = Drawing.Color.Red
                        LblMsg.Text = "Invalid username or password"
                    End If
                Else
                    rd.Close()
                    cmd.Dispose()
                    CloseConnection()
                    LblMsg.ForeColor = Drawing.Color.Red
                    LblMsg.Text = "Invalid user. Not registered"
                End If
            Catch ex As Exception
                LblMsg.ForeColor = Drawing.Color.Red
                LblMsg.Text = ex.Message
            End Try
        Else
            LblMsg.ForeColor = Drawing.Color.Red
            LblMsg.Text = "Validation failed.."
        End If
    End Sub
End Class
