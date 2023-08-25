using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace project21
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string str = "Data Source=localhost;Database=himanshu;User=sa;Password=admin@123";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gridbind();
            }
        }
        private void gridbind()
        {
            SqlConnection con = new SqlConnection(str);
            SqlDataAdapter da = new SqlDataAdapter("select * from sale",con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gridviewid.DataSource = dt;
            gridviewid.DataBind();
            
        }

       

        

        protected void gridviewid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string No = e.CommandArgument.ToString();
            if (e.CommandName=="Edit")
            {
                
                Response.Redirect("WebForm1.aspx?No='" +No+ "'");
            }
            else if (e.CommandName=="del")
            {
                
                SqlConnection con = new SqlConnection(str);
                con.Open();
                SqlCommand Cmd = new SqlCommand($"delete from sale where No='{No}'", con);
                Cmd.ExecuteNonQuery();
                con.Close();
                gridbind();
            }

        }

        protected void Add_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm1.aspx");
        }
    }
}