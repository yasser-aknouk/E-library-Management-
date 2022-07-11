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
    public partial class AdminBookIssuing : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
         //Go Button
        protected void Button1_Click(object sender, EventArgs e)
        {
            GetBookAndMmeber();
        }
        // Issue 
        protected void Button2_Click(object sender, EventArgs e)
        {
            if(ChekIfBookExists() && ChekfIMemeberExists())
            {
                  if(ChekfIIsuueEntryExists())
                {
                    Response.Write("<script>alert ('Ce Membre A Ce Book')</script>");
                }
                else 
                {
                    IssueBook(); 
                }
                
            }
            else
            {
                Response.Write("<script>alert ('Ereur Book Id ou Mmeber Id')</script>");
            }
        }
        // Return
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (ChekIfBookExists() && ChekfIMemeberExists())
            {
                if (ChekfIIsuueEntryExists())
                {
                    ReturnBook();
                }
                else
                {
                    Response.Write("<script>alert ('This Entry Doesnt Existe ')</script>");
                }

            }
            else
            {
                Response.Write("<script>alert ('Ereur Book Id ou Mmeber Id')</script>");
            }
        }

        // Functions
         void ReturnBook()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("DELETE FROM Book_issue WHERE Book_id = '" + TextBox1.Text.Trim() + "' AND  member_id = '" + TextBox2.Text.Trim() + "'", con);
            int result = cmd.ExecuteNonQuery();
           
             if(result > 0)
            {
                cmd = new SqlCommand("UPDATE Books SET current_stock = current_stock + 1 WHERE book_id ='" + TextBox1.Text.Trim() + "' ", con);
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Book Returned Successfully');</script>");
                GridView1.DataBind();
                 con.Close();
            }
            else
            {
                Response.Write("<script>alert('Ereur');</script>");

            }

        }





        void IssueBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(" INSERT INTO Book_issue( member_id, member_name,book_id,book_Name,issue_date,due_date) values( @member_id, @member_name,@book_id,@book_Name,@issue_date,@due_date)", con);
                cmd.Parameters.AddWithValue("@member_id", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@member_name", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@book_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@book_Name", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@issue_date", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@due_date", TextBox6.Text.Trim());
               
                
             cmd.ExecuteNonQuery();
                cmd = new SqlCommand("UPDATE Books SET current_stock = current_stock - 1 WHERE book_id ='" + TextBox1.Text.Trim()+"' ", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book Issued Successfully');</script>");

                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }



        bool ChekfIMemeberExists()
        {
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(" SELECT full_name FROM Member WHERE member_id = '" + TextBox2.Text.Trim()+"'  ", con);
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
            { return false; }
        }

        bool ChekfIIsuueEntryExists()
        {
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(" SELECT * FROM Book_issue WHERE member_id = '" + TextBox2.Text.Trim() + "' AND  Book_id = '" + TextBox1.Text.Trim() + "' ", con);
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
            { return false; }
        }


        bool ChekIfBookExists()
        {
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(" SELECT * FROM Books WHERE  Book_id = '" + TextBox1.Text.Trim() + "' ", con);
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
            catch(Exception ex)
            { return false;} 
        }





          void GetBookAndMmeber()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(" SELECT Book_Name FROM Books WHERE Book_id = '" + TextBox1.Text.Trim() + "' " ,con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count >= 1)
                {
                    TextBox4.Text = dt.Rows[0]["Book_Name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert ('Ereur Book Id')</script>");
                }

               
               
              cmd = new SqlCommand(" SELECT full_name FROM Member WHERE member_id = '" + TextBox2.Text.Trim() + "' ", con);
                 da = new SqlDataAdapter(cmd);
                 dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox3.Text = dt.Rows[0]["full_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert ('Ereur User Id')</script>");
                }
            }
            catch(Exception ex)
            {

            }
        }
    }
}