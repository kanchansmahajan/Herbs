Imports MySql.Data.MySqlClient
Imports System.Configuration
Imports System.IO
Partial Class user_section_add_herbs
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

    Protected Sub BtnSave_Click(sender As Object, e As EventArgs) Handles BtnSave.Click
        If Page.IsValid Then
            Try
                Dim herb_image As String

                If FuHerbImage.HasFile Then
                    Dim fileExtension As String = Path.GetExtension(FuHerbImage.FileName).ToLower
                    If fileExtension = ".jpg" Or fileExtension = ".png" Or fileExtension = ".gif" Or fileExtension = ".jpeg" Then
                        Dim filesize As Long
                        filesize = FuHerbImage.PostedFile.ContentLength
                        If filesize > 5242880 Then
                            LblMsg.ForeColor = Drawing.Color.Red
                            LblMsg.Text = "Maximum file size (5 MB) exceeded.."
                            Return
                        Else
                            Dim herb_name As String = TxtHerbName.Text.Trim().ToUpper
                            herb_image = DateTime.Now.ToString("dd_MM_yyyy_hh_mm_ss_tt") & "_" & FuHerbImage.FileName.Replace(" ", "_").ToLower().Trim()
                            Dim rate As Double = Double.Parse(TxtRate.Text)
                            Dim unit As String = DdlRateUnit.SelectedItem.Text
                            Dim diseases As String = TxtUDisease.Text.Trim().ToUpper
                            Dim benefits As String = TxtBenefits.Text.Trim().ToUpper
                            Dim username As String = Session("username")

                            Dim sql As String = "insert into herbs (herb_name, herb_image, herb_rate, unit, diseases, benefits, user_name) values(@herb_name, @herb_image, @herb_rate, @unit, @diseases, @benefits, @user_name)"
                            GetConnection()
                            cmd = New MySqlCommand(sql, con)
                            cmd.Parameters.AddWithValue("@herb_name", herb_name)
                            cmd.Parameters.AddWithValue("@herb_image", herb_image)
                            cmd.Parameters.AddWithValue("@herb_rate", rate)
                            cmd.Parameters.AddWithValue("@unit", unit)
                            cmd.Parameters.AddWithValue("@diseases", diseases)
                            cmd.Parameters.AddWithValue("@benefits", benefits)
                            cmd.Parameters.AddWithValue("@user_name", username)
                            Dim n As Integer = cmd.ExecuteNonQuery
                            cmd.Dispose()
                            CloseConnection()

                            If n = 1 Then
                                FuHerbImage.SaveAs(Server.MapPath("~/user_section/herb_images/" & herb_image))
                                LblMsg.ForeColor = Drawing.Color.Green
                                LblMsg.Text = "Herb added"
                            Else
                                LblMsg.ForeColor = Drawing.Color.Red
                                LblMsg.Text = "Herb not added"
                            End If

                        End If
                    Else
                        LblMsg.ForeColor = Drawing.Color.Red
                        LblMsg.Text = "Only .jpg, .png, .gif or .jpeg images are allowed."
                    End If
                Else
                    LblMsg.ForeColor = Drawing.Color.Red
                    LblMsg.Text = "Herb image is required"
                End If

            Catch ex As Exception
                LblMsg.ForeColor = Drawing.Color.Red
                LblMsg.Text = ex.Message
            End Try
        Else
            LblMsg.ForeColor = Drawing.Color.Red
            LblMsg.Text = "Validation errors.."
        End If
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
End Class
