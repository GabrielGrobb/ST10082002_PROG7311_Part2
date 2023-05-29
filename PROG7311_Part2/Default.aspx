<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PROG7311_Part2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br/><br/>

    <div class="jumbotron">
        <h1>Welcome to the Farmers Market Application</h1>
        <p class="lead">Capture, View, Track your products.</p>
    </div>

    <br/><br/>

    <div class="row">
        <div class="col-md-4">
            <h2>Introduction</h2>
            <p>
                You are currenly in the home screen. Please procceed to Login or create an account to make use of this websites features. Happy Farming!
            </p>
        </div>

        <div class="col-md-4">
            <p>
                <asp:Image ID="imgBackground" runat="server" ImageUrl="~/images/vineyards.jpg" height="600px" Width="750px"/>
            </p>   
        </div>
    </div>

</asp:Content>
