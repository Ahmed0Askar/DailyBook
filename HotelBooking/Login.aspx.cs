using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Hotel
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["UserName"] != null && Request.Cookies["Password"] != null)
                {
                    txtUserName.Text = Request.Cookies["UserName"].Value;
                    txtPassword.Attributes["value"] = Request.Cookies["Password"].Value;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            string sql = @"SELECT * FROM UserAccounts WHERE UserName = @username";
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, Conn);
            cmd.Parameters.AddWithValue("@username", txtUserName.Text);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                // Username found
                Object objPasswordHash = dt.Rows[0]["PasswordHash"];
                Object objRole = dt.Rows[0]["Role"];
                Object objEnabled = dt.Rows[0]["Enabled"];
                string password = txtPassword.Text;
                string storedPasswordHash = objPasswordHash.ToString();

                PBKDF2Hash hash = new PBKDF2Hash(password, storedPasswordHash);
                bool check = hash.PasswordCheck;
                bool enabled = Convert.ToBoolean(objEnabled);

                if (check == true && enabled == true)
                {
                    //password correct and account enabled
                    Session["UserName"] = txtUserName.Text;
                    Session["Role"] = objRole;
                    if (Session["Role"].ToString() == "user")
                        Response.Redirect("Booking.aspx");
                    else if (Session["Role"].ToString() == "admin")
                        Response.Redirect("Admin.aspx");
                }
                else
                {
                    //password incorrect or account disabled
                    lblStatus.Text = "Incorrect password or account disabled";
                }
            }
            else
            {
                //Username not found
                lblStatus.Text = "Incorrect username.";
            }
        }

        protected void CheckBoxRememberme_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBoxRememberme.Checked)
            {
                Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(30);
                Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
            }
            else
            {
                Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);

            }
            Response.Cookies["UserName"].Value = txtUserName.Text.Trim();
            Response.Cookies["Password"].Value = txtPassword.Text.Trim();
        }
    }
}