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
    public partial class addcart : System.Web.UI.Page
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
                BindCartGridView();
            }

        }

        private void BindCartGridView()
        {
            conn.Open();
            string query = "SELECT c.cartid, p.productimage, c.name, c.price, c.quantity, c.totalprice FROM carts c JOIN products p ON c.productid=p.productid WHERE c.username=@username ORDER BY cartid DESC";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@username", Session["username"].ToString());
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            conn.Close();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "remove")
            {
                int cartId = Convert.ToInt32(e.CommandArgument);

                conn.Open();
                string query = "DELETE FROM carts WHERE cartid=@cartid";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@cartid", cartId);
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.success('Product removed successfully!');", true);

            BindCartGridView();

        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            string username = Session["username"].ToString();
            string query = "SELECT COUNT(*) FROM carts WHERE username=@username";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@username", username);
            conn.Open();
            int itemCount = (int)cmd.ExecuteScalar();
            conn.Close();

            if (itemCount == 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.success('Cart is empty, continue shopping!');", true);
            }
            else
            {
                Response.Redirect("checkout.aspx");
            }
        }
    }
}