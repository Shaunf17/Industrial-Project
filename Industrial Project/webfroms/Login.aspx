<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Industrial_Project.webfroms.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/LoginCss.css" rel="stylesheet" />
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <title></title>
</head>
<body id="body">
    <div class="container">
        <div class="row" >
            <div class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3 col-xs-6 col-xs-offset-3">
                <form class="form-group form-login" runat="server">
                    <h1>Welcome</h1>
                    <div class="labels" style="margin-top:3%">
                        <label>Username </label>
                        <asp:TextBox ID="userName" runat="server" CssClass="textbox form-control input-sm chat-input "></asp:TextBox>
                    </div>
                    <div class="labels">
                        <label>Password</label>
                        <asp:TextBox ID="userPassword" runat="server" CssClass="textbox form-control input-sm chat-input " TextMode="Password"></asp:TextBox>
                        <span class="group-btn">
                            <asp:Label ID="Label1" runat="server" Visible="False" Text="Incorrect username or password."></asp:Label>
                        </span>
                    </div>
                    <div class="wrapper">
                        <span class="group-btn">
                            <asp:Button ID="btnlogin" runat="server" Text="LOGIN" OnClick="Btnlogin_click" CssClass="btn btn-primary btn-md"></asp:Button>
                        </span>
                    </div>
                </form>

            </div>
        </div>
    </div>

</body>
</html>
