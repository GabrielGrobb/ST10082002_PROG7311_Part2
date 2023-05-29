<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeePage.aspx.cs" Inherits="PROG7311_Part2.EmployeePage" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>View Famers</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"/>
    <style>
        #leftDiv {
             -webkit-border-radius: 10px 10px 10px 10px;
              border-radius: 10px 10px 10px 10px;
              background: #fff;
              padding: 30px;
              width: 90%;
              max-width: 750px;
              position: relative;
              float: left;
              margin-left: 60px;
              margin-top: 50px;
              margin-bottom: 100px;
              -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
              box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
              text-align: center;

              /* Animation (ChatGPT, 2023) */
              -webkit-animation: slideFromLeft 1s ease-in-out;
              animation: slideFromLeft 1s ease-in-out;
              -webkit-animation-fill-mode: forwards;
              animation-fill-mode: forwards;
        }

        /* Keyframe animation (ChatGPT, 2023) */
        @keyframes slideFromLeft {
            0% {
                    opacity: 0;
                    transform: translateX(-100%);
        }
            100% {
                    opacity: 1;
                    transform: translateX(0);
            }
        }

        @-webkit-keyframes slideFromLeft {
            0% {
                    opacity: 0;
                    -webkit-transform: translateX(-100%);
            }
            100% {
                    opacity: 1;
                    -webkit-transform: translateX(0);
            }
        }

        #rightDiv {
             -webkit-border-radius: 10px 10px 10px 10px;
              border-radius: 10px 10px 10px 10px;
              background: #fff;
              padding: 30px;
              width: 90%;
              max-width: 1000px;
              position: relative;
              float: right;
              margin-right: 60px;
              margin-top: 50px;
              margin-bottom: 100px;
              -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
              box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
              text-align: center;
              align-content: center;
              align-items: center;
              /* Animation (ChatGPT, 2023) */
              
             -webkit-animation: slideFromRight 1s ease-in-out;
             animation: slideFromRight 1s ease-in-out;
             -webkit-animation-fill-mode: forwards;
             animation-fill-mode: forwards;
        }

        /* Keyframe animation (ChatGPT, 2023) */
        @keyframes slideFromRight {
             0% {
                  opacity: 0;
                  transform: translateX(100%);
             }
             100% {
                  opacity: 1;
                  transform: translateX(0);
             }
        }

        @-webkit-keyframes slideFromRight {
            0% {
                opacity: 0;
               -webkit-transform: translateX(100%);
            }
            100% {
                opacity: 1;
                -webkit-transform: translateX(0);
            }
        }

        .auto-style1 {
            margin-left: 0px;
        }

    </style>
   </head>
    <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-success">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Farmers Market</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
                <div class="collapse navbar-collapse" id="navbarColor01">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">View Famers
                            <span class="visually-hidden">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item" >
                            <a class="nav-link" href="AddNewFarmerPage.aspx">Add New Farmer</a>
                        </li>
                        <li class="nav-item" >
                            <a class="nav-link" href="Login.aspx">Logout</a>
                        </li>
                    </ul>
                </div>
        </div>
    </nav>
    <br/>
    <center>
    <h1>View Farmers</h1>
        <asp:Label ID="lblWelcome" runat="server" Text="Welcome: " Font-Bold="true" Font-Size="16"></asp:Label>
            <asp:Label ID="lblUserLoginName" runat="server" Font-Bold="true" Font-Size="16"></asp:Label>

    </center>
        
    <form id="vieFarmerForm" runat="server">
        
        <div  id="leftDiv" class="auto-style1">
            <center>
            <div class="form-group">
                <h2>Filter Farmer Products</h2>
                <asp:Label ID="lblerror" runat="server" ForeColor="Red"/>
                <br/><br/>

                <asp:Label ID="lblFarmerUsername" runat="server" Text="Farmer Username: " class="col-form-label col-form-label-sm mt-4"/>

                <asp:DropDownList ID="ddlFarmerUsername" runat="server" class="form-select"  Width="220px"/>

                <br/><br/>
            </div>
            <div class="form-group">

                <asp:Label ID="lblFilterProdType" runat="server" Text="Product Type: " class="col-form-label col-form-label-sm mt-4"/>

                <asp:DropDownList ID="ddlProdType" runat="server" class="form-select"  Width="220px"/>

                <br/><br/>
            </div>
            <div class="form-group">
            
                <asp:Label runat="server" ID="lblMinDate" class="col-form-label col-form-label-sm mt-4" Text="Min Date Added:"/>
            
                <asp:TextBox runat="server" ID="txtMinDate" BorderColor="LightGray" TextMode="Date" class="form-control form-control-sm" 
                             aria-describedby="prodDateHelp" Width="220px" />       

                <!--(Truth, 2011)(ChatGPT, 2023) -->

                <asp:RegularExpressionValidator ID="revMinDate" runat="server" Display="Dynamic" 
                                                ErrorMessage="Invalid date format. Please use yyyy/MM/dd." ForeColor="Red"
                                                ControlToValidate="txtMinDate" ValidationExpression="^\d{4}-\d{2}-\d{2}$" 
                                                ValidationGroup="btnValidationGroup"/>
            
                <br/><br/>
            </div>
            <div class="form-group">
            
                <asp:Label runat="server" ID="lblMaxDate" class="col-form-label col-form-label-sm mt-4" Text="Max Date Added:"/>

            
                <asp:TextBox runat="server" ID="txtMaxDate" BorderColor="LightGray" TextMode="Date" class="form-control form-control-sm" 
                             aria-describedby="prodDateHelp" Width="220px" />

                <!--(Truth, 2011)(ChatGPT, 2023) -->
                <asp:RegularExpressionValidator ID="revMaxDate" runat="server" Display="Dynamic" 
                                                ErrorMessage="Invalid date format. Please use yyyy/MM/dd." ForeColor="Red"
                                                ControlToValidate="txtMaxDate" ValidationExpression="^\d{4}-\d{2}-\d{2}$" 
                                                ValidationGroup="btnValidationGroup"/>

                <!--(ChatGPT, 2023) -->
                <asp:CompareValidator runat="server" ID="cvDateRange" ControlToValidate="txtMaxDate"
                                      Type="Date" Operator="GreaterThanEqual" ControlToCompare="txtMinDate" ForeColor="Red"
                                      ErrorMessage="Max Date cannot be less than the Min Date!" ValidationGroup="btnValidationGroup" />
            
                <br/><br/>
            </div>
            </center>
            <!--(ChatGPT, 2023) -->
            <asp:Button ID="btnFilter" runat="server" class="btn btn-success" Text="Filter" 
                        OnClick="btnFilter_Click" Height="47px" Width="109px" ValidationGroup="btnValidationGroup" />

            <asp:Button ID="btnResetTable" runat="server" class="btn btn-warning" Text="Reset Filter" 
                        OnClick="btnResetTable_Click" Height="47px" Width="109px" />
            <br/>
        </div>

        <div id="rightDiv" class="auto-style1">
            <h2>List of Farmer Products</h2>
            <br/><br/>
            <asp:Label ID="lblAdded" runat="server"/>
            <br/><br/>
            <!--(User2115139740, 2010) -->
            <asp:GridView ID="gvFarmerProducts" runat="server" AutoGenerateColumns="false" CellPadding="6">
                        <Columns>
                        <asp:BoundField DataField="USERNAME" HeaderText="Username" />
                        <asp:BoundField DataField="FARMER_NAME" HeaderText="First Name" />  
                        <asp:BoundField DataField="FARMER_SURNAME" HeaderText="Surname" />
                        <asp:BoundField DataField="FARMER_CELL" HeaderText="Cell" />
                        <asp:BoundField DataField="PRODUCT_CODE" HeaderText="Product Code" />
                        <asp:BoundField DataField="PRODUCT_NAME" HeaderText="Product Name" />
                        <asp:BoundField DataField="PRODUCT_TYPE" HeaderText="Product Type" />
                        <asp:BoundField DataField="PRODUCT_PRICE" HeaderText="Product Price (R)" />
                        <asp:BoundField DataField="PRODUCT_QUANT" HeaderText="Product Quantity"/> 
                        <asp:BoundField DataField="PRODUCT_DATE" HeaderText="Product Date" DataFormatString="{0:yyyy/MM/dd }" HtmlEncode=false/>  
                        </Columns>  
                        <HeaderStyle BackColor="#0066cc" Font-Bold="true" ForeColor="White" />  
                        <RowStyle HorizontalAlign="Center" BackColor="#bfdfff" ForeColor="Black" />
            </asp:GridView>
        </div>
      </form>
    </body>
</html>


<%--CODE ATTRIBUTION
    
Aurthor:  Serge Truth
Webisite: Security Innovation, 2011/05/03. How to use regular expression to constrain input. [Online]
Accessed on: 2023/05/29
URL: https://blog.securityinnovation.com/blog/2011/05/how-to-use-regular-expressions-to-constrain-input.html 
    
Aurthor:  User2115139740 
Webisite: microsoft, 2010/01/12. How do I display short date format without time in my gridview? [Online]
Accessed on: 2023/05/29
URL: https://social.msdn.microsoft.com/Forums/en-US/69892f29-73a9-4b4e-bb37-e48d5af6b884/how-do-i-display-short-date-format-without-time-in-my-gridview?forum=aspwebformsdata --%>  