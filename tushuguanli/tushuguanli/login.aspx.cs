using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace tushuguanli
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LinkButtonRegister_Click1(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }
        protected void ButtonLogin_Click1(object sender, EventArgs e)
        {
            string connStr = @"Data Source=localhost;Initial Catalog=bookmanage;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connStr);
            try
            {
                string db_table = "\"user\"";
                string username = TextBoxUser.Text;
                conn.Open();
                Response.Write("<script>alert('数据库链接成功')</script>");
                SqlCommand cmd = new SqlCommand("select password from "+db_table+" where username=@username", conn);
                cmd.Parameters.Add("@username", SqlDbType.Char);
                cmd.Parameters[0].Value = username;
                string password = (string)cmd.ExecuteScalar();
                
                if (password == TextBoxPass.Text)
                {
                    Session["CurrentUser"] = username;
                    Response.Redirect("./Default.aspx");
                }
                else
                {
                    Response.Write("<script>alert('用户名或密码错误')</script>");
                }
            }
            catch(Exception ex)
            {
                //Response.Write("<script>alert('登录异常')</script>");
                Response.Write(ex.Message);
            }

            finally
            {
                conn.Close();
            }

        }
    }
}