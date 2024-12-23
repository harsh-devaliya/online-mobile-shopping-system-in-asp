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
    public partial class add_category : System.Web.UI.Page
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

            // if username is null, redirect to login page
            if (Session["username"] == null)
            {
                Response.Redirect("../login.aspx");
            }

        }

        private void ClearAllTextboxData()
        {
            txtCatName.Text = null;
            txtCatSlug.Text = null;
            txtCatDescription.Text = null;
            fileUploadCatImage.Attributes.Clear();  
        }

        protected void addCategoryBtn_Click(object sender, EventArgs e)
        {
            string imagePath = "../uploads/" + fileUploadCatImage.FileName;
            fileUploadCatImage.SaveAs(Server.MapPath(imagePath));

            string insertQuery = "INSERT INTO categories (catname, catslug, catdescription, catimage) VALUES (@catname, @catslug, @catdescription, @catimage)";

            SqlCommand cmd = new SqlCommand(insertQuery, conn);

            cmd.Parameters.AddWithValue("@catname", txtCatName.Text);
            cmd.Parameters.AddWithValue("@catslug", txtCatSlug.Text);
            cmd.Parameters.AddWithValue("@catdescription", txtCatDescription.Text);
            cmd.Parameters.AddWithValue("@catimage", imagePath);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            ClearAllTextboxData();

            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.success('Category added successfully!');", true);

        }
    }
}