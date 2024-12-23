using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Ecommerce
{
    public partial class checkout : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);

            // display authenticated user message
            if (Session["authenticated"] != null)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.success('" + Session["authenticated"].ToString() + "');", true);
                Session.Remove("authenticated");
            }

            // if username is null, redirect to login page
            if (Session["username"] == null)
            {
                Session["message"] = "Login to continue!";
                Response.Redirect("login.aspx");
            }

            if (!IsPostBack)
            {
                BindCartItems();
            }
        }

        private void BindCartItems()
        {
            conn.Open();
            string query = "SELECT p.productimage, c.name, c.price, c.quantity, c.totalprice FROM carts c JOIN products p ON c.productid=p.productid WHERE c.username=@username";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@username", Session["username"].ToString());
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

            int grandTotal = 0;
            foreach (DataRow row in dt.Rows)
            {
                grandTotal += Convert.ToInt32(row["totalprice"]);
            }
            lblGrandTotal.Text = grandTotal.ToString();
            conn.Close();
        }

        protected void ClearTextBoxData()
        {
            txtPhoneNumber.Text = null;
            txtEmail.Text = null;
            txtAddress.Text = null;
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            Random random = new Random();
            int randomNumber = random.Next(1111, 9999);
            string orderId = "order" + randomNumber;

            string username = Session["username"].ToString();
            string phonenumber = txtPhoneNumber.Text;
            string emailid = txtEmail.Text;
            string address = txtAddress.Text;
            string paymentoption = ddlPayment.SelectedValue;
            int grandtotal = Convert.ToInt32(lblGrandTotal.Text);
            DateTime currentDateTime = DateTime.Now;

            int totalQuantity = 0;
            foreach (GridViewRow row in GridView1.Rows)
            {
                totalQuantity += int.Parse(row.Cells[3].Text);
            }

            conn.Open();

            string query = "INSERT INTO orderdetails (trackingid, username, phone, email, address, payment, totalquantity, grandtotal, createat) VALUES (@trackingid, @username, @phone, @email, @address, @payment, @totalquantity, @grandtotal, @createat)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@trackingid", orderId);
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@phone", phonenumber);
            cmd.Parameters.AddWithValue("@email", emailid);
            cmd.Parameters.AddWithValue("@address", address);
            cmd.Parameters.AddWithValue("@payment", paymentoption);
            cmd.Parameters.AddWithValue("@totalquantity", totalQuantity);
            cmd.Parameters.AddWithValue("@grandtotal", grandtotal);
            cmd.Parameters.AddWithValue("@createat", currentDateTime);

            cmd.ExecuteNonQuery();

            string deleteQuery = "DELETE FROM carts WHERE username=@username";
            SqlCommand deleteCmd = new SqlCommand(deleteQuery, conn);
            deleteCmd.Parameters.AddWithValue("@username", Session["username"].ToString());
            deleteCmd.ExecuteNonQuery();

            conn.Close();

            ClearTextBoxData();

            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.success('Order Placed Successfully!');", true);
        }
    }
}