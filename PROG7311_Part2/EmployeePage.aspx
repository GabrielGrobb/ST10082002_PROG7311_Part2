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
        <div style="padding-top: 50px;">
            <asp:CheckBox ID="ckbProduct" runat="server" OnCheckedChanged="ckbProduct_CheckedChanged" AutoPostBack="true" />
            <asp:Label ID="lblProductname" runat="server" Text="Filter by Product Name: "/>
            <asp:TextBox ID="txtProductname" runat="server"/>
            <br /><br />
            <asp:CheckBox ID="ckbDate" runat="server" OnCheckedChanged="ckbDate_CheckedChanged" AutoPostBack="true" />
            <asp:Label ID="lblDateRange" runat="server" Text="Filter by Date Range: "/>
            <asp:Label ID="lblFirstDate" runat="server" Text="First Date: "/>
            <asp:TextBox ID="txtFirstDate" runat="server"/>
            <asp:Label ID="lblSecondDate" runat="server" Text="Second Date: "/>
            <asp:TextBox ID="txtSecondDate" runat="server"/>
            <asp:Button ID="btnFilter" runat="server" Text="Filter" OnClick="btnFilter_Click" />
            <br /><br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CellPadding="6">
               <Columns>  
                <asp:BoundField DataField="FARMER_NAME" HeaderText="First Name" />  
                <asp:BoundField DataField="FARMER_SURNAME" HeaderText="Surname" />
                <asp:BoundField DataField="FARMER_CELL" HeaderText="Cell" />
                <asp:BoundField DataField="PRODUCT_CODE" HeaderText="Product Code" />
                <asp:BoundField DataField="PRODUCT_NAME" HeaderText="Product Name" />
                <asp:BoundField DataField="PRODUCT_PRICE" HeaderText="Product Price (R)" />
                <asp:BoundField DataField="PRODUCT_QUANT" HeaderText="Product Quantity" /> 
                <asp:BoundField DataField="PRODUCT_DATE" HeaderText="Product Date" />  
            </Columns>  
            <HeaderStyle BackColor="#0066cc" Font-Bold="true" ForeColor="White" />  
            <RowStyle BackColor="#bfdfff" ForeColor="Black" />        

            </asp:GridView>
        </div>
    </form>
</body>
</html>
