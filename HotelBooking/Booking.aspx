<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="Hotel.Booking" %>

<%@ Register Src="~/User Control/UC1.ascx" TagPrefix="uc1" TagName="UC1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Stylesheet/StyleSheet3.css" rel="stylesheet" />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UC1 runat="server" ID="UC1" />
    <br />
    <h2 class="text" style="color:azure">ROOM BOOKING</h2>
    <p>
        ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</p>
    <p class="center3" style="color:azure">
                <b>
                    Sales id:
                <asp:Label ID="lblSalesId" runat="server" ></asp:Label>&nbsp;|
                Date and time:
                <asp:Label ID="lblDateTime" runat="server" ></asp:Label>
                </b>
                
            </p>
    <div class="paragraph" style="color:azure">
     <b>Select Room Category:</b>&nbsp;
     <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="SqlDataSourceCategories" DataTextField="CatTitle" DataValueField="CatId" 
         OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="True" Height="50px"></asp:DropDownList>
       
     <br />
    </div>
    <div class="table">
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ItemId" DataSourceID="SqlDataSourceItems" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="CatId" HeaderText="Room Category ID" SortExpression="CatId" />
                <asp:BoundField DataField="ItemTitle" HeaderText="Room Type" SortExpression="ItemTitle" />
                <asp:BoundField DataField="ItemPrice" HeaderText="Price ($)" SortExpression="ItemPrice" />
                <asp:BoundField DataField="ItemDesc" HeaderText="Room Description" SortExpression="ItemDesc" />
                <asp:ImageField DataImageUrlField="ItemImage" DataImageUrlFormatString="Images/{0}" HeaderText="Room Picture ">
                    <ControlStyle Height="200px" Width="350px" />
                </asp:ImageField>
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
        
    </div>
    
     <p class="center3" style="color:azure">
         <b>
             Item id:
                <asp:Label ID="lblItemId" runat="server"></asp:Label>&nbsp;|
                Item title:
                <asp:Label ID="lblItemTitle" runat="server" Text=""></asp:Label>&nbsp;|
                Item price:
                <asp:Label ID="lblItemPrice" runat="server" ></asp:Label>
         </b>
                
            </p>
          <div class="nm"><b>
              <label>Name:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          </b>
                      <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </div>
    <div class="nm">
        <b>
            <label>Check In:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </b>
            
            <asp:TextBox ID="txtCheckin" runat="server" TextMode="Date"></asp:TextBox>
    </div>
    <div class="nm">
        <b>
                    <label>Check Out: </label>&nbsp;
        </b>
            <asp:TextBox ID="txtCheckOut" runat="server" TextMode="Date" Width="163px"></asp:TextBox>
    </div>
            
         
        

            <p class="center3" style="color:azure">
                <b>No. of Rooms:</b>
                <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" Width="125px" Font-Bold>1</asp:TextBox>&nbsp;
                <asp:Button ID="btnAddItem" runat="server" Text="Add to cart" OnClick="btnAddItem_Click" Font-Bold BackColor="White" />
                
            </p>
            <p class="center3" style="color:azure">
                <b><asp:Label ID="lblMessage1" runat="server" BackColor="White" ></asp:Label></b>
                
            </p>
             <h4 class="center3" style="color:azure">Sales Cart</h4>
            
    <br/>
    <div class="table2" style="color:azure">
        <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSourceCart" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                 <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                 <Columns>
                     <asp:BoundField DataField="ItemId" HeaderText="Room Category ID" SortExpression="ItemId" />
                     <asp:BoundField DataField="ItemTitle" HeaderText="Room Type" SortExpression="ItemTitle" />
                     <asp:BoundField DataField="ItemPrice" HeaderText="Price ($)" SortExpression="ItemPrice" />
                     <asp:BoundField DataField="Quantity" HeaderText="No. of Rooms" SortExpression="Quantity" />
                     <asp:BoundField DataField="SubTotal" HeaderText="SubTotal" ReadOnly="True" SortExpression="SubTotal" />
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
    </div>
            <p class="center3" style="color:azure">
                <B>Total amount:</B>
                <asp:Label ID="lblTotalAmountCart" runat="server" Text="$0.00"></asp:Label><br/>
                <asp:Button ID="btnConfirm" runat="server" Text="Confirm Booking" OnClick="btnConfirm_Click" BackColor="white" Font-Bold />&nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel Booking" OnClick="btnCancel_Click" BackColor="white" Font-Bold />&nbsp;
                <asp:Button ID="btnNew" runat="server" Text="New Booking" OnClick="btnNew_Click" style="height: 29px" BackColor="white" Font-Bold />
            </p>
            <p class="center3" style="color:azure">
                <b><asp:Label ID="lblMessage2" runat="server" ></asp:Label></b>
                
            </p>
            <p class="center3" style="color:black">
                <b>
                <asp:Label ID="lblName" runat="server" ></asp:Label><br />
                <asp:Label ID="lblDate1" runat="server" ></asp:Label><br />
                <asp:Label ID="lblDate2" runat="server" ></asp:Label><br />
                <asp:Label ID="lblTotalAmount" runat="server" ></asp:Label><br />
                <asp:Label ID="lblServiceTax" runat="server" ></asp:Label><br />
                <asp:Label ID="lblAmountAfterTax" runat="server" ></asp:Label><br />
                <asp:Label ID="lblRounding" runat="server" ></asp:Label><br />
                <asp:Label ID="lblAmountRounded" runat="server" ></asp:Label><br /> </b>
                
            </p>
    <asp:SqlDataSource ID="SqlDataSourceCategories" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Categories] ORDER BY [CatTitle]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceItems" runat="server"  ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE ([CatId] = @CatId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlCategory" Name="CatId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCart" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spSalesGetItems" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblSalesId" Name="salesid" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>
