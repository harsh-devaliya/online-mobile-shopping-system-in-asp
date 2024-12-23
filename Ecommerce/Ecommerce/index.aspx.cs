using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Ecommerce
{
    public partial class index : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);

            // display logged in successful
            if (Session["message"] != null)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.success('" + Session["message"].ToString() + "');", true);
                Session.Remove("message");
            }

            // display authenticated user message
            if (Session["authenticated"] != null)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.success('" + Session["authenticated"].ToString() + "');", true);
                Session.Remove("authenticated");
            }

            if (!IsPostBack)
            {
                BindProducts();
            }
        }

        private void BindProducts()
        {
            conn.Open();
            string query = "SELECT * FROM products WHERE productstatus = 1";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();
            conn.Close();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "viewdetails")
            {
                int productid = Convert.ToInt32(e.CommandArgument.ToString());
                Response.Redirect($"view-product.aspx?id={productid}");
            }
        }
    }
}