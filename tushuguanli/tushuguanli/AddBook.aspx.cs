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
    public partial class AddBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonAdd_ClickAdd(object sender, EventArgs e)
        {
            string connStr = @"Data Source=localhost;Initial Catalog=bookmanage;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            try
            {
                string book_name = TextBoxBook.Text;
                string publish = TextBoxPublish.Text;
                string type = TextBoxType.Text;
                string sql = "insert into \"book\"(book_name,publish,book_type) values(@book_name,@publish,@type)";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.Add("@book_name", SqlDbType.Char);
                cmd.Parameters.Add("@publish", SqlDbType.Char);
                cmd.Parameters.Add("@type", SqlDbType.Char);
                cmd.Parameters[0].Value = book_name;
                cmd.Parameters[1].Value = publish;
                cmd.Parameters[2].Value = type;
                cmd.ExecuteNonQuery();
                Response.Redirect("./bookinfo.aspx");
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }
    }
}