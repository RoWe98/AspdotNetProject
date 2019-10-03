using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace tushuguanli
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonLogin_ClickRegister(object sender, EventArgs e)
        {
            
            string connStr = @"Data Source=localhost;Initial Catalog=bookmanage;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            try
            {
                String db_table = "\"user\"";
                String username = "'"+TextBoxUser.Text+"'";
                String password = "'"+TextBoxPass.Text+"'";
                String email = "'"+TextBoxEmail.Text+"'";
                String sex = "'"+TextBoxSex.Text+"'";
                string sql = "insert into " + db_table + "(username,password,user_type,email,sex,borrow_limit) values" + "(" + username + "," + password + ",'2'," + email + "," + sex + ",'6'"+")";
                Response.Write(sql);
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
                Response.Redirect("./login.aspx");
            }
            catch(Exception ex)
            {
                //Response.Write("<script>alert('注册失败')</script>");
                Response.Write(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }
    }
}