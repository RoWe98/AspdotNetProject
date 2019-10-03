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
    public partial class myinfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = @"Data Source=localhost;Initial Catalog=bookmanage;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connStr);
            string usertype = "";
            string email = "";
            string sex = "";
            string rent_book = "";
            try
            {
                string db_table = "\"user\"";
                string username = Session["CurrentUser"].ToString();
                conn.Open();
                SqlCommand cmd = new SqlCommand("select user_type,email,sex from " + db_table + " where username=@username", conn);
                cmd.Parameters.Add("@username", SqlDbType.Char);
                cmd.Parameters[0].Value = username;
                //string usertype,email,sex,rent_book = (string)cmd.ExecuteScalar();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {

                    usertype = reader[0].ToString();
                    email = reader[1].ToString();
                    Session["email"] = email;
                    sex = reader[2].ToString();
                    Session["sex"] = sex;
                }

                if (usertype.Equals("1"))
                {
                    Session["UserType"] = "管理员";// 管理员
                }
                else if (usertype.Equals("2"))
                {
                    Session["UserType"] = "用户";//用户
                }
                else if (usertype.Equals("3"))
                {
                    Session["UserType"] = "VIP";//VIP
                }

            }
            catch (Exception ex)
            {
                //Response.Write("<script>alert('登录异常')</script>");
                Response.Write("<script>alert(<%ex.Message%>)</script>");
            }

            finally
            {
                conn.Close();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string book_name = GridView1.SelectedRow.Cells[1].Text;
            string connStr = @"Data Source=localhost;Initial Catalog=bookmanage;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            try
            {
                string sqlb = "delete from \"userborrow\" where borrow_name=@book_name";
                SqlCommand cmd = new SqlCommand(sqlb, conn);
                cmd.Parameters.Add("@book_name", SqlDbType.Char);
                cmd.Parameters[0].Value = book_name;
                cmd.ExecuteNonQuery();
                Response.Redirect("./myinfo.aspx");
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string current_flag = Session["UserType"].ToString();
            if (current_flag.Equals("管理员"))
            {
                Response.Redirect("~/AddBook.aspx");
            }
            else
            {
                Response.Write("<script>alert('当前用户并非管理员账户')</script>");
            }
        }
    }
}