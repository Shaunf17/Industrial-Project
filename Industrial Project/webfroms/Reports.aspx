<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Industrial_Project.webfroms.Reports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/MainDashboardCSS.css" rel="stylesheet" />
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Reports</title>
</head>
<body>
    <div class="Header">
        <img id="YoyoLogo" src="../Pictures/Yoyo_logo_white_NO_BG.png" />

    </div>

    <div class="SubHeader">
        <ul class ="GraphOptions">
            <li>Time Frame</li>
            <li>Location</li>
            <li>Date Range</li>
            <li>Chart Type</li>
        </ul>
    </div>

    <div class ="SideBar">
        <div id ="SideBarTop"></div>
        <div class ="SideBarMenu">
            <a href="MainDashboard.aspx"><span class="glyphicon glyphicon-th-large"></span>Dashboard</a>
            <a href="Reports.aspx" class ="active"><span class="glyphicon glyphicon-stats"></span>Reports</a>
            <a href="RawData.aspx"><span class="glyphicon glyphicon-th-list"></span>Raw Data</a>
            <a href="Upload.aspx"><span class="glyphicon glyphicon-upload"></span>Upload</a>
        </div>
    </div>
</body>
</html>