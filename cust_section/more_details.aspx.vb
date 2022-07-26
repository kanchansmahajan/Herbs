Imports System.Data
Imports MySql.Data.MySqlClient
Imports System.Configuration

Partial Class cust_section_more_details
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

        If Session("username") IsNot vbNullString Then
            If Not Page.IsPostBack Then

                Dim srno As Integer = Integer.Parse(Request("srno"))
                Dim sql As String = "select * from herbs where srno = @srno"
                GetConnection()
                cmd = New MySqlCommand(sql, con)
                cmd.Parameters.AddWithValue("@srno", srno)
                Dim reader As MySqlDataReader = cmd.ExecuteReader
                If reader.Read Then
                    Session("herb_name") = reader.GetString("herb_name")
                    Session("herb_image") = reader.GetString("herb_image")
                    Session("herb_rate") = reader.GetDouble("herb_rate")
                    Session("unit") = reader.GetString("unit")
                    Session("diseases") = reader.GetString("diseases")
                    Session("benefits") = reader.GetString("benefits")
                    Session("seller_user_name") = reader.GetString("user_name")
                End If
                reader.Close()
                cmd.Dispose()
                CloseConnection()

                Dim herb_image As String = Session("herb_image")
                Me.Image1.ImageUrl = "../user_section/herb_images/" & herb_image
                LblHerbName.Text = Session("herb_name")
                LblHerbRate.Text = Session("herb_rate") & " " & Session("unit")
                LblUsefulInDiseases.Text = Session("diseases")
                LblBenefits.Text = Session("benefits")
                LblFirmName.Text = Session("firm_name")
                LblFirmAddress.Text = Session("firm_address")
                LblOwnerName.Text = Session("owner_name")
                LblMobileNo.Text = Session("mobile_no")
                LblEmailId.Text = Session("email_id")
            End If
        Else
            Response.Write("session error")
        End If
    End Sub
    Protected Sub BtnAddToCart_Click(sender As Object, e As ImageClickEventArgs) Handles BtnAddToCart.Click
        If Session("cart") IsNot vbNullString Then
            Dim dt As DataTable = DirectCast(Session("cart"), DataTable)

            Dim row As DataRow = dt.NewRow
            row("srno") = Session("srno")
            row("herb_name") = Session("herb_name")
            row("herb_rate") = Session("herb_rate")
            row("unit") = Session("unit")
            row("seller_user_name") = Session("seller_user_name")
            dt.Rows.Add(row)
            Session("cart") = dt
            LblMsg.ForeColor = Drawing.Color.Green
            LblMsg.Text = "Added to cart"
        End If
    End Sub
End Class
