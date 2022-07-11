<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewBook.aspx.cs" Inherits="LibraryManagement.ViewBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <script type="text/javascript">
           $(document).ready(function () {
               $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
           });
       </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


              <div class="container">

        <div class="col-md-10">

                   <div class="card">
                      <div class="card-body">
                           <div class="row">
                              

                           </div>
                           <div class="row">
                               <div class="col">
                                   <center>
                                    <h4>  Book Inventory List</h4>
                            
 
                                   </center>

                               </div>

                           </div>
                         
                          
                            
                          <div class="row">
                                <div class="card">
                      <div class="card-body">
                          
                          
                  
                          
 <div class="row">
                               <div class="col">
                                  
                                    <hr >
                                   

                               </div>

                           </div>                            
                          <div class="row">
                               <div class="col">
                                  
                      <asp:GridView CssClass="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Book_id" DataSourceID="SqlDataSource1" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                          <Columns>
                              <asp:BoundField DataField="Book_id" HeaderText="ID" ReadOnly="True" SortExpression="Book_id" >
                            
                              <ItemStyle Font-Bold="True" />
                              </asp:BoundField>
                            
                              <asp:TemplateField>
                                  <ItemTemplate>
                                      <div class="container-fluid">
                                          <div class="row">
                                              <div class="col-lg-10">
                                                  <div class="row">
                                                        <div class="col-12">
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Book_Name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                            </div>

                                                      </div>
                                                   <div class="row">
                                                        <div class="col-12">

                                                            Author-<asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("author_Name") %>'></asp:Label>
                                                            | Genre-<asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("genre") %>'></asp:Label>
                                                            &nbsp;| Language-<asp:Label ID="Label4" runat="server" Text='<%# Eval("language") %>' Font-Bold="True"></asp:Label>

                                                            </div>

                                                      </div>
                                                   <div class="row">
                                                        <div class="col-12">

                                                            Publisher -
                                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("publisher_name") %>' Font-Bold="True"></asp:Label>
                                                            | Publish Date<asp:Label ID="Label6" runat="server" Text='<%# Eval("publish_date") %>' Font-Bold="True"></asp:Label>
                                                            |Page -
                                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("no_of_page") %>' Font-Bold="True"></asp:Label>
                                                            | Edition -
                                                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("edition") %>' Font-Bold="True"></asp:Label>

                                                            </div>

                                                      </div>
                                                   <div class="row">
                                                        <div class="col-12">

                                                            Cost -
                                                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("book_coste") %>' Font-Bold="True"></asp:Label>
                                                            &nbsp;| Actual Stock -
                                                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("actual_stock") %>' Font-Bold="True"></asp:Label>
                                                            &nbsp;| Avilable -<asp:Label ID="Label11" runat="server" Text='<%# Eval("current_stock") %>' Font-Bold="True"></asp:Label>

                                                            </div>

                                                      </div>
                                                        <div class="row">
                                                        <div class="col-12">

                                                            Description:<asp:Label ID="Label12" runat="server" Text='<%# Eval("book_description") %>' Font-Bold="True" Font-Italic="True"></asp:Label>

                                                            </div>

                                                      </div>
                                               </div>

                                          </div>
                                      </div>
                                  </ItemTemplate>
                              </asp:TemplateField>
                            
                          </Columns>
                          <FooterStyle BackColor="White" ForeColor="#000066" />
                          <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                          <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                          <RowStyle ForeColor="#000066" />
                          <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                          <SortedAscendingCellStyle BackColor="#F1F1F1" />
                          <SortedAscendingHeaderStyle BackColor="#007DBB" />
                          <SortedDescendingCellStyle BackColor="#CAC9C9" />
                          <SortedDescendingHeaderStyle BackColor="#00547E" />
                                   </asp:GridView>
                                   

                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:E-LibraryConnectionString7 %>" SelectCommand="SELECT * FROM [Books]"></asp:SqlDataSource>
                                   

                               </div>

                           </div>
           
                           
                           </div>
                        </div>

                           </div>
                                </div>
                         </div>
                        <a href="HomePage.aspx"> << Back To Home</a><br><br>

                  </div>
                  </div>
</asp:Content>
