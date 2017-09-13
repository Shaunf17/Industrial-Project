<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Industrial_Project.webfroms.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/LoginCss.css" rel="stylesheet" />
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <title></title>
</head>
<body>
    <%--    <div class = "center">
    <form id="form1" runat="server">
        <h1>Welcome</h1>

        <h3>Username:</h3>
        <asp:TextBox ID="TextBox4" runat="server" Height="26px" Width="90%" CssClass="userIcon"></asp:TextBox>
        <br/>
        <h2>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter your username" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
        </h2>
        <h3>Password:</h3>
        <asp:TextBox ID="TextBox5" runat="server" Height="26px" Width="90%" CssClass="PasswordIcon" TextMode="Password"></asp:TextBox>

        <h2>
            <asp:RequiredFieldValidator ID="RequiredValidator2" runat="server" ErrorMessage="Pleaser enter your password" ControlToValidate="TextBox5"></asp:RequiredFieldValidator>
        </h2>
        
        <h2>
            <asp:Label ID="Label1info" runat="server" Text="Label" Visible="false"></asp:Label>
        </h2>
        <p>
            <asp:Button ID="btnlogin" runat="server"  Text="LOGIN" CssClass="btnlogin"></asp:Button>
            </p>

    </form>
    </div>--%>
        <div class="container centered">
            <div class="row">
                <div class="col-md-offset-5 col-md-3">
                    <form class="form-login" runat="server">
                        <h4>Login</h4>
                        <asp:TextBox ID="userName" runat="server" CssClass="form-control input-sm chat-input"></asp:TextBox>
                        </br>
           
                        <asp:TextBox ID="userPassword" runat="server" CssClass="form-control input-sm chat-input" TextMode="Password"></asp:TextBox>
                        </br>
           
                        <div class="wrapper">
                            <span class="group-btn">
                                <asp:Button ID="btnlogin" runat="server"  Text="LOGIN" CssClass="btn btn-primary btn-md"></asp:Button>
                            </span>
                        </div>
                    </form>

                </div>
            </div>
        </div>
</body>
</html>
