<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Hotel.Login" %>

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
        <asp:Label ID="Label1" runat="server" Text="LOGIN FORM" Font-Bold="true"></asp:Label>
    </p>
    <div class="center">
        <b>Enter email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
        <asp:TextBox ID="txtUserName" runat="server" Width="262px"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server"
            ErrorMessage="Email Required" ControlToValidate="txtUserName" Display="Dynamic" 
            ForeColor="#993333" BorderStyle="None" Width="282px"></asp:RequiredFieldValidator>
    </div >
    <p class="center">
        
        <b>Enter password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="262px"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ErrorMessage="Password Required" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="#993333"></asp:RequiredFieldValidator>
    </p>
    <p class="center">
        <asp:CheckBox ID="CheckBoxRememberme" runat="server" OnCheckedChanged="CheckBoxRememberme_CheckedChanged" />Remember Me <br />
        <asp:HyperLink ID="HyperLinkHome" runat="server"  ForeColor="black" Font=Bold Font-Size="Medium"
    NavigateUrl="ForgotPassword.aspx">Forgot Password?</asp:HyperLink>
    </p>
    <p class="paragraph">
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" BackColor="#6699FF" Width="103px" />
    </p>
    <p class="paragraph">
        <asp:Label ID="lblStatus" runat="server" ForeColor="Maroon"></asp:Label>
    </p>
</asp:Content>
