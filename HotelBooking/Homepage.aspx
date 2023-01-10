<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="Hotel.Homepage" %>

<%@ Register Src="~/User Control/UC1.ascx" TagPrefix="uc1" TagName="UC1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Stylesheet/StyleSheet1.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="h1">
        <uc1:UC1 runat="server" id="UC1" />
        </div>
    <h1 style="margin-left: auto; margin-right: auto; text-align: center;">VERSACE HOTEL</h1>
    <p class="paragraph">
        <asp:Label ID="Label1" runat="server" Text="About Us" Font-Bold="true"></asp:Label>
    </p>
        <p class="text" >
            <asp:Label ID="Label2" runat="server" Text="A welcome retreat" Font-Bold="true"></asp:Label>
        </p> 
        <p class="text">
             within the heart of Kuala Lumpur
        </p>
        <p class="text">
           Start your day with a sumptuous breakfast at the Lemon Garden all-day dining. Satisfied, head out to the trendy mercantile and fashion centres in the Golden Triangle. After some quick shopping, you crave the melange of the aromatic spices of Malaysian cuisine. Satisfy your hunger with our lunch menu, where our talented team of chefs prepares an array of local and international dishes. A genuinely Malaysian experience that you can't miss!
           Spend the rest of the day walking off your indulgent lunch. Absorb the sights and sounds of Kuala Lumpur while you explore its attraction sites with your family. From Petr
        </p>
        <p style="margin-left: auto; margin-right: auto; text-align: center;">
            <asp:Label ID="Label3" runat="server" Text="Our Gallery" Font-Bold="true" Font-Size="Larger"></asp:Label>
        </p>
        <p style="margin-left: auto; margin-right: auto; text-align: center;  ">
            <asp:Label ID="Label4" runat="server" Text="Room&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;Swimming Pool&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Spa" Font-Bold="true" Font-Size="Large"></asp:Label>
            
        </p>
        <p style="margin-left: auto; margin-right: auto; text-align: center;">
            <img src= />
            <img src="Images/room.jpg" height="350px" width="450px"/>
            <img src="Images/pool.jpg" height="350px" width="450px" />
            <img src="Images/spa.jpg" height="350px" width="450px"/>
            </p> 
</asp:Content>
