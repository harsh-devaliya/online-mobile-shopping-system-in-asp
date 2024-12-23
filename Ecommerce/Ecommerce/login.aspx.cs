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
    public partial class login : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);

            // display registration successful
            if (Session["message"] != null)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.success('" + Session["message"].ToString() +"');",true);
                Session.Remove("message");
            }

            // after the login, try to access login page
            if (Session["username"] != null)
            {
                Session["authenticated"] = "You are already Logged in User!";
                Response.Redirect("index.aspx");
            }

            // display logout successful
            if (Session["logoutmessage"] != null)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.success('" + Session["logoutmessage"].ToString() +"');",true);
                Session.Remove("logoutmessage");
            }
        }

        private bool CheckValidateData()
        {
            Regex emailAddressPattern = new Regex(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
            Regex passwordPattern = new Regex(@"^[a-z0-9]{6,}$");

            if (string.IsNullOrWhiteSpace(txtEmailAddress.Text) || string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.error('All fields are required!');", true);
                return false;
            }
            else if (!emailAddressPattern.IsMatch(txtEmailAddress.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.error('Please, Enter valid email address!');", true);
                return false;
            }
            else if (!passwordPattern.IsMatch(txtPassword.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.error('Please, Enter valid password!');", true);
                return false;
            }
            else
            {
                return true;
            }
        }

        private void ClearAllTextboxData()
        {
            txtEmailAddress.Text = null;
            txtPassword.Text = null;
        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            if (CheckValidateData() == false)
            {
                return;
            }
            else
            {
                conn.Open();

                string loginQuery = "SELECT * FROM users WHERE email=@email AND password=@password";

                SqlCommand cmd = new SqlCommand(loginQuery, conn);

                cmd.Parameters.AddWithValue("@email", txtEmailAddress.Text);
                cmd.Parameters.AddWithValue("@password", txtPassword.Text);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                adapter.Fill(dt);   

                if (dt.Rows.Count > 0)
                {
                    Session["username"] = dt.Rows[0]["username"].ToString();

                    int userrole = Convert.ToInt32(dt.Rows[0]["role_as"].ToString());

                    if (userrole == 1)
                    {
                        Session["message"] = "Welcome to dashboard!";
                        ClearAllTextboxData();
                        Response.Redirect("~/admin/index.aspx"); // redirect to admin dashboard
                    }
                    else if(userrole == 0)
                    {
                        Session["message"] = "Logged in successfully!";
                        ClearAllTextboxData();
                        Response.Redirect("index.aspx");  // redirect to index page
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.error('Invalid email address or password!');", true);
                    ClearAllTextboxData();
                }

                conn.Close();
            }
        }
    }
}