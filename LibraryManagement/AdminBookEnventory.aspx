<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminBookEnventory.aspx.cs" Inherits="LibraryManagement.AdminBookEnventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         $(document).ready(function () {
             $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
         });

         function readURL(input) {
             if (input.files && input.files[0]) {
                 var reader = new FileReader();

                 reader.onload = function (e) {
                     $('#imgview').attr('src', e.target.result);
                 };

                 reader.readAsDataURL(input.files[0]);
             }
         }

     </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
         <div class="row">
                  <%-- card of User Profile--%>
             <div class=" col-md-7 ">
                 <div class="card">
                      <div class="card-body">
                           
                           <div class="row">
                               <div class="col">
                                   <center>
                                    <h4> Books Details</h4>
                            
 
                                   </center>

                               </div>

                           </div>
                          <div class="row">
                           <div class="col">
                                   <center>
                                    <img id="imgview" height="150px" width="100px" src="BookEnventory/books1.png"/>
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
                                  
                                   <asp:FileUpload  class="form-control" ID="FileUpload1" runat="server" />
                         
                               </div>

                           </div>
                          <div class="row">
                             
                                <div class="col-md-4">
                                <label> Book Id</label>
                                   <div class="form-group">
                                            <div class=" input-group ">
                                       <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" Placeholder="Book ID"></asp:TextBox>
                                                <asp:Button CssClass="form-control btn btn-primary" ID="Button4" runat="server" Text="GO" OnClick="Button4_Click" />
                                                </div>
                                   </div>
                               </div>
                              <div class="col-md-8">
                                  <label> Book Name</label>
                                   <div class=" form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" Placeholder="Book Name " ></asp:TextBox>
                                      
                                   </div>
                               </div>   
                              

                           </div>
                           
                            <div class="row">
                                <div class="col-md-4">
                                  <label> Language</label>
                                   <div class=" form-group">
                                         <asp:DropDownList  class="form-control" ID="DropDownList3" runat="server">
                                           <asp:ListItem Text="english " Value="english"/>
                                           <asp:ListItem Text="francais " Value="francais"/>
                                           <asp:ListItem Text="arab " Value="arab"/>
                                          
                                       </asp:DropDownList>
                                      
                                   </div>
                                     <label> Publisher Name</label>
                                   <div class=" form-group">
                                         <asp:DropDownList  class="form-control" ID="DropDownListpublicher" runat="server">
                                           <asp:ListItem Text="Publisher 1 " Value="Publisher 1"/>
                                           <asp:ListItem Text="Publishr 2 " Value="Publisher 2"/>
                                           
                                          
                                       </asp:DropDownList>
                                      
                                   </div>
                               </div>  
                               <div class="col-md-4">
                                  <label>  Nom Auteur</label>
                                   <div class=" form-group">
                                         <asp:DropDownList  class="form-control" ID="DropDownList2" runat="server">
                                           <asp:ListItem Text="Auteur 1 " Value="Auteur 1"/>
                                           <asp:ListItem Text="Auteur 2 " Value="Auteur 2"/>
                                           <asp:ListItem Text="Auteur 3 " Value="Auteur 3"/>
                                          
                                       </asp:DropDownList>
                                      
                                   </div>
                                     <label> Publisher Date</label>
                                   <div class=" form-group">
                                       <asp:TextBox  CssClass="form-control" ID="TextBox3" runat="server" TextMode="Date"></asp:TextBox>
                                           
                                          
                                     
                                      
                                   </div>
                               </div>
                                 <div class="col-md-4">
                                  <label> Genre</label>
                                   <div class=" form-group">
                                       <asp:ListBox class=" form-group" ID="ListBox1" runat="server" Rows="5" SelectionMode="Multiple">
                                <asp:ListItem Text="Action" Value="Action" />
                              <asp:ListItem Text="Adventure" Value="Adventure" />
                              <asp:ListItem Text="Comic Book" Value="Comic Book" />
                              <asp:ListItem Text="Self Help" Value="Self Help" />
                              <asp:ListItem Text="Motivation" Value="Motivation" />
                              <asp:ListItem Text="Healthy Living" Value="Healthy Living" />
                              <asp:ListItem Text="Wellness" Value="Wellness" />
                              <asp:ListItem Text="Crime" Value="Crime" />
                              <asp:ListItem Text="Drama" Value="Drama" />
                              <asp:ListItem Text="Fantasy" Value="Fantasy" />
                              <asp:ListItem Text="Horror" Value="Horror" />
                              <asp:ListItem Text="Poetry" Value="Poetry" />
                              <asp:ListItem Text="Personal Development" Value="Personal Development" />
                              <asp:ListItem Text="Romance" Value="Romance" />
                              <asp:ListItem Text="Science Fiction" Value="Science Fiction" />
                              <asp:ListItem Text="Suspense" Value="Suspense" />
                              <asp:ListItem Text="Thriller" Value="Thriller" />
                              <asp:ListItem Text="Art" Value="Art" />
                              <asp:ListItem Text="Autobiography" Value="Autobiography" />
                              <asp:ListItem Text="Encyclopedia" Value="Encyclopedia" />
                              <asp:ListItem Text="Health" Value="Health" />
                              <asp:ListItem Text="History" Value="History" />
                              <asp:ListItem Text="Math" Value="Math" />
                              <asp:ListItem Text="Textbook" Value="Textbook" />
                              <asp:ListItem Text="Science" Value="Science" />
                              <asp:ListItem Text="Travel" Value="Travel" />
                                       </asp:ListBox>
                                   </div>
                               </div>
                             

                           </div>

                           <div class="row">
                                <div class="col-md-4">
                                  <label> Editon</label>
                                   <div class=" form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" Placeholder="Editon " ></asp:TextBox>
                                      
                                   </div>
                               </div>  
                              <div class="col-md-4">
                                  <label>Book Cost</label>
                                   <div class=" form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" Placeholder="Book Cost" TextMode="Number"></asp:TextBox>
                                      
                                   </div>
                               </div>
                                 <div class="col-md-4">
                                  <label> Pages</label>
                                   <div class=" form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" Placeholder="Pages" TextMode="Number"></asp:TextBox>
                                      
                                   </div>
                               </div>
                             

                           </div>

                            <div class="row">
                                <div class="col-md-4">
                                  <label> Actual Stock</label>
                                   <div class=" form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" Placeholder="Actual Stock " TextMode="Number"></asp:TextBox>
                                      
                                   </div>
                               </div>  
                              <div class="col-md-4">
                                  <label>Current Stock</label>
                                   <div class=" form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" Placeholder="Book Cost" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                      
                                   </div>
                               </div>
                                 <div class="col-md-4">
                                  <label> Issued Books</label>
                                   <div class=" form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" Placeholder="Pages" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                      
                                   </div>
                               </div>
                             

                           </div>

                              <div class="row">
                             
                            
                                 <div class="col-md-12">
                                  <label> Book Description</label>
                                   <div class=" form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" Placeholder="Book Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                      
                                   </div>
                               </div>
                             

                           </div>



                             <div class="row">
                               <div class="col-4"> 
                                   
                                   <asp:Button  class="btn btn-lg btn-block btn-success" ID="Button2" runat="server" Text="Addddd" OnClick="Button2_Click" />
                
                               </div>
                                 <div class="col-4"> 
                                   
                                   <asp:Button  class="btn btn-lg btn-block btn-danger" ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" />
                
                               </div>
                                 <div class="col-4"> 
                                   
                                   <asp:Button  class="btn btn-lg btn-block btn-primary" ID="Button3" runat="server" Text="Delete" OnClick="Button3_Click" />
                
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
                                    <h4> Book Inventory List</h4>
                            
 
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

</asp:Content>
