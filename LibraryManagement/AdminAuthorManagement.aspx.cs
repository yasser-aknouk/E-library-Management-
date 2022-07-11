using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace LibraryManagement
{
    public partial class AdminAuthorManagement : System.Web.UI.Page
    { // Connection
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
         // go button
        protected void Button1_Click(object sender, EventArgs e)
        {

        }
// add buton
        protected void Button2_Click(object sender, EventArgs e)
        {
              if( ChekIfAuthorExists())
            {
                Response.Write("<script>alert('Author whith this Id Exist');</script>");
            }
               else
            {
                AddNewAuthor();
            }
        }
        //  Update buton
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (ChekIfAuthorExists())
            {
                Response.Write("<script>alert('Author invalibal');</script>");
                
            }
            else
            {
                UpdateAuthor();

            }
        }
        // Delete buton
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (ChekIfAuthorExists())
            {
                Response.Write("<script>alert('Author invalibal');</script>");

            }
            else
            {
                DeletAuthor();

            }
        }





        // user defined function

          void UpdateAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(" UPDATE Author SET  author_Name=@author_Name WHERE author_Id='"+TextBox1.Text.Trim()+"' ", con);
              
                cmd.Parameters.AddWithValue("@author_Name", TextBox2.Text.Trim());


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Updated Successfully');</script>");
                ClearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }






        void DeletAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(" Delete From  Author  WHERE author_Id='" + TextBox1.Text.Trim() + "' ", con);




                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Updated Successfully');</script>");
                ClearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void AddNewAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(" INSERT INTO Author( author_Id, author_Name) values(@author_Id,@author_Name)", con);
                cmd.Parameters.AddWithValue("@author_Id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@author_Name", TextBox2.Text.Trim());
                

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Added Successfully');</script>");
                ClearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }







          bool ChekIfAuthorExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(" SELECT * FROM Author WHERE author_Id =' " + TextBox1.Text.Trim() + "' ;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }



          void ClearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
        }



    }
}
   
