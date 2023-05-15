<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FarmerPage.aspx.cs" Inherits="PROG7311_Part2.FarmerPage" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Add New Product</title>
    <script>
        function validateProductCode()
        {
            var productCodeTextbox = document.getElementById("<%= productCodeTextbox.ClientID %>");
            var codeTick = document.getElementById("codeTick");
            var codeRegex = /^[A-Za-z0-9]{3,}$/;
            if (codeRegex.test(productCodeTextbox.value)) {
                codeTick.style.display = "inline";
            }
            else {
                codeTick.style.display = "none";
            }
        }

        function validateProductTitle()
        {
            var productTitleTextbox = document.getElementById("<%= productTitleTextbox.ClientID %>");
            var titleTick = document.getElementById("titleTick");
            var titleRegex = /^[A-Za-z\s]{3,}$/;
            if (titleRegex.test(productTitleTextbox.value)) {
                titleTick.style.display = "inline";
            }
            else {
                titleTick.style.display = "none";
            }
        }

        function validateQuantity()
        {
            var quantityTextbox = document.getElementById("<%= productQuantityTextbox.ClientID %>");
            var quantityTick = document.getElementById("quantityTick");
            if (quantityTextbox.value > 0) {
                quantityTick.style.display = "inline";
            }
            else {
                quantityTick.style.display = "none";
                alert("Quantity cannot be less than zero.");
                quantityTextbox.focus();
            }
        }
    </script>
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
        <a href="#" class="active">Add New Product</a>
        <a href="#" class="active">Edit Product</a>
        <a href="#" class="active">Remove Product</a>
        <a href="Login.aspx" style="float:right">Logout</a>
    </nav>
    <h1>Add New Product</h1>
    <form id="addProductForm" runat="server" onsubmit="return validateQuantity();">
        <table>
            <tr>
                <td><asp:Label runat="server" ID="productCodeLabel" AssociatedControlID="productCodeTextbox">Product Code:</asp:Label></td>
                <td><asp:TextBox runat="server" ID="productCodeTextbox" oninput="validateProductCode()" required="true"></asp:TextBox></td>
                <td class="tick" id="codeTick">&#10004;</td>
            </tr>
            <tr>
                <td><asp:Label runat="server" ID="productTitleLabel" AssociatedControlID="productTitleTextbox">Product Title:</asp:Label></td>
                <td><asp:TextBox runat="server" ID="productTitleTextbox" oninput="validateProductTitle()" required="true"></asp:TextBox></td>
                <td class="tick" id="titleTick">&#10004;</td>
            </tr>
            <tr>
                <td><asp:Label runat="server" ID="productQuantityLabel" AssociatedControlID="productQuantityTextbox">Quantity:</asp:Label></td>
                <td><asp:TextBox runat="server" ID="productQuantityTextbox" oninput="validateQuantity()" required="true" type="number"></asp:TextBox></td>
                <td class="tick" id="quantityTick">&#10004;</td>
            </tr>
        </table>
    <br />
    <asp:Button runat="server" ID="submitButton" Text="Submit" />
    </form>
  </body>
</html>