<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNewFarmerPage.aspx.cs" Inherits="PROG7311_Part2.AddNewFarmerPage" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Add New Farmer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"/>
    <style>

        #leftDiv {
             -webkit-border-radius: 10px 10px 10px 10px;
              border-radius: 10px 10px 10px 10px;
              background: #fff;
              padding: 30px;
              width: 90%;
              max-width: 600px;
              position: relative;
              float: left;
              margin-left: 300px;
              margin-top: 50px;
              margin-bottom: 100px;
              -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
              box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
              text-align: center;

              /* Animation (ChatGPT, 2023)*/
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
              max-width: 600px;
              position: relative;
              float: right;
              margin-right: 300px;
              margin-top: 50px;
              margin-bottom: 100px;
              -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
              box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
              text-align: center;
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
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" 
                    aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
                <div class="collapse navbar-collapse" id="navbarColor01">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item" >
                            <a class="nav-link" href="EmployeePage.aspx">View Farmer</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="#">Add New Farmer
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
    <br/>
    <center>

    <form id="AddNewFarmer" runat="server">
        <h2>Add New Farmer</h2>
                <br />
        <asp:Label runat="server" ID="lblSuccess" class="btn btn-success"/>
        <br />
        <div id="leftDiv" class="auto-style1">
            <center>
              <h2>Farmer Details</h2>
                  
            <div class="form-group">

                <asp:Label for="lblFarmerName" runat="server" ID="lblProdCode" class="col-form-label col-form-label-sm mt-4" Text="Name:" />

                <asp:TextBox runat="server" ID="txtFarmerName" BorderColor="LightGray" class="form-control form-control-sm" 
                             aria-describedby="farmNameHelp" placeholder="Eg.John" Width="220px"></asp:TextBox>

                <!--(Truth, 2011)(ChatGPT, 2023) -->

                <asp:RequiredFieldValidator ID="rfvFarmName" runat="server" Display="Dynamic"
                                            ErrorMessage="Please enter a value." ForeColor="Red"
                                            ControlToValidate="txtFarmerName" />

                <asp:RegularExpressionValidator ID="revFarmName" Display="Dynamic" runat="server" 
                                                ErrorMessage="Field must start with a capital letter & cannot contain digits." ForeColor="Red"
                                                ControlToValidate="txtFarmerName" ValidationExpression="[A-Z]{1}[a-zA-Z''-'\s]{1,20}$" 
                                                ValidationGroup="YourValidationGroup" />
                <br/><br/>
            </div>
            <div class="form-group">
                <asp:Label runat="server" ID="lblFarmerSurname" class="col-form-label col-form-label-sm mt-4" Text="Surname:" />

                <asp:TextBox runat="server" ID="txtFarmerSurname" BorderColor="LightGray" class="form-control form-control-sm" 
                             aria-describedby="prodNameHelp" placeholder="Eg.Wick" Width="220px"></asp:TextBox>

                <!--(Truth, 2011)(ChatGPT, 2023) -->

                <asp:RequiredFieldValidator ID="rfvFarmerSurname" runat="server" Display="Dynamic"
                                            ErrorMessage="Please enter a value." ForeColor="Red"
                                            ControlToValidate="txtFarmerSurname"/>

                <asp:RegularExpressionValidator ID="revFarmerSurname" Display="Dynamic" runat="server" 
                                                ErrorMessage="Field must start with a capital letter & cannot contain digits." ForeColor="Red" 
                                                ControlToValidate="txtFarmerSurname" ValidationExpression="^[A-Z]{1}[a-zA-Z''-'\s]{1,20}$" 
                                                ValidationGroup="YourValidationGroup" />

                <br/><br/>
            </div>
            <div class="form-group">
            
                <asp:Label runat="server" ID="lblFarmerDOB" class="col-form-label col-form-label-sm mt-4" Text="Date-of-Birth:" />

            
                <asp:TextBox runat="server" ID="txtCalenderDate" BorderColor="LightGray" TextMode="Date" 
                             class="form-control form-control-sm" aria-describedby="farmDateHelp" Width="220px" />

            
                <!--(Truth, 2011)(ChatGPT, 2023) -->

                <asp:RequiredFieldValidator ID="rfvCalenderDate" runat="server" Display="Dynamic"
                                            ErrorMessage="Please select a value." ForeColor="Red"
                                            ControlToValidate="txtCalenderDate" />

                <asp:RegularExpressionValidator ID="revCalenderDate" runat="server" Display="Dynamic" 
                                                ErrorMessage="Invalid date format. Please use yyyy/MM/dd." ForeColor="Red"
                                                ControlToValidate="txtCalenderDate" ValidationExpression="^\d{4}-\d{2}-\d{2}$" 
                                                ValidationGroup="YourValidationGroup"/>
            
                <br/><br/>
            </div>
            <div class="form-group">
            
                <asp:Label runat="server" ID="lblFarmerCell" class="col-form-label col-form-label-sm mt-4" Text="Farmer Cell Number:" />
            
                <asp:TextBox runat="server" ID="txtFarmerCell" BorderColor="LightGray" class="form-control form-control-sm" 
                             aria-describedby="prodPriceHelp" placeholder="Eg.1234567890" Width="220px"></asp:TextBox>
            
                <!--(Truth, 2011)(ChatGPT, 2023) -->

                <asp:RequiredFieldValidator ID="rfvProdPrice" runat="server" Display="Dynamic"
                                            ErrorMessage="Please enter a value." ForeColor="Red"
                                            ControlToValidate="txtFarmerCell" />

                <asp:RegularExpressionValidator ID="revProdPrice" runat="server" Display="Dynamic" 
                                                ErrorMessage="Field only contains 10 integers." ForeColor="Red"
                                                ControlToValidate="txtFarmerCell" ValidationExpression="^\d{10}$" 
                                                ValidationGroup="YourValidationGroup"/>
           
                <br/><br/>
            </div>
            <div class="form-group">
                <asp:Label runat="server" ID="lblFarmerEmail" class="col-form-label col-form-label-sm mt-4" Text="Email:" />

                <asp:TextBox runat="server" ID="txtFarmerEmail" BorderColor="LightGray" class="form-control form-control-sm" 
                             aria-describedby="prodNameHelp" placeholder="Eg.someone@gmail.com" Width="220px" />

                <!--(Truth, 2011)(ChatGPT, 2023) -->

                <asp:RequiredFieldValidator ID="rfvFarmerEmail" runat="server" Display="Dynamic"
                                            ErrorMessage="Please enter a value." ForeColor="Red"
                                            ControlToValidate="txtFarmerEmail" />

                <asp:RegularExpressionValidator ID="revFarmerEmail" Display="Dynamic" runat="server" 
                                                ErrorMessage="Field must follow the correct format." ForeColor="Red" 
                                                ControlToValidate="txtFarmerEmail" 
                                                ValidationExpression="^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$" 
                                                ValidationGroup="YourValidationGroup" />

                <br/><br/>
            </div>
      </div>
    <div id="rightDiv" class="auto-style1">
        <center>
            <h2>Farmer Login Credentials</h2>
            <br />
            <asp:Label runat="server" ID="lblErrorLogin" ForeColor="Red"/>
            <br />
            <asp:Label runat="server" ID="lblError" ForeColor="Red"/>
            <br /><br />
        <div class="form-group">
        
                <asp:Label ID="lblUsername" Text="Farmer Username:" runat="server" class="col-form-label col-form-label-sm mt-4"/>
       
            
                <asp:TextBox ID="txtFarmerUsername" runat="server" BorderColor="LightGray" class="form-control form-control-sm" 
                             aria-describedby="prodNameHelp" placeholder="Username.." Width="230px" Height="30px"/>
        
            
                <!--(Truth, 2011)(ChatGPT, 2023) -->

                <asp:RequiredFieldValidator ID="rfvUsername" ForeColor="Red" ControlToValidate="txtFarmerUsername"  
                                            ErrorMessage="Please enter a value." Display="Dynamic" runat="server"/>
                
                <asp:RegularExpressionValidator ID="revUsername" runat="server" Display="Dynamic" 
                                                ErrorMessage="Field must start with a capital letter & cannot contain digits." ForeColor="Red" 
                                                ControlToValidate="txtFarmerUsername" 
                                                ValidationExpression="^(?=.{6,10}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$" 
                                                ValidationGroup="YourValidationGroup" />
        
            <br/><br/>
            </div>
            <div class="form-group">
                
                <asp:Label ID="lblFarmerPassword" Text="Password:" runat="server" class="col-form-label col-form-label-sm mt-4"/>
        
                <asp:TextBox ID="txtFarmerPassword" runat="server" TextMode="Password" MaxLength="10" MinLength="4" 
                         ToolTip="Password should be minimum 4 and maximum 10 characters long." BorderColor="LightGray" 
                         class="form-control form-control-sm" aria-describedby="prodNameHelp" placeholder="Password..." 
                         Width="230px" Height="30px"/>
            
                <!--(Truth, 2011)(ChatGPT, 2023) -->

                <asp:RequiredFieldValidator ID="rfvFarmerPassword" ForeColor="Red" ControlToValidate="txtFarmerPassword"  
                                        ErrorMessage="Please enter a value." Display="Dynamic" runat="server"/>

                <asp:RegularExpressionValidator ID="revFarmerPassword" runat="server" Display="Dynamic" 
                                                ErrorMessage="Field only contains integers." ForeColor="Red"
                                                ControlToValidate="txtFarmerPassword" 
                                                ValidationExpression="^([a-zA-Z0-9]{4,10})$" 
                                                ValidationGroup="YourValidationGroup"/>
        
            <br/><br/>
        </div>
        <div class="form-group">
        
                <asp:Label ID="lblFarmerConPassword" Text="Confirm Password:" runat="server" class="col-form-label col-form-label-sm mt-4"/>
        
            
                <asp:TextBox ID="txtFarmerConPassword" runat="server" TextMode="Password" MaxLength="10" MinLength="4" 
                         ToolTip="Password should be minimum 4 and maximum 10 characters long." BorderColor="LightGray" 
                         class="form-control form-control-sm" aria-describedby="prodNameHelp" placeholder="Confirm Password..." 
                         Width="230px" Height="30px"/>
            

                <!--(Truth, 2011)(ChatGPT, 2023) -->
                <asp:RequiredFieldValidator ID="rfvConPassword" ForeColor="Red" ControlToValidate="txtFarmerConPassword"  
                                        ErrorMessage="Please enter a value." Display="Dynamic" runat="server"/>

                <asp:RegularExpressionValidator ID="revConPassword" runat="server" Display="Dynamic" 
                                                ErrorMessage="Fields format is incorrect." ForeColor="Red"
                                                ControlToValidate="txtFarmerConPassword" 
                                                ValidationExpression="^([a-zA-Z0-9]{4,10})$" 
                                                ValidationGroup="YourValidationGroup"/>
        
            <br/><br/>

        </div>
        <asp:Button runat="server" ID="submitButton" class="btn btn-success" 
                    Text="Submit" OnClick="submitButton_Click"  Height="47px" Width="109px"/>
        <br />
     </center>
    </div>
   </form>
  </body>
</html>



<%--CODE ATTRIBUTION
    
Aurthor:  Serge Truth
Webisite: Security Innovation, 2011/05/03. How to use regular expression to constrain input. [Online]
Accessed on: 2023/05/29
URL: https://blog.securityinnovation.com/blog/2011/05/how-to-use-regular-expressions-to-constrain-input.html  --%>