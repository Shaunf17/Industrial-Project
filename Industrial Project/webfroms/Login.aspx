<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Industrial_Project.webfroms.Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="UTF-8">
    <title>YoYo Login</title>
    <script src="https://bootstrapcreative.com/wp-bc/wp-content/themes/wp-bootstrap/codepen/bootstrapcreative.js?v=1"></script>
    <link href="../css/StyleSheet2.css" rel="stylesheet" />
    <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
</head>

<body>
    <div class="back">
       <%-- <div class="topnav">
            <a class="active" href="| Team 6">Yoyo Statistics | Team 6  </a>
        </div>--%>


        <div class="div-center">
            <div class="content">
                <div class="textStyle">
                    <h2>Welcome</h2>
                </div>
                <hr />

                <form runat="server">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Username</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <span class="glyphicon glyphicon-user"></span>
                            </div>
                            <asp:TextBox ID="userName" runat="server" class="form-control" placeholder="Username"></asp:TextBox>
                        </div>
                        <br />

                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <span class="glyphicon glyphicon-lock"></span>
                                </div>
                                <asp:TextBox ID="userPassword" runat="server" class="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                                
                            </div>
                             <div class="errorMessage">
                            <br /><asp:Label ID="Label1" runat="server" Visible="False" Text="Incorrect username or password - try again!"></asp:Label>
                        </div>
                            <br />
                            <asp:Button ID="btnlogin" runat="server" Text="LOGIN" OnClick="Btnlogin_click" CssClass="btn btn-primary" Style="text-align: center; display: block; width: 30%; margin-bottom: 10px;"></asp:Button>
                        </div>
                </form>
               
            </div>
        </div>
        </span>
 
    </div>

    <%--2 logos--%>
    <div id="my-element1" class="col-sm-3">
        <img src="../Pictures/dusa.png" class="size" alt="...">
    </div>

    <div id="my-element" class="col-sm-12">
        <img src="../Pictures/newYoyo.png" class="size" alt="...">
    </div>


</body>
</html>
