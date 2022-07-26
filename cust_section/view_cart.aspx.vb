Imports System.Data
Partial Class cust_section_view_cart
    Inherits System.Web.UI.Page

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
            If Session("cart") IsNot vbNullString Then
                Dim dt As DataTable = DirectCast(Session("cart"), DataTable)
                GridView1.DataSource = dt
                GridView1.DataBind()

                Dim total_bill As Double = 0
                Dim number_of_items As Integer = dt.Rows.Count
                For i As Integer = 0 To number_of_items - 1
                    total_bill = total_bill + dt.Rows(i)(2)
                Next
                LblTotalBill.Text = total_bill
                Session("total_bill") = total_bill
                LblTotalNumberOfItems.Text = number_of_items
            Else
                ' Addaing cart in session            
                Dim dt As New DataTable
                dt.Columns.Add("srno")
                dt.Columns.Add("herb_name")
                dt.Columns.Add("herb_rate")
                dt.Columns.Add("unit")
                dt.Columns.Add("seller_user_name")
                Session("cart") = dt
                GridView1.DataSource = dt
                GridView1.DataBind()
            End If
        End If
    End Sub
    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.Header Then
            e.Row.Cells(0).Text = "Product ID"
            e.Row.Cells(1).Text = "Herb Name"
            e.Row.Cells(2).Text = "Rate (&#8377;)"
            e.Row.Cells(3).Text = "Unit"
            e.Row.Cells(4).Text = "Seller"
        End If
    End Sub
    Protected Sub BtnPayBill_Click(sender As Object, e As EventArgs) Handles BtnPayBill.Click
        Response.Redirect("~/cust_section/pay_bill.aspx")
    End Sub
End Class
