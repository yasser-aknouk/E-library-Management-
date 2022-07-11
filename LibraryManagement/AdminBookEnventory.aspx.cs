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
    public partial class AdminBookEnventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static int Global_actual_stock, global_current_stock, global_issed_book;
        protected void Page_Load(object sender, EventArgs e)
        {
            FillAuthorPulisherValues();
            GridView1.DataBind();
        }

      
        //Go Button
        protected void Button4_Click(object sender, EventArgs e)
        {
            GetBookById();
        }
        //add
        protected void Button2_Click(object sender, EventArgs e)
        {
            if(ChekIfBookExists())
            {
                Response.Write("<script>alert('Book Id Exist');</script>");

            }
             else
            {
                AddNewBook();
            }
        }

        void FillAuthorPulisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("  Select author_Name From Author", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList2.DataSource = dt;
                DropDownList2.DataValueField = "author_Name";
                DropDownList2.DataBind();

                cmd = new SqlCommand("  Select Publisher_name From Publisher", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                DropDownListpublicher.DataSource = dt;
                DropDownListpublicher.DataValueField = "Publisher_name";
                DropDownListpublicher.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
         void GetBookById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("  Select * From Books WHERE Book_id = '"+TextBox1.Text.Trim()+"'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                 if(dt.Rows.Count>=1)
                {
                    TextBox2.Text = dt.Rows[0]["Book_Name"].ToString();
                    TextBox3.Text = dt.Rows[0]["publish_date"].ToString();
                    TextBox9.Text = dt.Rows[0]["edition"].ToString();
                    TextBox10.Text = dt.Rows[0]["book_coste"].ToString().Trim();
                    TextBox11.Text = dt.Rows[0]["no_of_page"].ToString().Trim() ;
                    TextBox4.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
                    TextBox5.Text = dt.Rows[0]["current_stock"].ToString().Trim();
                    TextBox6.Text = dt.Rows[0]["book_description"].ToString();
                    TextBox7.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()) - Convert.ToInt32(dt.Rows[0]["current_stock"].ToString()));
                    DropDownList2.SelectedValue = dt.Rows[0]["author_Name"].ToString().Trim();
                    DropDownListpublicher.SelectedValue = dt.Rows[0]["Publisher_name"].ToString().Trim();
                    DropDownList3.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
                    ListBox1.ClearSelection();
                    string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
                     for( int i=0 ; i <genre.Length; i++)
                    {
                        for( int j=0; j < ListBox1.Items.Count; j++)
                        {
                            if(ListBox1.Items[j].ToString() == genre[i])
                            {
                                ListBox1.Items[j].Selected = true;
                            }
                        }
                    }
                   Global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                    global_current_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
                    global_issed_book = Global_actual_stock - global_current_stock;
                }
                 else
                {
                    Response.Write("<script>alert('Invalid Book Id');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        //UpDATE BUTTON
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (ChekIfBookExists())
            {
               Response.Write("<script>alert('Invalid Book Id');</script>");
            }
            else { UpdateBookById();  }
               
        }
        //DELETE BUTTON
        protected void Button3_Click(object sender, EventArgs e)
        {
            DeleteBookById();
        }


        void DeleteBookById()
        {
            if (TextBox1.Text.Trim().Equals(""))
            {
                Response.Write("<script>alert(' Book Id is Blank');</script>");
            }
            else
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from Books WHERE Book_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Book  Deleted Successfully');</script>");

                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }

        void UpdateBookById()
        {
            
            try
                {
                    int actual_stock = Convert.ToInt32(TextBox4.Text.Trim());
                    int current_stock = Convert.ToInt32(TextBox5.Text.Trim());
                    if(Global_actual_stock == actual_stock)
                    { }
                    else
                    {
                        if(actual_stock<global_issed_book)
                        {
                            Response.Write("<script>alert('Actual Book Value Cannot Be less Than The Issied bOOKS');</script>");
                            return;
                        }
                        else
                        {
                            current_stock = actual_stock - global_issed_book;
                            TextBox5.Text = "" + current_stock;
                        }
                    }


                    string genre = "";
                    foreach (int i in ListBox1.GetSelectedIndices())
                    {
                        genre = genre + ListBox1.Items[i] + ",";
                    }
                    genre = genre.Remove(genre.Length - 1);



                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand(" UPDATE Books SET Book_id= @Book_id,Book_Name=@Book_Name,genre=@genre,author_Name=@author_Name,publisher_name=@publisher_name,publish_date=@publish_date,language=@language,edition=@edition,book_coste=@book_coste,no_of_page=@no_of_page,book_description=@book_description,actual_stock=@actual_stock,current_stock=@current_stock  WHERE  Book_id = '" + TextBox1.Text.Trim() + "'", con);

                cmd.Parameters.AddWithValue("@Book_id", TextBox1.Text.Trim());
                 cmd.Parameters.AddWithValue("@Book_Name", TextBox2.Text.Trim());
                  cmd.Parameters.AddWithValue("@genre", genre);
                    cmd.Parameters.AddWithValue("@language", DropDownList3.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publisher_name", DropDownListpublicher.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@author_Name", DropDownList2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publish_date", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@edition", TextBox9.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_coste", TextBox10.Text.Trim());
                    cmd.Parameters.AddWithValue("@no_of_page", TextBox11.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_description", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_stock", actual_stock.ToString());
                    cmd.Parameters.AddWithValue("@current_stock", current_stock.ToString());
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


            bool ChekIfBookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(" SELECT * FROM Books WHERE Book_id =' " + TextBox1.Text.Trim() + "' OR Book_Name =' " + TextBox2.Text.Trim() + "' ;", con);
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
        void AddNewBook()
        {
          try
            {

                string genre = "";
                foreach (int i in ListBox1.GetSelectedIndices())
                {
                    genre = genre + ListBox1.Items[i] + ",";
                }
                genre = genre.Remove(genre.Length - 1);


                SqlConnection con = new SqlConnection(strcon);
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO  Books (Book_id,Book_Name,genre,author_Name,publisher_name,publish_date,language,edition,book_coste,no_of_page,book_description,actual_stock,current_stock ) values (@Book_id,@Book_Name,@genre,@author_Name,@publisher_name,@publish_date,@language,@edition,@book_coste,@no_of_page,@book_description,@actual_stock,@current_stock )", con);
                cmd.Parameters.AddWithValue("@Book_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Book_Name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genre);
                cmd.Parameters.AddWithValue("@language", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", DropDownListpublicher.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@author_Name", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@edition", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@book_coste", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_page", TextBox11.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", TextBox5.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book Added Sucesfully');</script>");
                GridView1.DataBind();
            }
             catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
      
    }
    }