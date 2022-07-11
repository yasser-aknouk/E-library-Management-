<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminBookIssuing.aspx.cs" Inherits="LibraryManagement.AdminBookIssuing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         $(document).ready(function () {
             $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
         });


     </script>


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
                                    <h4> Book Issuing</h4>
                            
 
                                   </center>

                               </div>

                           </div>
                          <div class="row">
                           <div class="col">
                                   <center>
                                   <img width="100px" src="images/books.png" />
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
                                  <label> Member Id</label>
                                   <div class=" form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" Placeholder="Member Id" ></asp:TextBox>
                                      
                                   </div>
                               </div>
                                <div class="col-md-6">
                                <label> Book Id</label>
                                   <div class="form-group">
                                            <div class=" input-group ">
                                       <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" Placeholder="Book ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" /><br>
                                                </div>
                                   </div>
                               </div>

                           </div>
                           
                            <div class="row">
                             
                              <div class="col-md-6">
                                  <label> Member Name</label>
                                   <div class=" form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" Placeholder="Member Name" ReadOnly="True"></asp:TextBox>
                                      
                                   </div>
                               </div>
                                 <div class="col-md-6">
                                  <label> Book Name</label>
                                   <div class=" form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" Placeholder="Book Name" ></asp:TextBox>
                                      
                                   </div>
                               </div>
                             

                           </div>



                              <div class="row">
                             
                              <div class="col-md-6">
                                  <label> Start Date</label>
                                   <div class=" form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" Placeholder="Start Date" TextMode="Date"></asp:TextBox>
                                      
                                   </div>
                               </div>
                                 <div class="col-md-6">
                                  <label> End Date</label>
                                   <div class=" form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" Placeholder="End Date" TextMode="Date"></asp:TextBox>
                                      
                                   </div>
                               </div>
                             

                           </div>



                             <div class="row">
                               <div class="col-6"> <br >
                                   
                                   <asp:Button  class="btn btn-lg btn-block btn-primary" ID="Button2" runat="server" Text="Issue" OnClick="Button2_Click" />
                
                               </div>
                           
                                 <div class="col-6"><br >
                                   
                                   <asp:Button  class="btn btn-lg btn-block btn-danger" ID="Button4" runat="server" Text="Return" OnClick="Button4_Click" />
                
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
                              

                           </div>
                           <div class="row">
                               <div class="col">
                                   <center>
                                    <h4> Issued Book List</h4>
                            
 
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
                                  
                      <asp:GridView CssClass="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                          <Columns>
                              <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id" />
                              <asp:BoundField DataField="member_name" HeaderText="Member Name" SortExpression="member_name" />
                              <asp:BoundField DataField="book_id" HeaderText="Book Id" SortExpression="book_id" />
                              <asp:BoundField DataField="book_Name" HeaderText="Book Name" SortExpression="book_Name" />
                              <asp:BoundField DataField="issue_date" HeaderText="Issue Date " SortExpression="issue_date" />
                              <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date" />
                          </Columns>
                                   <EditRowStyle BackColor="#999999" />
                          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                          <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                          <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                          <SortedAscendingCellStyle BackColor="#E9E7E2" />
                          <SortedAscendingHeaderStyle BackColor="#506C8C" />
                          <SortedDescendingCellStyle BackColor="#FFFDF8" />
                          <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                   </asp:GridView>
                                   

                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:E-LibraryConnectionString8 %>" SelectCommand="SELECT * FROM [Book_issue]"></asp:SqlDataSource>
                                   

                               </div>

                           </div>
                         
                         
                          
                       
                            
                           

                       



                           
                           </div>
                        </div>

                  </div>




             </div>
         </div>
</asp:Content>
