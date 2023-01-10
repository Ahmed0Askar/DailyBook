<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Hotel.ForgotPassword" %>

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
        <asp:Label ID="Label1" runat="server" Text="FORGOT PASSWORD?" Font-Bold="true"></asp:Label>
    </p>
    <div class="center">
        <b>Email Address:</b>
        <asp:TextBox ID="txtEmail" runat="server" Width = "302px" />
    </div>
    <div class="text">
        <br />
        <asp:Label ID="lblMessage" runat="server" />
        <br />
        <asp:Button ID="Send" Text="Send" runat="server" OnClick="Send_Click" />
    </div>

    
</asp:Content>
