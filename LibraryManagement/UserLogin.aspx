<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="LibraryManagement.UserLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
      <div class="container">
         <div class="row">
             <div class=" col-md-6 mx-auto">
                 <div class="card">
                      <div class="card-body">
                           <div class="row">
                               <div class="col">
                                   <center>
                                     <img width="120px" src="images/login.png" />
                                   </center>

                               </div>

                           </div>
                           <div class="row">
                               <div class="col">
                                   <center>
                                    <h3> Log In</h3>
                                   </center>

                               </div>

                           </div>
                           <div class="row">
                               <div class="col">
                                   <center>
                                    <hr >
                                   </center>

                               </div>

                           </div>
                             <div class="row">
                               <div class="col">
                                   <label> Id member</label>
                                   <div class=" form-group ">
                                       <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" Placeholder="ID Member"></asp:TextBox>
                                      
                                   </div>
                                    <label> PassWord</label>
                                   <div class=" form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" Placeholder="Password" TextMode="Password"></asp:TextBox>
                                      
                                   </div>
                                    <div class="form-group d-grid gap-2">
                                        <asp:Button class="btn btn-outline-primary" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" /><br>

                                    </div>
                                  
                                   <div class="form-group d-grid gap-2">
                                       
                                  <a href="UserSignUp.aspx">
                                       <input id="Button"  class=" btn btn-success btn-block" type="button" value="Sign Up" />

                                  </a>
                                    </div>


                               </div>
                           </div>
                           </div>
                        </div>

                 <a href="HomePage.aspx"> << Back To Home</a><br><br>
                 </div>

             </div>

         </div>

     




</asp:Content>
     