using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.EnterpriseServices;

namespace Ecommerce
{
    public partial class view_product : System.Web.UI.Page
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
                if (!IsPostBack)
                {
                    string productid = Request.QueryString["id"];
                    if (!string.IsNullOrEmpty(productid))
                    {
                        BindProducts(productid);
                    }
                    else
                    {
                        lblNotFound.Text = "Requested productid not found";
                    }
                }
            }
        }

        private void BindProducts(string productid)
        {
            conn.Open();
            string query = "SELECT * FROM products WHERE productid=@productid";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@productid", productid);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();
            conn.Close();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "addtocart")
            {
                int productid = Convert.ToInt32(e.CommandArgument);

                string username = Session["username"].ToString();

                Label name = (Label)e.Item.FindControl("productName");
                string productName = name.Text;

                Label sellprice = (Label)e.Item.FindControl("productSellPrice");
                int productSellPrice = Convert.ToInt32(sellprice.Text);

                DropDownList productqty = (DropDownList)e.Item.FindControl("productQty");
                int quantity = Convert.ToInt32(productqty.SelectedItem.ToString());

                int totalprice = Convert.ToInt32(productSellPrice * quantity);

                if (!string.IsNullOrEmpty(username))
                {
                    if (IsProductInCart(productid, username))
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.success('Product already added in cart!');", true);
                    }
                    else
                    {
                        AddProductToCart(productid, username, productName, productSellPrice, quantity, totalprice);
                    }
                }
                else
                {
                    Session["message"] = "Login to continue!";
                    Response.Redirect("login.aspx");
                }
            }
        }

        private bool IsProductInCart(int productid, string username)
        {
            conn.Open();
            string selectQuery = "SELECT COUNT(*) FROM carts WHERE username=@username AND productid=@productid";

            SqlCommand cmd = new SqlCommand(selectQuery, conn);

            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@productid", productid);

            int count = (int)cmd.ExecuteScalar();
            return count > 0;
        }

        private void AddProductToCart(int productid,string username,string productName,int productSellPrice,int quantity,int totalprice)
        {
            string query = "INSERT INTO carts (productid, username, name, price, quantity, totalprice) VALUES (@productid, @username, @name, @price, @quantity, @totalprice)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@productid", productid);
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@name", productName);
            cmd.Parameters.AddWithValue("@price", productSellPrice);
            cmd.Parameters.AddWithValue("@quantity", quantity);
            cmd.Parameters.AddWithValue("@totalprice", totalprice);
            cmd.ExecuteNonQuery();
            conn.Close();
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertify.set('notifier','position','top-right');alertify.success('Product added successfully!');", true);
        }

    }
}