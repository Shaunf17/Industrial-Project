<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainDashboard.aspx.cs" Inherits="Industrial_Project.webfroms.MainDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/MainDashboardCSS.css" rel="stylesheet" />
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Dashboard</title>
</head>
<body>
    <div class="Header">
        <img id="YoyoLogo" src="../Pictures/Yoyo_logo_white_NO_BG.png" />

    </div>

    <div class="SubHeader">
        <ul class ="GraphOptions">
            <li>Time Frame <span class="glyphicon glyphicon-menu-down"></span></li>
            <li>Location <span class="glyphicon glyphicon-menu-down"></span></li>
            <li>Date Range <span class="glyphicon glyphicon-menu-down"></span></li>
            <li>Chart Type <span class="glyphicon glyphicon-menu-down"></span></li>
        </ul>

    </div>

    <div class ="SideBar">
        <div id ="SideBarTop"></div>
        <div class ="SideBarMenu">
            <a href="MainDashboard.aspx" class ="active"><span class="glyphicon glyphicon-th-large"></span>Dashboard</a>
            <a href="Reports.aspx"><span class="glyphicon glyphicon-stats"></span>Reports</a>
            <a href="RawData.aspx"><span class="glyphicon glyphicon-th-list"></span>Raw Data</a>
            <a href="Upload.aspx"><span class="glyphicon glyphicon-upload"></span>Upload</a>
            <form runat="server">
            <asp:LinkButton ID="LogOut" onclick="LogOut_click" runat="server"><span class="glyphicon glyphicon-log-out"></span>Logout</asp:LinkButton>
            </form>
        </div>
    </div>
</body>
</html>
