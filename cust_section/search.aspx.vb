Imports MySql.Data.MySqlClient
Imports System.Configuration
Imports System.Data

Partial Class cust_section_search
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

    Protected Sub BtnSearch_Click(sender As Object, e As EventArgs) Handles BtnSearch.Click
        If Page.IsValid Then
            If RbHerb.Checked = False And RbDisease.Checked = False Then
                LblMsg.ForeColor = Drawing.Color.Red
                LblMsg.Text = "Select proper radio button"
            Else
                Try
                    Dim search_text As String = TxtSearch.Text.Trim().ToUpper()
                    Dim sql As String
                    If RbHerb.Checked Then
                        sql = "select * from herbs where herb_name like '%" & search_text & "%'"
                    ElseIf RbDisease.Checked Then
                        sql = "select * from herbs where diseases like '%" & search_text & "%'"
                    End If
                    GetConnection()
                    cmd = New MySqlCommand(sql, con)
                    Dim reader As MySqlDataReader = cmd.ExecuteReader
                    While reader.Read()
                        Dim srno As Integer = reader.GetInt32("srno")
                        Dim herb_name As String = reader.GetString("herb_name")
                        Dim herb_image As String = reader.GetString("herb_image")
                        Dim herb_rate As Double = reader.GetDouble("herb_rate")
                        Dim unit As String = reader.GetString("unit")
                        Dim diseases As String = reader.GetString("diseases")
                        Dim benefit As String = reader.GetString("benefits")
                        Dim seller_user_name As String = reader.GetString("user_name")

                        Dim query As String = "select firm_name, owner_name, mobile_no, email_id, firm_address from regusers where user_name=@user_name"
                        Dim conn_str As String = ConfigurationManager.ConnectionStrings("MyConnectionString").ConnectionString
                        Dim conn As MySqlConnection = New MySqlConnection(conn_str)
                        conn.Open()
                        Dim command As New MySqlCommand(query, conn)
                        command.Parameters.AddWithValue("@user_name", seller_user_name)
                        Dim dr As MySqlDataReader = command.ExecuteReader
                        dr.Read()
                        Dim firm_name As String = dr.GetString("firm_name")
                        Dim owner_name As String = dr.GetString("owner_name")
                        Dim mobile_no As String = dr.GetString("mobile_no")
                        Dim email_id As String = dr.GetString("email_id")
                        Dim firm_Address As String = dr.GetString("firm_address")
                        dr.Close()
                        command.Dispose()
                        conn.Dispose()
                        conn.Close()

                        Session("srno") = srno
                        Session("herb_name") = herb_name
                        Session("herb_image") = herb_image
                        Session("herb_rate") = herb_rate
                        Session("unit") = unit
                        Session("diseases") = diseases
                        Session("benefit") = benefit
                        Session("seller_user_name") = seller_user_name
                        Session("firm_name") = firm_name
                        Session("owner_name") = owner_name
                        Session("mobile_no") = mobile_no
                        Session("email_id") = email_id
                        Session("firm_Address") = firm_Address

                        Dim tr As New TableRow
                        Dim tc As TableCell

                        tc = New TableCell()
                        tc.Text = "<img src='../user_section/herb_images/" & herb_image & "' width='200px' height='200px'/>"
                        tr.Cells.Add(tc)

                        tc = New TableCell()
                        tc.Text = herb_name
                        tr.Cells.Add(tc)

                        tc = New TableCell()
                        tc.Text = herb_rate
                        tr.Cells.Add(tc)

                        tc = New TableCell()
                        tc.Text = firm_name
                        tr.Cells.Add(tc)

                        tc = New TableCell()
                        tc.Text = diseases
                        tr.Cells.Add(tc)

                        tc = New TableCell()
                        tc.Text = "<a href=more_details.aspx?srno=" & srno & ">More details and Buy</a>"
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
        Else
            LblMsg.ForeColor = Drawing.Color.Red
            LblMsg.Text = "Validation errors"
        End If
    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1))
            Response.Cache.SetCacheability(HttpCacheability.NoCache)
            Response.Cache.SetNoStore()
            RbHerb.Checked = True
            RbDisease.Checked = False
            If Session("username") IsNot vbNullString Then
            Else
                Response.Redirect("~/pagenotfound.aspx")
            End If
        End If


        If Not Page.IsPostBack Then
            If Session("cart") IsNot vbNullString Then
            Else
                ' Addaing cart in session            
                Dim dt As New DataTable
                dt.Columns.Add("srno")
                dt.Columns.Add("herb_name")
                dt.Columns.Add("herb_rate")
                dt.Columns.Add("unit")
                dt.Columns.Add("seller_user_name")
                Session("cart") = dt
            End If
        End If
    End Sub
End Class
