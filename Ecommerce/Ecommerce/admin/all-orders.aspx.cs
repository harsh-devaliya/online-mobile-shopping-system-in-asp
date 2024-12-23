using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Ecommerce.admin
{
    public partial class all_orders : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);

            if (!IsPostBack)
            {
                BindGridView();
            }

            // display logged in successful
            if (Session["message"] != null)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.success('" + Session["message"].ToString() + "');", true);
                Session.Remove("message");
            }

            // if username is null, redirect to login page
            if (Session["username"] == null)
            {
                Response.Redirect("../login.aspx");
            }
        }

        private void BindGridView()
        {
            conn.Open();

            string selectQuery = "SELECT * FROM orderdetails ORDER BY orderid DESC";

            SqlDataAdapter adapter = new SqlDataAdapter(selectQuery, conn);
            DataTable dt = new DataTable();

            adapter.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();

            conn.Close();
        }
    }
}