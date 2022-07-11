<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="LibraryManagement.AdminLogin" %>
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
                                 <img width="120px" src="images/log%20admin.png" /> 
                                   </center>

                               </div>

                           </div>
                           <div class="row">
                               <div class="col">
                                   <center>
                                    <h3>  Admin Log In</h3>
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
                                   <label> Id Admin</label>
                                   <div class=" form-group ">
                                       <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" Placeholder="ID Admin"></asp:TextBox>
                                      
                                   </div>
                                    <label> PassWord</label>
                                   <div class=" form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" Placeholder="Password" TextMode="Password"></asp:TextBox>
                                      
                                   </div>
                                    <div class="form-group d-grid gap-2">
                                        <asp:Button class="btn btn-outline-primary" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" /><br>

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
