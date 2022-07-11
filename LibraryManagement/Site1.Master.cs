using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagement
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try {
                if (Session["role"].Equals(""))
                 {
                    linkButton1.Visible = true; // user login link button
                    linkButton2.Visible = true;  // Sign Up link button

                    linkButton3.Visible = false;   // Logout link button
                    linkButton5.Visible = false;   //  Helo user link button
                    
                    linkButton6.Visible = true;   //  admin link button
                    linkButton7.Visible = false;   //  author managemnet  link button
                    linkButton8.Visible = false;   //  publisher management  link button
                    linkButton9.Visible = false;   //  book eneventory  link button
                    linkButton10.Visible = false;   //  book issuing  link button
                    linkButton11.Visible = false;   //  member management  link button
                 }
              else if(Session["role"].Equals("user"))
                {
                    linkButton1.Visible = false; // user login link button
                    linkButton2.Visible = false;  // Sign Up link button

                    linkButton3.Visible = true;   // Logout link button
                    linkButton5.Visible = true;   //  Helo user link button
                    linkButton5.Text =" Hello" +Session["username"].ToString();


                    linkButton6.Visible = true;   //  admin link button
                    linkButton7.Visible = false;   //  author managemnet  link button
                    linkButton8.Visible = false;   //  publisher management  link button
                    linkButton9.Visible = false;   //  book eneventory  link button
                    linkButton10.Visible = false;   //  book issuing  link button
                }
                else if (Session["role"].Equals("admin"))
                {
                    linkButton1.Visible = false; // user login link button
                    linkButton2.Visible = false;  // Sign Up link button

                    linkButton3.Visible = true;   // Logout link button
                    linkButton5.Visible = true;   //  Helo user link button
                    linkButton5.Text = " Hello admin" ;


                    linkButton6.Visible = false;   //  admin link button
                    linkButton7.Visible = true;   //  author managemnet  link button
                    linkButton8.Visible = true;   //  publisher management  link button
                    linkButton9.Visible = true;   //  book eneventory  link button
                    linkButton10.Visible = true;
                    linkButton11.Visible = true;  //  book issuing  link button
                }
            }
            catch(Exception ex) { }
        }
        // logout button
        protected void linkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewBook.aspx");
        }
        // admin login button
        protected void linkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }
        // author button
        protected void linkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminAuthorManagement.aspx");
        }
        // admin publidher management button
        protected void linkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPublisherManagement.aspx");
        }
        // admin book inventory button
        protected void linkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminBookEnventory.aspx");
        }
        // admin book isssuing button
        protected void linkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminBookIssuing.aspx");
        }
        // admin management button
        protected void linkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminMemeberManagement.aspx");
        }
        // userLogin button
        protected void linkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
        }
        //  sign up button
        protected void linkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserSignUp.aspx");
        }
        // logout button
        protected void linkButton3_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            linkButton1.Visible = true; // user login link button
            linkButton2.Visible = true;  // Sign Up link button

            linkButton3.Visible = false;   // Logout link button
            linkButton5.Visible = false;   //  Helo user link button

            linkButton6.Visible = true;   //  admin link button
            linkButton7.Visible = false;   //  author managemnet  link button
            linkButton8.Visible = false;   //  publisher management  link button
            linkButton9.Visible = false;   //  book eneventory  link button
            linkButton10.Visible = false;   //  book issuing  link button
            linkButton11.Visible = false;   //  member management  link button
        }

        protected void linkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserProfile.aspx");
        }
    }
}