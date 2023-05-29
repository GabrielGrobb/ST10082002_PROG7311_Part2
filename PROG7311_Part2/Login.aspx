<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PROG7311_Part2.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <br/><br/>
    <h2>Login</h2>
    <h4>Please Provide Your Login Credentials</h4>

        <asp:Label ID="lblLoginError" Text="" runat="server"></asp:Label>
        <br/><br/>
        <div class="form-group">
        
            <asp:Label ID="lblUsername" Text="Enter Your Username:" runat="server" class="col-form-label col-form-label-sm mt-4"/>
       
            <asp:TextBox ID="txtUserName" runat="server" BorderColor="LightGray" class="form-control form-control-sm" 
                         aria-describedby="prodNameHelp" placeholder="Username.." Width="230px" Height="30px"/>
        
            <!--(ChatGPT, 2023) -->
            <asp:RequiredFieldValidator ID="rfvUsername" Font-Bold="true" ForeColor="Red" ControlToValidate="txtUsername"  
                                        ErrorMessage="Please enter a Username." Display="Dynamic" runat="server"/>          
        
            <br/><br/>
        </div>
        <div class="form-group">
        
            <asp:Label ID="lblPassword" Text="Enter Your Password:" runat="server" class="col-form-label col-form-label-sm mt-4"/>
        
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="10" 
                         ToolTip="Password should be minimum 8 and maximum 20 characters long." BorderColor="LightGray" 
                         class="form-control form-control-sm" aria-describedby="prodNameHelp" placeholder="Password..." 
                         Width="230px" Height="30px"/>
        
            <!--(ChatGPT, 2023) -->
            <asp:RequiredFieldValidator ID="rfvPassword" Font-Bold="true" ForeColor="Red" ControlToValidate="txtPassword"  
                                        ErrorMessage="Please enter a Password." Display="Dynamic" runat="server"/>
        
            <br/><br/>
        </div>
        <asp:Button ID="btnSubmit" class="btn btn-success" runat="server" Font-Bold="true" 
                    Text="Submit" OnClick="btnSubmit_Click" Height="47px" Width="109px" /> 
</asp:Content>
