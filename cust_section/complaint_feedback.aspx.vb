Imports MySql.Data.MySqlClient
Imports System.Configuration
Imports System.Data
Imports System.Net.Mail
Imports System.Net
Imports System.IO

Partial Class cust_section_complaint_feedback
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
    End Sub



    Protected Sub BtnSubmit_Click(sender As Object, e As EventArgs) Handles BtnSubmit.Click
        If Page.IsValid Then
            Try

                Dim receiver_email_id As String = "samikshamahore01@gmail.com"
                Dim sender_email_id = Session("cust_email_id")
                Dim sender_password As String = TxtSenderPassword.Text
                Dim subject As String = TxtSubject.Text
                Dim email_body As String = TxtComplaint.Text

                Dim smtp As New SmtpClient("smtp.gmail.com", 587)
                Dim mm As New MailMessage(sender_email_id, receiver_email_id, subject, email_body)
                mm.IsBodyHtml = False

                smtp.EnableSsl = True
                smtp.UseDefaultCredentials = True

                Dim netCred As New NetworkCredential(sender_email_id, sender_password)
                smtp.Credentials = netCred

                smtp.Send(mm)
                LblMsg.ForeColor = Drawing.Color.Green
                LblMsg.Text = "Complaint/Feedback send successfully."
            Catch ex As Exception
                LblMsg.ForeColor = Drawing.Color.Red
                LblMsg.Text = ex.Message
            End Try
        Else
            LblMsg.ForeColor = Drawing.Color.Red
            LblMsg.Text = "Validation failed."
        End If
    End Sub
End Class
