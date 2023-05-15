<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeePage.aspx.cs" Inherits="PROG7311_Part2.EmployeePage" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>View Famers</title>
    <style>
        nav {
            background-color: #333;
            overflow: hidden;
        }
        nav a {
            float: left;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            font-size: 17px;
        }
        nav a:hover {
            background-color: #ddd;
            color: black;
        }
        nav a.active {
            background-color: #4CAF50;
            color: white;
        }
        .tick {
            display: none;
            color: green;
            font-size: 16px;
            margin-left: 5px;
        }
    </style>
   </head>
    <body>
    <nav>
        <a href="#" class="active">View Famers</a>
        <a href="#" class="active">Add New Farmer</a>
        <a href="Login.aspx" style="float:right">Logout</a>
    </nav>

    <h1>View Farmers</h1>

    <form id="form1" runat="server">
        <div class="navbar">
            <a class="active" href="#">Home</a>
            <a href="#">About</a>
            <a href="#">Contact</a>
        </div>
        <div style="padding-top: 50px;">
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            
        </div>
    </form>
</body>
</html>
