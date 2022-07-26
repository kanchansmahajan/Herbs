Imports MySql.Data.MySqlClient
Imports System.Configuration

Partial Class cust_registration
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

    Protected Sub BtnRegister_Click(sender As Object, e As EventArgs) Handles BtnRegister.Click
        If Page.IsValid Then
            Try

                Dim cust_name As String = TxtCustName.Text.Trim().ToUpper()
                Dim cust_mobile_no As String = TxtCustMobileNo.Text.Trim()
                Dim cust_email_id As String = TxtCustEmailId.Text.Trim().ToLower()
                Dim cust_address As String = TXtCustAddress.Text.Trim().ToUpper()
                Dim cust_user_name As String = TxtCustUsername.Text.Trim().ToLower()
                Dim cust_upassword As String = TxtCustPassword.Text

                Dim sql As String = "insert into reg_customers values(@cust_name, @cust_mobile_no, @cust_email_id, @cust_address, @cust_user_name, @cust_upassword)"
                GetConnection()
                cmd = New MySqlCommand(sql, con)
                cmd.Parameters.AddWithValue("@cust_name", cust_name)
                cmd.Parameters.AddWithValue("@cust_mobile_no", cust_mobile_no)
                cmd.Parameters.AddWithValue("@cust_email_id", cust_email_id)
                cmd.Parameters.AddWithValue("@cust_address", cust_address)
                cmd.Parameters.AddWithValue("@cust_user_name", cust_user_name)
                cmd.Parameters.AddWithValue("@cust_upassword", cust_upassword)
                Dim n As Integer = cmd.ExecuteNonQuery()
                cmd.Dispose()
                CloseConnection()
                If n = 1 Then
                    Response.Redirect("~/success.aspx")
                Else
                    Response.Redirect("~/failed.aspx")
                End If
            Catch ex As Exception
                LblMsg.Text = ex.Message
            End Try
        Else
            LblMsg.Text = "Validation errors"
        End If
    End Sub
End Class
