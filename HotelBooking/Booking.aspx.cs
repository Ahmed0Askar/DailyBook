using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace Hotel
{
    public partial class Booking : System.Web.UI.Page
    {
        static double totalAmount;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null)
                Response.Redirect("Homepage.aspx");
            if (!IsPostBack)
                GenerateSalesId();
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.PageIndex = 0;
        }
        void GenerateSalesId()
        {
            string hexTicks = DateTime.Now.Ticks.ToString("X");
            lblSalesId.Text = hexTicks.Substring(hexTicks.Length - 15, 9);
            lblDateTime.Text = DateTime.Now.ToString();
        }
        void SalesAddItem()
        {
            //Create Connection 
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            //Create command object with Stored Procedure name
            SqlCommand cmd = new SqlCommand("spSalesAddItem", Conn);

            //Set command object for stored procedure name
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@salesid", lblSalesId.Text);
            cmd.Parameters.AddWithValue("@itemid", lblItemId.Text);
            cmd.Parameters.AddWithValue("@quantity", txtQuantity.Text);
            try
            {
                //Open Connection
                Conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                lblMessage1.Text = ex.Message;
            }
            finally
            {
                Conn.Close();
            }
            txtQuantity.Text = "1";
        }
        void SalesGetTotalAmount()
        {
            //Create Connection 
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            //Create command object with Stored Procedure name
            SqlCommand cmd = new SqlCommand("spSalesGetTotalAmount", Conn);

            //Set command object for stored procedure name
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@salesid", lblSalesId.Text);
            try
            {
                //Open Connection
                Conn.Open();
                totalAmount = (double)cmd.ExecuteScalar();
                lblTotalAmountCart.Text = totalAmount.ToString("c2");
            }
            catch (SqlException ex)
            {
                lblMessage2.Text = ex.Message;
            }
            finally
            {
                Conn.Close();
            }

        }
        void SalesConfirm()
        {
            //Create Connection 
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            //Create command object with Stored Procedure name
            SqlCommand cmd = new SqlCommand("spSalesConfirm", Conn);

            //Set command object for stored procedure name
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@salesid", lblSalesId.Text);
            try
            {
                //Open Connection
                Conn.Open();
                cmd.ExecuteNonQuery();
                lblMessage2.Text = "Sales Confirmed!";
            }
            catch (SqlException ex)
            {
                lblMessage2.Text = ex.Message;
            }
            finally
            {
                Conn.Close();
            }
            txtQuantity.Text = "1";
        }
        void DisplayInvoice()
        {
            double serviceTax, amountAfterTax, amountRounded, rounding;
            serviceTax = totalAmount * 0.06;
            amountAfterTax = totalAmount + serviceTax;
            amountRounded = Math.Round((amountAfterTax) / 0.05) * 0.05;
            rounding = amountRounded = amountAfterTax;


            lblName.Text = "Name: " + Convert.ToString(txtName.Text);
            lblDate1.Text = "Check In: " + Convert.ToString(txtCheckin.Text);
            lblDate2.Text = "Check Out: " + Convert.ToString(txtCheckOut.Text);
            lblTotalAmount.Text = "Total Amount: " + totalAmount.ToString("c2");
            lblServiceTax.Text = "Service tax (6%): " + serviceTax.ToString("c2");
            lblAmountAfterTax.Text = "Amount after tax: " + amountAfterTax.ToString("c2");
            lblRounding.Text = "Rounding : " + rounding.ToString("c2");
            lblAmountRounded.Text = "Amount to pay: " + amountRounded.ToString("c2");

        }
        void ClearAll()
        {
            lblItemId.Text = "";
            lblItemTitle.Text = "";
            lblItemPrice.Text = "";
            lblName.Text = "";
            lblDate1.Text = "";
            lblDate2.Text = "";
            lblTotalAmountCart.Text = "$0.00";
            lblTotalAmount.Text = "";
            lblServiceTax.Text = "";
            lblAmountAfterTax.Text = "";
            lblRounding.Text = "";
            lblAmountRounded.Text = "";
            lblMessage1.Text = "";
            lblMessage2.Text = "";
        }
        void SalesRemoveNotConfirmed()
        {
            //Create Connection 
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            //Create command object with Stored Procedure name
            SqlCommand cmd = new SqlCommand("spSalesRemoveNotConfirmed", Conn);

            //Set command object for stored procedure name
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@salesid", lblSalesId.Text);
            try
            {
                //Open Connection
                Conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                lblMessage2.Text = ex.Message;
            }
            finally
            {
                Conn.Close();
            }
        }
        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            SalesConfirm();
            DisplayInvoice();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            SalesRemoveNotConfirmed();
            ClearAll();
            GenerateSalesId();
            ddlCategory.DataBind();
            GridView1.PageIndex = 0;
            GridView1.DataBind();
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            ClearAll();
            GenerateSalesId();
            ddlCategory.DataBind();
            GridView1.PageIndex = 0;
            GridView1.DataBind();
        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            SalesAddItem();
            GridView2.DataBind();
            SalesGetTotalAmount();
        }
        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            lblItemId.Text = GridView1.SelectedRow.Cells[1].Text;
            lblItemTitle.Text = GridView1.SelectedRow.Cells[2].Text;
            lblItemPrice.Text = GridView1.SelectedRow.Cells[3].Text;
        }
    }
}