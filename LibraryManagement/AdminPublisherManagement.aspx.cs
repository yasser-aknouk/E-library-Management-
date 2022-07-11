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
    public partial class AdminPublisherManagement : System.Web.UI.Page
    {


        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();

        }
        // Go
        protected void Button1_Click(object sender, EventArgs e)
        {

        }
        //Add
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (ChekIfAuthorExists())
            {
                Response.Write("<script>alert('publisher whith this Id Exist');</script>");
            }
            else
            {
                AddNewPublisher();
            }
        }
        //Update
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (ChekIfAuthorExists())
            {
                Response.Write("<script>alert('publisher invalibal');</script>");

            }
            else
            {
                UpdatePub();

            }
        }
        //delete
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (ChekIfAuthorExists())
            {
                Response.Write("<script>alert('Publisher invalibal');</script>");

            }
            else
            {
               DeletPublisher();

            }
        }


        void DeletPublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(" Delete From  Publisher  WHERE publisher_id='" + TextBox1.Text.Trim() + "' ", con);




                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher Updated Successfully');</script>");
                ClearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void AddNewPublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(" INSERT INTO Publisher( publisher_id, publisher_name) values(@publisher_id,@publisher_name)", con);
                cmd.Parameters.AddWithValue("@publisher_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@publisher_name", TextBox2.Text.Trim());


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher Added Successfully');</script>");
                ClearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

         void UpdatePub()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(" UPDATE Publisher SET  publisher_name=@publisher_name WHERE publisher_id='" + TextBox1.Text.Trim() + "' ", con);

                cmd.Parameters.AddWithValue("@publisher_name", TextBox2.Text.Trim());


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher Updated Successfully');</script>");
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
                SqlCommand cmd = new SqlCommand(" SELECT * FROM Publisher WHERE publisher_id =' " + TextBox1.Text.Trim() + "' ;", con);
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