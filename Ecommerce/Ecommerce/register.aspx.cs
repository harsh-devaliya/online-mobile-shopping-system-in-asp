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
    public partial class register : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);

            // after the login, try to access register page
            if (Session["username"] != null)
            {
                Session["authenticated"] = "You are already Logged in User!";
                Response.Redirect("index.aspx");
            }
        }

        private bool CheckValidateData()
        {
            Regex usernamePattern = new Regex(@"^[a-zA-Z_.]{6,}$");
            Regex emailAddressPattern = new Regex(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
            Regex phoneNumberPattern = new Regex(@"^\d{10}$");
            Regex passwordPattern = new Regex(@"^[a-z0-9]{6,}$");
            Regex confirmPasswordPattern = new Regex(@"^[a-z0-9]{6,}$");

            if (string.IsNullOrWhiteSpace(txtUsername.Text) || string.IsNullOrWhiteSpace(txtEmailAddress.Text) || string.IsNullOrWhiteSpace(txtPhoneNumber.Text) || string.IsNullOrWhiteSpace(txtPassword.Text) || string.IsNullOrWhiteSpace(txtConfirmPassword.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.error('All fields are required!');", true);
                return false;
            }
            else if (!usernamePattern.IsMatch(txtUsername.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.error('Please, Enter valid username!');", true);
                return false;
            }
            else if (!emailAddressPattern.IsMatch(txtEmailAddress.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.error('Please, Enter valid email address!');", true);
                return false;
            }
            else if (!phoneNumberPattern.IsMatch(txtPhoneNumber.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.error('Please, Enter valid phone number!');", true);
                return false;
            }
            else if (!passwordPattern.IsMatch(txtPassword.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.error('Please, Enter valid password!');", true);
                return false;
            }
            else if (!confirmPasswordPattern.IsMatch(txtConfirmPassword.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.error('Please, Enter valid confirm password!');", true);
                return false;
            }
            else
            {
                return true;
            }
        }

        private void ClearAllTextboxData()
        {
            txtUsername.Text = null;
            txtEmailAddress.Text = null;
            txtPhoneNumber.Text = null;
            txtPassword.Text = null;
            txtConfirmPassword.Text = null;
        }

        protected void registerBtn_Click(object sender, EventArgs e)
        {
            if (CheckValidateData() == false)
            {
                return;
            }
            else
            {
                if (txtPassword.Text == txtConfirmPassword.Text)
                {
                    conn.Open();

                    string insertQuery = "INSERT INTO users (username, email, phone, password) VALUES (@username, @email, @phone, @password)";

                    SqlCommand cmd = new SqlCommand(insertQuery, conn);

                    cmd.Parameters.AddWithValue("@username", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@email", txtEmailAddress.Text);
                    cmd.Parameters.AddWithValue("@phone", txtPhoneNumber.Text);
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text);

                    cmd.ExecuteNonQuery();

                    Session["message"] = "Registered Successfully!";
                    ClearAllTextboxData();
                    Response.Redirect("login.aspx");  // redirect to login page

                    conn.Close();
                }

                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.error('Passwords do not matched!');", true);
                    ClearAllTextboxData();
                }
            }
        }
    }
}