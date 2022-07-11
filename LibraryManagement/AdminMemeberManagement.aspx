<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminMemeberManagement.aspx.cs" Inherits="LibraryManagement.AdminMemeberManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
       $(document).ready(function () {
           $('.table').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
       });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
         <div class="row">
                  <%-- card of User Profile--%>
             <div class=" col-md-6 ">
                 <div class="card">
                      <div class="card-body">
                           
                           <div class="row">
                               <div class="col">
                                   <center>
                                    <h4> Member Details</h4>
                            
 
                                   </center>

                               </div>

                           </div>
                          <div class="row">
                           <div class="col">
                                   <center>
                                   <img width="100px" src="images/admin.png" />
                                   </center>

                               </div>
                              </div>

                           <div class="row">
                               <div class="col">
                                  
                                    <hr >
                         
                               </div>

                           </div>
                          <div class="row">
                             
                                <div class="col-md-3">
                                <label> Member Id</label>
                                   <div class="form-group">
                                            <div class=" input-group ">
                                       <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" Placeholder="Member ID"></asp:TextBox>
                                       <asp:LinkButton class="btn btn-success" ID="LinkButton4" runat="server" OnClick="LinkButton4_Click" style="width: 6px" ><i class="fas fa-check-circle"></i></asp:LinkButton>
                                                </div>
                                   </div>
                               </div>
                              <div class="col-md-4">
                                  <label> Full Name</label>
                                   <div class=" form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" Placeholder="Full Name " ></asp:TextBox>
                                      
                                   </div>
                               </div>   
                              <div class="col-md-5">
                                  <label> Account Status</label>
                                   <div class=" form-group">
                                      <div class=" input-group ">
                                       <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeHolder="acount status" ReadOnly="True"></asp:TextBox>
                                         
                                          <asp:LinkButton class="btn btn-success" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" ><i class="fas fa-check-circle"></i></asp:LinkButton>
                                             <asp:LinkButton class="btn btn-warning" ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" ><i class="far fa-pause-circle"></i></asp:LinkButton>
                                            <asp:LinkButton class="btn btn-danger" ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" ><i class="fas fa-times-circle"></i></asp:LinkButton>
                                                </div>
                                       
                                   </div>
                               </div>
                              

                           </div>
                           
                            <div class="row">
                                <div class="col-md-3">
                                  <label> Dob</label>
                                   <div class=" form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" Placeholder="Dob " ReadOnly="True"></asp:TextBox>
                                      
                                   </div>
                               </div>  
                              <div class="col-md-4">
                                  <label>contact number</label>
                                   <div class=" form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" Placeholder="contact number" ReadOnly="True"></asp:TextBox>
                                      
                                   </div>
                               </div>
                                 <div class="col-md-5">
                                  <label> Email Id</label>
                                   <div class=" form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" Placeholder="Email Id" ReadOnly="True" TextMode="Email"></asp:TextBox>
                                      
                                   </div>
                               </div>
                             

                           </div>

                           <div class="row">
                                <div class="col-md-4">
                                  <label> state</label>
                                   <div class=" form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" Placeholder="state " ReadOnly="True"></asp:TextBox>
                                      
                                   </div>
                               </div>  
                              <div class="col-md-4">
                                  <label>City</label>
                                   <div class=" form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" Placeholder="City" ReadOnly="True"></asp:TextBox>
                                      
                                   </div>
                               </div>
                                 <div class="col-md-4">
                                  <label> Code Postal</label>
                                   <div class=" form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" Placeholder="Code Postal" ReadOnly="True" TextMode="Number"></asp:TextBox>
                                      
                                   </div>
                               </div>
                             

                           </div>



                              <div class="row">
                             
                            
                                 <div class="col-md-12">
                                  <label> Full Adress</label>
                                   <div class=" form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" Placeholder="Full Adress" TextMode="MultiLine" Rows="2" ReadOnly="True"></asp:TextBox>
                                      
                                   </div>
                               </div>
                             

                           </div>



                             <div class="row">
                               <div class="col-8 mx-auto"> <br >
                                   
                                   <asp:Button  class="btn btn-lg btn-block btn-danger" ID="Button2" runat="server" Text="Delete User Permanently" OnClick="Button2_Click" />
                
                               </div>
                           
                              
                           </div>
                           </div>
                        </div>

                 <a href="HomePage.aspx"> << Back To Home</a><br><br>
                 </div>

                 <%-- card of grid view--%>
              <div class="col-md-6">

                   <div class="card">
                      <div class="card-body">
                           <div class="row">
                              

                           </div>
                           <div class="row">
                               <div class="col">
                                   <center>
                                    <h4> Member List</h4>
                            
 
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
                                  
                      <asp:GridView CssClass="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                          <Columns>
                              <asp:BoundField DataField="member_id" HeaderText="ID" ReadOnly="True" SortExpression="member_id" />
                              <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                              <asp:BoundField DataField="account_status" HeaderText="Account Status" SortExpression="account_status" />
                              <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                              <asp:BoundField DataField="contact_number" HeaderText="Contact Number" SortExpression="contact_number" />
                              <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                              <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                          </Columns>
                                   </asp:GridView>
                                   

                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:E-LibraryConnectionString5 %>" SelectCommand="SELECT * FROM [Member]"></asp:SqlDataSource>
                                   

                               </div>

                           </div>
           
                           
                           </div>
                        </div>

                  </div>

             </div>
         </div>
</asp:Content>
