<%@ Page Async="true" Language="C#" AutoEventWireup="true" CodeBehind="FarmerPage.aspx.cs" Inherits="PROG7311_Part2.FarmerPage" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Add New Product</title>
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
              margin-left: 70px;
              margin-top: 0px;
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
        /* Keyframe animation (ChatGPT, 2023) */
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
              max-width: 800px;
              position: relative;
              float: right;
              margin-right: 100px;
              margin-top: 0px;
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
        /* Keyframe animation (ChatGPT, 2023) */
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
                            <a class="nav-link active" href="#">Add New Product
                            <span class="visually-hidden">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item" >
                            <a class="nav-link" href="Login.aspx">Logout</a>
                        </li>
                    </ul>
                </div>
        </div>
    </nav>
    <center>
        <br/>
        <h1>Welcome:</h1>
        &nbsp;<asp:Label ID="lblLoginUser" runat="server" Font-Bold="true" Font-Size="16"/>
        
        
        
        <br/><br/>
        
        <form id="addProductForm" runat="server">
        
        <div id="leftDiv" class="auto-style1">
            <center>
            <div class="form-group">
                <h2>Add New Product</h2>
                <br/>
                <asp:Label ID="lblerror" runat="server" ForeColor="Red"/>
                <br/><br/>

                <asp:Label for="txtProdCode" runat="server" ID="lblProdCode" class="col-form-label col-form-label-sm mt-4" >Product Code:</asp:Label>

                <asp:TextBox runat="server" ID="txtProdCode" BorderColor="LightGray" class="form-control form-control-sm" 
                             aria-describedby="prodCodeHelp" placeholder="Eg.ABC123" Width="220px"></asp:TextBox>

                <!--(Truth, 2011)(ChatGPT, 2023) -->

                <asp:RequiredFieldValidator ID="rfvProdCode" runat="server" Display="Dynamic"
                                            ErrorMessage="Please enter a value." ForeColor="Red"
                                            ControlToValidate="txtProdCode" ValidationGroup="btnValidationGroup" />

                <asp:RegularExpressionValidator ID="revProdCode" Display="Dynamic" runat="server" 
                                                ErrorMessage="Field cannot be longer/Less than 6 characters" ForeColor="Red"
                                                ControlToValidate="txtProdCode" ValidationExpression="^(?!.*\s)[A-Z]{3}[0-9]{3}$" 
                                                ValidationGroup="btnValidationGroup" />
                <br/><br/>
            </div>
            <div class="form-group">
                <asp:Label runat="server" ID="lblProdName" class="col-form-label col-form-label-sm mt-4" >Product Title:</asp:Label>

                <asp:TextBox runat="server" ID="txtProdName" BorderColor="LightGray" class="form-control form-control-sm" 
                             aria-describedby="prodNameHelp" placeholder="Eg.Honda" Width="220px"></asp:TextBox>

                <!--(Truth, 2011)(ChatGPT, 2023) -->

                <asp:RequiredFieldValidator ID="rfvProdName" runat="server" Display="Dynamic"
                                            ErrorMessage="Please enter a value." ForeColor="Red"
                                            ControlToValidate="txtProdName" ValidationGroup="btnValidationGroup" />

                <asp:RegularExpressionValidator ID="revProdName" Display="Dynamic" runat="server" 
                                                ErrorMessage="Field must start with a capital letter & cannot contain digits." ForeColor="Red" 
                                                ControlToValidate="txtProdName" ValidationExpression="^[A-Z]{1}[a-zA-Z''-'\s]{1,50}$" 
                                                ValidationGroup="btnValidationGroup" />

                <br/><br/>
            </div>
            <div class="form-group">
            
                <asp:Label runat="server" ID="lblProdType" class="col-form-label col-form-label-sm mt-4" >Product Type:</asp:Label>
            
                <asp:TextBox runat="server" ID="txtProdType" BorderColor="LightGray" class="form-control form-control-sm" 
                             aria-describedby="prodTypeHelp" placeholder="Eg.Vehicle" Width="220px"></asp:TextBox>
            
                <!--(Truth, 2011)(ChatGPT, 2023) -->

                <asp:RequiredFieldValidator ID="rfvProdType" runat="server" Display="Dynamic"
                                            ErrorMessage="Please enter a value." ForeColor="Red"
                                            ControlToValidate="txtProdType" ValidationGroup="btnValidationGroup" />

                <asp:RegularExpressionValidator ID="revProdType" runat="server" Display="Dynamic" 
                                                ErrorMessage="Field must start with a capital letter & cannot contain digits." ForeColor="Red" 
                                                ControlToValidate="txtProdType" ValidationExpression="^(?!.*\s)[A-Z]{1}[a-zA-Z]{1,50}$" 
                                                ValidationGroup="btnValidationGroup" />

            
                <br/><br/>
            </div>
            <div class="form-group">
            
                <asp:Label runat="server" ID="lblProdPrice" class="col-form-label col-form-label-sm mt-4" >Product Price:</asp:Label>
            
                <asp:TextBox runat="server" ID="txtProdPrice" BorderColor="LightGray" class="form-control form-control-sm" 
                             aria-describedby="prodPriceHelp" placeholder="Eg.69999,99" Width="220px"></asp:TextBox>
            
                <!--(Truth, 2011)(ChatGPT, 2023) -->

                <asp:RequiredFieldValidator ID="rfvProdPrice" runat="server" Display="Dynamic"
                                            ErrorMessage="Please enter a value." ForeColor="Red"
                                            ControlToValidate="txtProdPrice" ValidationGroup="btnValidationGroup" />

                <asp:RegularExpressionValidator ID="revProdPrice" runat="server" Display="Dynamic" 
                                                ErrorMessage="Field only contains integers and/or decimals." ForeColor="Red"
                                                ControlToValidate="txtProdPrice" ValidationExpression="^(?!.*\s)\d+(\,\d\d)?$" 
                                                ValidationGroup="btnValidationGroup"/>
           
                <br/><br/>
            </div>
            <div class="form-group">
            
                <asp:Label runat="server" ID="lblProdQuant" class="col-form-label col-form-label-sm mt-4">Product Quantity:</asp:Label>
            
                <asp:TextBox runat="server" ID="txtProdQuant" BorderColor="LightGray" class="form-control form-control-sm" 
                             aria-describedby="prodQuantHelp" placeholder="Eg.1" Width="220px"></asp:TextBox>
            
                <!--(Truth, 2011)(ChatGPT, 2023) -->

                <asp:RequiredFieldValidator ID="rfvProdQuant" runat="server" Display="Dynamic"
                                            ErrorMessage="Please enter a value." ForeColor="Red"
                                            ControlToValidate="txtProdQuant" ValidationGroup="btnValidationGroup" />

                <asp:RangeValidator ID="rvProdQuant" runat="server" Display="Dynamic" Type="Integer"
                                    ErrorMessage="Quantity must be between 0 and 1001." ForeColor="Red"
                                    ControlToValidate="txtProdQuant" MinimumValue="1" MaximumValue="1000" />

                <br/><br/>
            </div>
            <div class="form-group">
            
                <asp:Label runat="server" ID="lblProdDate" class="col-form-label col-form-label-sm mt-4">Product Date Added:</asp:Label>

            
                <asp:TextBox runat="server" ID="txtProdDate" BorderColor="LightGray" TextMode="Date" class="form-control form-control-sm" 
                             aria-describedby="prodDateHelp" placeholder="Eg.1" Width="220px" />

                <!--(Truth, 2011)(ChatGPT, 2023) -->
            
                <asp:RequiredFieldValidator ID="rfvProdDate" runat="server" Display="Dynamic" 
                                            ErrorMessage="Please select a value." ForeColor="Red"
                                            ControlToValidate="txtProdDate" ValidationGroup="btnValidationGroup" />

                <asp:RegularExpressionValidator ID="revProdDate1" runat="server" Display="Dynamic" 
                                                ErrorMessage="Invalid date format. Please use yyyy/MM/dd." ForeColor="Red"
                                                ControlToValidate="txtProdDate" ValidationExpression="^\d{4}-\d{2}-\d{2}$" 
                                                ValidationGroup="btnValidationGroup"/>

                <asp:CompareValidator runat="server" ID="cvProdDate" ControlToValidate="txtProdDate"
                                      Type="Date" Operator="GreaterThanEqual" ForeColor="Red"
                                      ErrorMessage="Selected Date cannot be less than the current Date!" ValidationGroup="btnValidationGroup" />

                <br/><br/>
            </div>
            </center>
            <!--(ChatGPT, 2023) -->
            <asp:Button runat="server" ID="btnAddProduct" class="btn btn-success" Text="Add Product" OnClick="submitButton_Click" Height="47px" Width="109px" ValidationGroup="btnValidationGroup"/>
            <asp:Button runat="server" ID="btnAddNewProduct" class="btn btn-success" Text="Add Another Product?" Height="47px" Width="262px" OnClick="btnAddNewProduct_Click"/>
            <br/>
        </div>
        
        <div id="rightDiv" class="auto-style1">
            <h2>Your Current List of Products</h2>
            <br/><br/>
            <asp:Label ID="lblAdded" runat="server" class="btn btn-success"/>
            <br/><br/>
            <!--(User2115139740, 2010) -->
            <asp:GridView ID="gvProduct" runat="server" AutoGenerateColumns="false" CellPadding="6">
                        <Columns>                 
                        <asp:BoundField DataField="PRODUCT_CODE" HeaderText="Product Code" />
                        <asp:BoundField DataField="PRODUCT_NAME" HeaderText="Product Name" />
                        <asp:BoundField DataField="PRODUCT_TYPE" HeaderText="Product Type" />
                        <asp:BoundField DataField="PRODUCT_PRICE" HeaderText="Product Price (R)" />
                        <asp:BoundField DataField="PRODUCT_QUANT" HeaderText="Product Quantity"/> 
                        <asp:BoundField DataField="PRODUCT_DATE" HeaderText="Date Added" DataFormatString="{0:yyyy/MM/dd }" HtmlEncode=false/>  
                        </Columns>  
                        <HeaderStyle BackColor="#0066cc" Font-Bold="true" ForeColor="White" />  
                        <RowStyle HorizontalAlign="Center" BackColor="#bfdfff" ForeColor="Black" />
            </asp:GridView>
        </div>
    </form>
   </center>
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