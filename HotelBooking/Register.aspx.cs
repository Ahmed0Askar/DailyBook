using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Hotel
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string password = txtPassword.Text;
            PBKDF2Hash hash = new PBKDF2Hash(password);
            string passwordHash = hash.HashedPassword;
            bool enabled = true;

            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            string sql = @"INSERT INTO UserAccounts VALUES
            (@username, @passwordhash, @role, @enabled)";

            SqlCommand cmd = new SqlCommand(sql, Conn);
            cmd.Parameters.AddWithValue("@username", txtUserName.Text);
            cmd.Parameters.AddWithValue("@passwordhash", passwordHash);
            cmd.Parameters.AddWithValue("@role", "user");
            cmd.Parameters.AddWithValue("@enabled", enabled);

            try
            {
                Conn.Open();
                cmd.ExecuteNonQuery();
                lblStatus.Text = "Status: Data Successfully saved.";
            }
            catch (SqlException ex)
            {
                lblStatus.Text = ex.Message;
            }
            finally
            {
                Conn.Close();
            }

        }
    }
}