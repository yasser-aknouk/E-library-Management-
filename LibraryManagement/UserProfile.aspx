<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="LibraryManagement.UserProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">
         <div class="row">
                  <%-- card of User Profile--%>
             <div class=" col-md-5 ">
                 <div class="card">
                      <div class="card-body">
                           <div class="row">
                               <div class="col">
                                   <center>
                                   <img width="100px" src="images/generaluser.png" />
                                   </center>

                               </div>

                           </div>
                           <div class="row">
                               <div class="col">
                                   <center>
                                    <h4> Your Profil</h4>
                             <span> Account Status - </span>
  <asp:Label  CssClass="badge badge-pill badge-success" ID="Label1" runat="server"  Text="Actif"></asp:Label>
                                   </center>

                               </div>

                           </div>
                           <div class="row">
                               <div class="col">
                                  
                                    <hr >
                                   

                               </div>

                           </div>
                          <div class="row">
                               <div class="col-md-6">
                                <label> Full Name</label>
                                   <div class=" form-group ">
                                       <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" Placeholder="Full Name"></asp:TextBox>
                                      
                                   </div>
                               </div>
                              <div class="col-md-6">
                                  <label> Date Of Birth</label>
                                   <div class=" form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" Placeholder="Date Of Birth" TextMode="Date"></asp:TextBox>
                                      
                                   </div>
                               </div>

                           </div>
                           <div class="row">
                               <div class="col-md-6">
                                <label> Contact Number</label>
                                   <div class=" form-group ">
                                       <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" Placeholder=" Contact Number" TextMode="Number"></asp:TextBox>
                                      
                                   </div>
                               </div>
                              <div class="col-md-6">
                                  <label> Email</label>
                                   <div class=" form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" Placeholder="Email" TextMode="Email"></asp:TextBox>
                                      
                                   </div>
                               </div>

                           </div>
                           <div class="row">
                               <div class="col-md-4">
                                <label> State</label>
                                   <div class=" form-group ">
                                       <asp:DropDownList class="form-control" ID="DropDownList1"  runat="server">
                                           <asp:ListItem Text="select state" Value="select state"></asp:ListItem>
                              <asp:ListItem Text="Kenitra" Value="Kenitra" />
                              <asp:ListItem Text=" tanger" Value="tanger" />
                              <asp:ListItem Text="CasaBlanca" Value="CasaBlanca" />
                              <asp:ListItem Text="Rabat" Value="Rabat" />
                              <asp:ListItem Text="Chaouia-Ouardigha" Value="Chaouia-Ouardigha" />
                              <asp:ListItem Text="Doukkala-Abda " Value="Doukkala-Abda " />
                              <asp:ListItem Text="tetouan" Value="tetouan" />
                              <asp:ListItem Text="Marrakech" Value="Marrakech" />
                              <asp:ListItem Text="Meknes" Value="Meknes" />
                              <asp:ListItem Text="Salé" Value="Salé" />
                              <asp:ListItem Text="Media" Value="media" />
                              <asp:ListItem Text="ifrane" Value="ifran" />
                              <asp:ListItem Text="khémisset" Value="khémisset" />
                              <asp:ListItem Text="Béni Mellal" Value="Béni Mellal" />
                              <asp:ListItem Text="El Jadida" Value="El Jadida" />
                              <asp:ListItem Text="Berrechid" Value="Berrechid" />
                              <asp:ListItem Text="Settat" Value="Settat" />
                              <asp:ListItem Text="Safi" Value="Safi" />
                             
                                       </asp:DropDownList>
                                   </div>
                               </div>
                              <div class="col-md-4">
                                  <label> City</label>
                                   <div class=" form-group">
                                       <asp:TextBox Class="form-control" ID="TextBox6" runat="server" Placeholder="City" ></asp:TextBox>
                                      
                                   </div>
                               </div>
                                <div class="col-md-4">
                                  <label> Code Postale</label>
                                   <div class=" form-group">
                                       <asp:TextBox Class="form-control" ID="TextBox7" runat="server" Placeholder=" Code Postale" TextMode="Number"></asp:TextBox>
                                      
                                   </div>
                               </div>
                           </div>
                          
                           <div class="row">
                               <div class="col">
                                <label> Full Adress</label>
                                   <div class=" form-group ">
                                       <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" Placeholder=" Full Adress" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                      <br>
                                   </div>
                               </div>
                             

                           </div>
                            
                           

                          <div class="row">
                               <div class="col-md-4">
                                <label> User Id</label>
                                   <div class=" form-group ">
                                       <asp:TextBox Class="form-control" ID="TextBox8" runat="server" Placeholder="User ID" ReadOnly="True"></asp:TextBox>
                                      
                                   </div>
                               </div>
                              <div class="col-md-4">
                                  <label>  Old PassWord</label>
                                   <div class=" form-group">
                                       <asp:TextBox Class="form-control" ID="TextBox9" runat="server" Placeholder="PassWord" TextMode="Password" ReadOnly="True"></asp:TextBox>
                                      
                                   </div>
                               </div>

                             <div class="col-md-4">
                                  <label> New  PassWord</label>
                                   <div class=" form-group">
                                       <asp:TextBox Class="form-control" ID="TextBox10" runat="server" Placeholder="PassWord" TextMode="Password" ReadOnly="True"></asp:TextBox>
                                      
                                   </div>
                               </div>

                           </div>



                             <div class="row">
                               <div class="col-8 mx-auto">
                                   
                                  <center>
                                    <br><div class="form-group d-grid gap-2">
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Update" /><br>

                                    </div>
                                   </center>
                                 


                               </div>
                           </div>
                           </div>
                        </div>

                 <a href="HomePage.aspx"> << Back To Home</a><br><br>
                 </div>

                 <%-- card of grid view--%>
              <div class="col-md-7">

                   <div class="card">
                      <div class="card-body">
                           <div class="row">
                               <div class="col">
                                   <center>
                                   <img width="100px" src="images/books.png" />
                                   </center>

                               </div>

                           </div>
                           <div class="row">
                               <div class="col">
                                   <center>
                                    <h4> Your Issued Books</h4>
                             <span class="badge badge-pill badge-info">Info</span>
  <asp:Label   ID="Label2" runat="server"  Text="Your Books Info"></asp:Label>
                                   </center>

                               </div>

                           </div>
                           <div class="row">
                               <div class="col">
                                  
                                    <hr >
                                   

                               </div>

                           </div>
                            
                          <div class="row">
                               <div class="col">
                                  
                      <asp:GridView CssClass="table table-striped table-bordered" ID="GridView1" runat="server"></asp:GridView>
                                   

                               </div>

                           </div>
                         
                         
                          
                       
                            
                           

                       



                           
                           </div>
                        </div>

                  </div>




             </div>
         </div>
</asp:Content>
