using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text.RegularExpressions;

namespace Ecommerce
{
    public partial class user_profile : System.Web.UI.Page
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
                if (Session["username"] != null)
                {
                    string username = Session["username"].ToString();
                    BindUserDetails(username);
                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }
        }

        private bool CheckValidateData()
        {
            Regex phoneNumberPattern = new Regex(@"^\d{10}$");
            Regex passwordPattern = new Regex(@"^[a-z0-9]{6,}$");

            if(String.IsNullOrWhiteSpace(txtPhone.Text) || string.IsNullOrWhiteSpace(txtNewPassword.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.error('All fields are required!');", true);
                return false;
            }
            else if (!phoneNumberPattern.IsMatch(txtPhone.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.error('Please, Enter valid phone number!');", true);
                return false;
            }
            else if (!passwordPattern.IsMatch(txtNewPassword.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.error('Please, Enter valid password!');", true);
                return false;
            }
            else
            {
                return true;
            }

        }

        private void BindUserDetails(string username)
        {
            conn.Open();

            string selectQuery = "SELECT * FROM users WHERE username=@username";

            SqlCommand cmd = new SqlCommand(selectQuery, conn);

            cmd.Parameters.AddWithValue("@username", Session["username"].ToString());

            SqlDataReader reader = cmd.ExecuteReader();

            if(reader.Read())
            {
                txtUsername.Text = reader["username"].ToString();
                txtPhone.Text = reader["phone"].ToString();
                txtEmail.Text = reader["email"].ToString();
                txtNewPassword.Text = reader["password"].ToString();
            }

            conn.Close();
        }

        protected void updateBtn_Click(object sender, EventArgs e)
        {
            if(CheckValidateData() == false)
            {
                return;
            }
            else
            {
                string updateQuery = "UPDATE users SET phone=@phone, password=@password WHERE username=@username";

                SqlCommand cmd = new SqlCommand(updateQuery, conn);

                cmd.Parameters.AddWithValue("@phone", txtPhone.Text);
                cmd.Parameters.AddWithValue("@password", txtNewPassword.Text);
                cmd.Parameters.AddWithValue("@username", Session["username"].ToString());

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "Swal.fire({title:'Success!',text:'Your Profile updated successfully!',icon:'success'});", true);

            }
        }
    }
}