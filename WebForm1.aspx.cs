using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace project21
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string str = ConfigurationManager.ConnectionStrings["str"].ConnectionString;
        //string str = "Data Source=localhost;Database=himanshu;User=sa;Password=admin@123";
        public static string givenNo;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["No"] != null)
                {
                    givenNo =Request.QueryString["No"].Replace("'","");
                  
                    SetData(givenNo);
                    No.Text = givenNo;
                    No.Enabled = false;
                }
                else
                {
                    No.Text = generateNo().ToString();
                    No.ReadOnly=true;
                    Order_No.Text = "SO-" + generateNo().ToString();
                    Order_No.ReadOnly = true;
                }
            }
          
        }

        protected void button_Click(object sender, EventArgs e)
        {
            SqlConnection con =  new SqlConnection(str);
            con.Open();
            string query;
            string Nos = No.Text;
            SqlCommand cmd1 = new SqlCommand($"select * from sale where No={Nos}", con);
            SqlDataReader reader = cmd1.ExecuteReader();
            bool IsData=reader.Read();
            
            if (IsData== false)
            {
                
                query = $"insert into sale values({No.Text},'{Order_No.Text}','{Client.SelectedValue}','{location.Text}'," +
                    $"'{customer_number.Text}','{partial.Text}','{payment.SelectedValue}','{shipment.SelectedValue}','{channel.SelectedValue}'," +
                    $"'{Batch.Text}','{tax.Text}','{order_type.SelectedValue}','{status.Text}','{payment_mode.SelectedValue}','{reference_no.Text}'," +
                    $"'{type_of_sale.Text}','{checkbox.Checked}','{calander.Text}','{remark.Text}')";
            }
            else
            {
                query = $"update sale set Order_No='{Order_No.Text}',Client='{Client.SelectedValue}',Location_Code='{location.Text}',Customer_number='{customer_number.Text}'," +
                   $"partial_delivery_allowed='{partial.Text}'," +
                   $"Payment_method_code='{payment.SelectedValue}',shipment_method_code='{shipment.SelectedValue}',channel_identification='{channel.SelectedValue}',batch_no='{Batch.Text}',tax_structure='{tax.Text}',order_type='{order_type.SelectedValue}'," +
                   $"status='{status.Text}',payment_mode='{payment_mode.SelectedValue}',reference_no='{reference_no.Text}',type_of_sale='{type_of_sale.Text}',Is_B2B='{checkbox.Checked}',date='{calander.Text}'," +
                   $"external_remark='{remark.Text}' where No={No.Text}";
            }
            //if (givenNo != null)
            //{
            //    query = $"update sale set Order_No='{Order_No.Text}',Client='{Client.SelectedValue}',Location_Code='{location.Text}',Customer_number='{customer_number.Text}'," +
            //        $"partial_delivery_allowed='{partial.Text}'," +
            //        $"Payment_method_code='{payment.SelectedValue}',shipment_method_code='{shipment.SelectedValue}',channel_identification='{channel.SelectedValue}',batch_no='{Batch.Text}',tax_structure='{tax.Text}',order_type='{order_type.SelectedValue}'," +
            //        $"status='{status.Text}',payment_mode='{payment_mode.SelectedValue}',reference_no='{reference_no.Text}',type_of_sale='{type_of_sale.Text}',Is_B2B='{checkbox.Checked}',date='{calander.Text}'," +
            //        $"external_remark='{remark.Text}' where No={No.Text}";
            //}
            //else {
            //    query = $"insert into sale values({No.Text},'{Order_No.Text}','{Client.SelectedValue}','{location.Text}'," +
            //        $"'{customer_number.Text}','{partial.Text}','{payment.SelectedValue}','{shipment.SelectedValue}','{channel.SelectedValue}'," +
            //        $"'{Batch.Text}','{tax.Text}','{order_type.SelectedValue}','{status.Text}','{payment_mode.SelectedValue}','{reference_no.Text}'," +
            //        $"'{type_of_sale.Text}','{checkbox.Checked}','{calander.Text}','{remark.Text}')"; 
            //}
            con.Close();
            con.Open();
            if (No.Text == string.Empty)
            {
                Response.Write("insert No");
            }
            else {
                if (!customer_no(customer_number.Text) && customer_number.Text==""  )
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "SweatAlert", "Swal.fire('Error','customer number already exist','error')",true);
                }
                else
                {
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("WebForm2.aspx");
                }
              
            }

        }
        private void SetData(string No)
        {
            SqlConnection con = new SqlConnection(str);
            con.Open();
            SqlCommand cmd = new SqlCommand($"select * from sale where No={No}", con);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
            
                Order_No.Text = reader["Order_No"].ToString();
                Client.SelectedValue = reader["Client"].ToString();
                location.Text = reader["Location_Code"].ToString();
                customer_number.Text = reader["Customer_number"].ToString();
                partial.Text = reader["partial_delivery_allowed"].ToString();
                payment.Text = reader["Payment_method_code"].ToString();
                shipment.Text = reader["shipment_method_code"].ToString();
                channel.Text = reader["channel_identification"].ToString();
                Batch.Text = reader["batch_no"].ToString();
                tax.Text = reader["tax_structure"].ToString();
                order_type.SelectedValue = reader["order_type"].ToString();
                status.Text = reader["status"].ToString();
                payment_mode.SelectedValue = reader["payment_mode"].ToString();
                reference_no.Text = reader["reference_no"].ToString();
                type_of_sale.Text = reader["type_of_sale"].ToString();
                if (reader["Is_B2B"].ToString() == "True")
                {
                    checkbox.Checked = true;
                }
                calander.Text = reader["date"].ToString();
                remark.Text = reader["external_remark"].ToString();


            }

        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm2.aspx");
        }
        private int  generateNo()
        {
            int max = 0;
            SqlConnection con = new SqlConnection(str);
            con.Open();
            SqlCommand cmd = new SqlCommand("select max(No) from sale ", con);
            object result = cmd.ExecuteScalar();
            if (result != null && result !=DBNull.Value)
            {
                max = Convert.ToInt32(result);
            }
            return max + 1;
        } 
        private bool customer_no(string No)
        {
            SqlConnection con = new SqlConnection(str);
            con.Open();
            SqlCommand cmd = new SqlCommand("select count(Customer_number) from sale where Customer_number=@No",con);
            cmd.Parameters.AddWithValue("@No", No ?? "");
            object result = cmd.ExecuteScalar();
            int customer_no = int.Parse(result.ToString());
            if (customer_no >= 1 && result.ToString() != null && result != DBNull.Value) {

                return false;

            }
            return true;
   

        }
      
    }
}