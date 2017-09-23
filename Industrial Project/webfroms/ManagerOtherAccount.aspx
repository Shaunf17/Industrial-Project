<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManagerOtherAccount.aspx.cs" Inherits="Industrial_Project.webfroms.ManagerOtherAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/MainDashboardCSS.css" rel="stylesheet" />
    <link href="../css/UserAllocation.css" rel="stylesheet" />
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Dashboard</title>
</head>
<body>
    <form runat="server">
    <div class="Header">
        <img id="YoyoLogo" src="../Pictures/Yoyo_logo_white_NO_BG.png" />

    </div>

    <div class ="SideBar">
        <div id ="SideBarTop"></div>
        <div class ="SideBarMenu">
            <a href="MainDashboard.aspx"><span class="glyphicon glyphicon-th-large"></span>Dashboard</a>
            <a href="Reports.aspx"><span class="glyphicon glyphicon-stats"></span>Reports</a>
            <a href="RawData.aspx"><span class="glyphicon glyphicon-th-list"></span>Raw Data</a>
            <asp:LinkButton ID="UploadButton" onclick="Upload_Click" runat="server"><span class="glyphicon glyphicon-upload"></span>Upload</asp:LinkButton>
             <asp:LinkButton ID="LinkButton1" onclick="Account_click" runat="server" CssClass="active"><span class="glyphicon glyphicon-user"></span>Account</asp:LinkButton>
            
            <asp:LinkButton ID="LogOut" onclick="LogOut_click" runat="server"><span class="glyphicon glyphicon-log-out"></span>Logout</asp:LinkButton>
        </div>
    </div>
    <div class ="UploadContent">
        <h1>Update user</h1>
                    <div class="labels" style="margin-top:3%">
                        <label>Username </label>
                        <asp:TextBox ID="userName" runat="server" CssClass="textbox form-control input-sm chat-input "></asp:TextBox>

                        <label>Password</label>
                        <asp:TextBox ID="userPassword" runat="server" CssClass="textbox form-control input-sm chat-input " TextMode="Password"></asp:TextBox>

                        <label>Role</label>
                        <asp:DropDownList ID="roles" runat="server" CssClass="textbox form-control input-sm chat-input " >
                            <asp:ListItem Text="Admin"></asp:ListItem>
                            <asp:ListItem Text ="User"></asp:ListItem>
                        </asp:DropDownList>

                        
                    </div>
        <br/>
                    <div class="wrapper">
                        <span class="group-btn">
                            <asp:Button ID="btnAdd" onClick="Update_Click" runat="server" Text="Update"  CssClass="btn btn-primary btn-md"></asp:Button>
                        </span>
                    </div>
        <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
        <br>
        <br>

    </div>
    </form>
</body>
</html>
