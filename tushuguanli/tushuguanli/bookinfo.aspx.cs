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
    public partial class bookinfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
     
          
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string userflag = Session["UserType"].ToString();
            if (userflag.Equals("管理员"))
            {
                string book_name = GridView1.SelectedRow.Cells[1].Text;
                string connStr = @"Data Source=localhost;Initial Catalog=bookmanage;Integrated Security=True";
                SqlConnection conn = new SqlConnection(connStr);
                conn.Open();
                try
                {
                    string sqlb = "delete from \"book\" where book_name=@book_name";
                    SqlCommand cmd = new SqlCommand(sqlb, conn);
                    cmd.Parameters.Add("@book_name", SqlDbType.Char);
                    cmd.Parameters[0].Value = book_name;
                    cmd.ExecuteNonQuery();
                    Response.Redirect("./bookinfo.aspx");
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
            else
            {
                Response.Write("<script>alert('当前用户并非管理员账户')</script>");
            }
        }
    }
}