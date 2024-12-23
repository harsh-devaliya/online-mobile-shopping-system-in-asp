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
    public partial class view_product : System.Web.UI.Page
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

            string selectQuery = "SELECT * FROM products";

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
            int productId = Convert.ToInt32(((Label)GridView1.Rows[e.RowIndex].FindControl("lblid")).Text);
            TextBox pdtCategory = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtCategory");
            TextBox pdtName = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtName");
            TextBox pdtSlug = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtSlug");
            TextBox pdtDescription = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtDescription");
            TextBox pdtImage = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtImage");
            TextBox pdtOrgPrice = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtOrgPrice");
            TextBox pdtSellPrice = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtSellPrice");
            TextBox pdtStatus = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtStatus");

            string category = pdtCategory.Text;
            string productname = pdtName.Text;
            string productslug = pdtSlug.Text;
            string productdescription = pdtDescription.Text;
            string productimage = pdtImage.Text;
            string productorgprice = pdtOrgPrice.Text;
            string productsellprice = pdtSellPrice.Text;
            string productstatus = pdtStatus.Text;

            string updateQuery = "UPDATE products SET productcategory=@productcategory, productname=@productname, productslug=@productslug, productdescription=@productdescription, productimage=@productimage, productorgprice=@productorgprice, productsellprice=@productsellprice, productstatus=@productstatus WHERE productid=@productid";

            SqlCommand cmd = new SqlCommand(updateQuery, conn);

            cmd.Parameters.AddWithValue("@productid", productId);
            cmd.Parameters.AddWithValue("@productcategory", category);
            cmd.Parameters.AddWithValue("@productname", productname);
            cmd.Parameters.AddWithValue("@productslug", productslug);
            cmd.Parameters.AddWithValue("@productdescription", productdescription);
            cmd.Parameters.AddWithValue("@productimage", productimage);
            cmd.Parameters.AddWithValue("@productorgprice", productorgprice);
            cmd.Parameters.AddWithValue("@productsellprice", productsellprice);
            cmd.Parameters.AddWithValue("@productstatus", productstatus);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.success('Product updated successfully!');", true);

            GridView1.EditIndex = -1;
            BindGridView();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int productId = Convert.ToInt32(((Label)GridView1.Rows[e.RowIndex].FindControl("lblid")).Text);

            string deleteQuery = "DELETE FROM products WHERE productid=@productid";

            SqlCommand cmd = new SqlCommand(deleteQuery, conn);

            cmd.Parameters.AddWithValue("@productid", productId);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.success('Product deleted successfully!');", true);

            BindGridView();
        }
    }
}