
Imports MySql.Data.MySqlClient
Imports System.Configuration
Partial Class regfrm
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
                Dim firm_name As String = TxtFirmName.Text.Trim().ToUpper()
                Dim owner_name As String = TxtOwnerName.Text.Trim().ToUpper()
                Dim mobile_no As String = TxtMobileNo.Text.Trim()
                Dim email_id As String = TxtEmailId.Text.Trim().ToLower()
                Dim firm_address As String = TxtFirmAddress.Text.Trim().ToUpper()
                Dim user_name As String = TxtUserName.Text.Trim().ToLower()
                Dim upassword As String = TxtPassword.Text

                Dim sql As String = "insert into regusers values(@firm_name, @owner_name, @mobile_no, @email_id, @firm_address, @user_name, @upassword)"
                GetConnection()
                cmd = New MySqlCommand(sql, con)
                cmd.Parameters.AddWithValue("@firm_name", firm_name)
                cmd.Parameters.AddWithValue("@owner_name", owner_name)
                cmd.Parameters.AddWithValue("@mobile_no", mobile_no)
                cmd.Parameters.AddWithValue("@email_id", email_id)
                cmd.Parameters.AddWithValue("@firm_address", firm_address)
                cmd.Parameters.AddWithValue("@user_name", user_name)
                cmd.Parameters.AddWithValue("@upassword", upassword)
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
