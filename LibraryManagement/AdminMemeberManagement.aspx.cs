using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagement
{
    public partial class AdminMemeberManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
         // Go Button
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            GetMemberById();
        }
         // Active Button
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            UpdateMemeberById(" active" );
        }
        // Pending Button
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            UpdateMemeberById("Pending");
        }
        // Desactive Button
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            UpdateMemeberById("Desactive");
        }
        // Delete Button
        protected void Button2_Click(object sender, EventArgs e)
        {
            DeleteMemeberByID();
        }


        //user defined Function
        void GetMemberById()
            {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                    SqlCommand cmd = new SqlCommand(" SELECT * FROM Member WHERE member_id = '"+TextBox1.Text.Trim()+"'",con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if(dr.HasRows)
                    {
                        while ( dr.Read())
                        {
                            TextBox2.Text = dr.GetValue(0).ToString();

                            TextBox7.Text = dr.GetValue(10).ToString();
                            TextBox8.Text = dr.GetValue(1).ToString();
                            TextBox3.Text = dr.GetValue(2).ToString();
                            TextBox4.Text = dr.GetValue(3).ToString();
                            TextBox9.Text = dr.GetValue(4).ToString();
                            TextBox10.Text = dr.GetValue(5).ToString();
                            TextBox11.Text = dr.GetValue(6).ToString();
                            TextBox6.Text = dr.GetValue(7).ToString();
                          
                        }
                    }
                
                else
                {
                    Response.Write("<script>alert('Invalid');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('"+ex.Message +"');</script>");

            }

        }
        void DeleteMemeberByID()
        {
              if(TextBox1.Text.Trim().Equals(""))
            {
                Response.Write("<script>alert('Member Is Blank');</script>");
            }
            else { 
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from Member WHERE member_id='" + TextBox1.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Mmeber Deleted Successfully');</script>");
                clearForm();
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
           }
        }

        void UpdateMemeberById(String status)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(" UPDATE Member SET  account_status = '"+
                    status +"' WHERE  member_id = '" + TextBox1.Text.Trim() + "'", con);
               
                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();

                Response.Write("<script>alert('updated succesfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }


          
        }
          void clearForm()
        {
            TextBox2.Text = "";
            TextBox2.Text = "";

            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "";
            TextBox11.Text = "";
            TextBox6.Text = "";

        }


    }
}