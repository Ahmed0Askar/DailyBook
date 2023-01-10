<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WCU.aspx.cs" Inherits="Hotel.WCU" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Stylesheet/StyleSheet2.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:HyperLink ID="HyperLinkHome" runat="server"  ForeColor="black" Font=Bold Font-Size="Large"
    NavigateUrl="Homepage.aspx">Home</asp:HyperLink>
</asp:Content>
