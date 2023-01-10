<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Hotel.Register" %>

<%@ Register Src="~/User Control/UC1.ascx" TagPrefix="uc1" TagName="UC1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Stylesheet/StyleSheet1.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="h1">
        <uc1:UC1 runat="server" ID="UC1" />
        </div>
     <h1 style="margin-left: auto; margin-right: auto; text-align: center;">VERSACE HOTEL</h1>
    <p class="paragraph">
        <asp:Label ID="Label1" runat="server" Text="REGISTRATION FORM" Font-Bold="true"></asp:Label>
    </p>
    <p class="center2">
        <b>Enter Email:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtUserName" runat="server" BackColor="#CCCCCC" BorderColor="Black" BorderStyle="Solid" Width="266px"></asp:TextBox>
    </p>
    <p class=" center2">
        <b>Enter Password:</b>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="266px" BackColor="#BCC4CB" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
    </p>
    <p class=" text">
        <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" BackColor="#3399FF"/>
    </p>
    <p class=" text">
        <asp:Label ID="lblStatus" runat="server" ForeColor="#CC3300"></asp:Label>
    </p>
</asp:Content>
