<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PROG7311_Part2.Register" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h4>Please Provide Your Credentials to Register an Account</h4>
    <p>
        <asp:Label ID="lblEmail" Text="Enter Your Email:" runat="server"></asp:Label>
        <br/><br/>
        <asp:TextBox ID="txtEmail" placeholder="Email..." Width="200" runat="server"></asp:TextBox>
        <br/><br/>
        <asp:Label ID="lblName" Text="Enter Your Name:" runat="server"></asp:Label>
        <br/><br/>
        <asp:TextBox ID="txtName" placeholder="Firstname..." Width="200" runat="server"></asp:TextBox>
        <br/><br/>
        <asp:Label ID="lblSurname" Text="Enter Your Surname:" runat="server"></asp:Label>
        <br/><br/>
        <asp:TextBox ID="TextBox1" placeholder="Surname..." Width="200" runat="server"></asp:TextBox>
        <br/><br/>
        <asp:Label ID="lblPassword" Text="Enter a Password:" runat="server"></asp:Label>
        <br/><br/>
        <asp:TextBox ID="txtPassword" placeholder="Password..." Width="200" TextMode="Password" MaxLength="20" ToolTip="Password should be minimum 8 and maximum 20 characters long." runat="server"/>
        <br/><br/>
        <asp:Label ID="Label1" Text="Confirm Your Password:" runat="server"></asp:Label>
        <br/><br/>
        <asp:TextBox ID="TextBox2" placeholder="Re-enter Password..." Width="200" TextMode="Password" MaxLength="20" ToolTip="Password should be minimum 8 and maximum 20 characters long." runat="server"/>
        <br/><br/>
        <asp:Button ID="Submit" runat="server" Text="Submit" />
    </p>
</asp:Content>
