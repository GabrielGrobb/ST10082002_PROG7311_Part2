<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PROG7311_Part2.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <h2><%: Title %></h2>
    <h4>Please Provide Your Login Credentials</h4>
    <p>
        <asp:Label ID="Label3" Text="" runat="server"></asp:Label>
        <br/><br/>
        <asp:Label ID="lblUsername" Text="Enter Your Username:" runat="server"></asp:Label>
        <br/><br/>
        <asp:TextBox ID="txtUserName" placeholder="Username..." Width="200" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="Value1RequiredValidator" ControlToValidate="txtUsername"  ErrorMessage="Please enter a Username.<br />" Display="Dynamic" runat="server"/>          
        <br/><br/>
        <asp:Label ID="lblPassword" Text="Enter Your Password:" runat="server"></asp:Label>
        <br/><br/>
        <asp:TextBox ID="txtPassword" placeholder="Password..." Width="200" TextMode="Password" MaxLength="20" ToolTip="Password should be minimum 8 and maximum 20 characters long." runat="server"/>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtPassword"  ErrorMessage="Please enter a Username.<br />" Display="Dynamic" runat="server"/>
        <br/><br/>

        <!-- <input id="txtPassword" class="test" type="password" placeholder="Password..."></input>

       
          show <input type="checkbox" name="mycheckbox" id="ckShowPass" onclick="myshowp(this)"/>
        <script>
            function myshowp(e) {
                txtBox = $('#txtPassword')
                if (e.checked) {
                    txtBox.attr("Type", "Text");
                }
                else {
                    txtBox.attr("Type", "Password");
                }
            }
        </script>-->

        <br/><br/>
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /> 
    </p>
</asp:Content>
