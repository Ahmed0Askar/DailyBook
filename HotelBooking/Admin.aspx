<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Hotel.Admin" %>

<%@ Register Src="~/User Control/UC1.ascx" TagPrefix="uc1" TagName="UC1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Stylesheet/StyleSheet1.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <uc1:UC1 runat="server" ID="UC1" />
    <h2>Admin Page</h2>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [UserAccounts] WHERE [Id] = @Id" InsertCommand="INSERT INTO [UserAccounts] ([UserName], [PasswordHash], [Role], [Enabled]) VALUES (@UserName, @PasswordHash, @Role, @Enabled)" SelectCommand="SELECT * FROM [UserAccounts]" UpdateCommand="UPDATE [UserAccounts] SET [UserName] = @UserName, [PasswordHash] = @PasswordHash, [Role] = @Role, [Enabled] = @Enabled WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="PasswordHash" Type="String" />
            <asp:Parameter Name="Role" Type="String" />
            <asp:Parameter Name="Enabled" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="PasswordHash" Type="String" />
            <asp:Parameter Name="Role" Type="String" />
            <asp:Parameter Name="Enabled" Type="Boolean" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
            <asp:CheckBoxField DataField="Enabled" HeaderText="Enabled" SortExpression="Enabled" />
        </Columns>
    </asp:GridView>
</asp:Content>
