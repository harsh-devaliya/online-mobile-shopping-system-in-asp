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
    public partial class add_product : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            
            if(!IsPostBack)
            {
                BindCategoryofProduct();
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

        private void ClearAllTextboxData()
        {
            ddlCategory.SelectedIndex = 0;
            txtName.Text = null;
            txtSlug.Text = null;
            txtDescription.Text = null; 
            fileUploadImage.Attributes.Clear();
            txtOrgPrice.Text = null;    
            txtSellPrice.Text = null;   
        }

        private void BindCategoryofProduct()
        {
            conn.Open();

            string selectQuery = "SELECT * FROM categories";

            SqlCommand cmd = new SqlCommand(selectQuery, conn); 

            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            adapter.Fill(dt);

            ddlCategory.DataSource = dt;    
            ddlCategory.DataBind(); 

            conn.Close();
        }

        protected void addProductBtn_Click(object sender, EventArgs e)
        {
            string imagePath = "../uploads/" + fileUploadImage.FileName;
            fileUploadImage.SaveAs(Server.MapPath(imagePath));

            string productDescription = txtDescription.Text;    

            string insertQuery = "INSERT INTO products (productcategory, productname, productslug, productdescription, productimage, productorgprice, productsellprice) VALUES (@productcategory, @productname, @productslug, @productdescription, @productimage, @productorgprice, @productsellprice)";

            SqlCommand cmd = new SqlCommand(insertQuery, conn);

            cmd.Parameters.AddWithValue("@productcategory", ddlCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@productname", txtName.Text);
            cmd.Parameters.AddWithValue("@productslug", txtSlug.Text);
            cmd.Parameters.AddWithValue("@productdescription", productDescription);
            cmd.Parameters.AddWithValue("@productimage", imagePath);
            cmd.Parameters.AddWithValue("@productorgprice", Convert.ToDecimal(txtOrgPrice.Text));
            cmd.Parameters.AddWithValue("@productsellprice", Convert.ToDecimal(txtSellPrice.Text));

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            ClearAllTextboxData();

            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.success('Product added successfully!');", true);
        }
    }
}