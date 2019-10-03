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
    public partial class rentandback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int borrowlimit = this.getBorrowLimit();
            int borrownum = this.getBorrowNum();
            int stillborrow = borrowlimit - borrownum;
            Response.Write("<script>alert('还可以借阅"+stillborrow+"本书')</script>");
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int borrowlimit = this.getBorrowLimit();
            int borrownum = this.getBorrowNum();
            int stillborrow = borrowlimit - borrownum;
            if (stillborrow != 0)
            {
                string book_name = "'" + GridView1.SelectedRow.Cells[2].Text + "'";
                Response.Write(book_name);
                string borrow_date = "'" + DateTime.Now.ToShortDateString().ToString() + "'";
                string user_id = "'" + Session["CurrentUser"] + "'";
                string db_table = "\"userborrow\"";
                string connStr = @"Data Source=localhost;Initial Catalog=bookmanage;Integrated Security=True";
                SqlConnection conn = new SqlConnection(connStr);
                conn.Open();
                try
                {
                    string sql = "insert into " + db_table + "(user_id,borrow_name,borrow_date) values" + "(" + user_id + "," + book_name + "," + borrow_date + ")";
                    Response.Write(sql);
                    SqlCommand cmd = new SqlCommand(sql, conn);
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
            else
            {
                Response.Write("<script>alert('已经不可以借书了,要么充钱，要么还书把')</script>");
            }
        }

        protected int getBorrowNum()
        {
            int borrownum = 0;
            string connStr = @"Data Source=localhost;Initial Catalog=bookmanage;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            try
            {
                string username = Session["CurrentUser"].ToString();
                string sqll = "select count(borrow_name) from \"userborrow\" where user_id = @username";
                SqlCommand cmd = new SqlCommand(sqll, conn);
                cmd.Parameters.Add("@username", SqlDbType.Char);
                cmd.Parameters[0].Value = username;
                int count = (int)cmd.ExecuteScalar();
                borrownum = count;
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                conn.Close();
            }
            return borrownum;
        }

        protected int getBorrowLimit()
        {
            int borrowlimit = 0;
            string connStr = @"Data Source=localhost;Initial Catalog=bookmanage;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            try
            {
                string username = Session["CurrentUser"].ToString();
                string sqll = "select borrow_limit from \"user\" where username = @username";
                SqlCommand cmd = new SqlCommand(sqll, conn);
                cmd.Parameters.Add("@username", SqlDbType.Char);
                cmd.Parameters[0].Value = username;
                int limit = (int)cmd.ExecuteScalar();
                borrowlimit = limit;
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                conn.Close();
            }
            return borrowlimit;
        }
    }
}