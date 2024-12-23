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
    public partial class view_category : System.Web.UI.Page
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

            string selectQuery = "SELECT * FROM categories";

            SqlDataAdapter adapter = new SqlDataAdapter(selectQuery, conn);
            DataTable dt = new DataTable();

            adapter.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();

            conn.Close();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGridView();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int categoryid = Convert.ToInt32(((Label)GridView1.Rows[e.RowIndex].FindControl("lblid")).Text);
            TextBox txtcatname = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtCatName");
            TextBox txtcatslug = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtCatSlug");
            TextBox txtcatdescription = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtCatDescription");
            TextBox txtcatimage = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtCatImage");
            TextBox txtcatstatus = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtCatStatus");

            string categoryName = txtcatname.Text;
            string categorySlug = txtcatslug.Text;
            string categoryDescription = txtcatdescription.Text;
            string categoryImage = txtcatimage.Text;
            string categoryStatus = txtcatstatus.Text;

            string updateQuery = "UPDATE categories SET catname=@catname, catslug=@catslug, catdescription=@catdescription, catimage=@catimage, catstatus=@catstatus WHERE catid=@catid";

            SqlCommand cmd = new SqlCommand(updateQuery, conn);

            cmd.Parameters.AddWithValue("@catid", categoryid);
            cmd.Parameters.AddWithValue("@catname", categoryName);
            cmd.Parameters.AddWithValue("@catslug", categorySlug);
            cmd.Parameters.AddWithValue("@catdescription", categoryDescription);
            cmd.Parameters.AddWithValue("@catimage", categoryImage);
            cmd.Parameters.AddWithValue("@catstatus", categoryStatus);

            conn.Open();
            cmd.ExecuteNonQuery();  
            conn.Close();

            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.success('Category updated successfully!');", true);

            GridView1.EditIndex = -1;
            BindGridView();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int categoryid = Convert.ToInt32(((Label)GridView1.Rows[e.RowIndex].FindControl("lblid")).Text);

            string deleteQuery = "DELETE FROM categories WHERE catid=@catid";

            SqlCommand cmd = new SqlCommand(deleteQuery, conn);

            cmd.Parameters.AddWithValue("@catid", categoryid);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.success('Category deleted successfully!');", true);

            BindGridView();
        }
    }
}