﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageOtherAccounts.aspx.cs" Inherits="Industrial_Project.webfroms.ManageOtherAccounts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/MainDashboardCSS.css" rel="stylesheet" />
    <%--<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" />--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet" />
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.3/css/bootstrap-datetimepicker.min.css' />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../css/Navbar.css" rel="stylesheet" />



    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js'></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.min.js'></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.3/js/bootstrap-datetimepicker.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.min.js"></script>

    <title>User Management</title>
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>



<body>
    <form id="form1" runat="server">
        <nav class="nav flex-column">
            <div class="nav-item">
                <img id="YoyoLogo" src="../Pictures/logo.png" />
            </div>
            <a class="nav-link" id="active" href="MainDashboard.aspx"><i class="fa fa-th-large" aria-hidden="true"></i>
                <div class="linkText d-inline">Home</div>
            </a>
            <div class="dropdown">
                <a class="nav-link" href="#"><i class="fa fa-bar-chart" aria-hidden="true"></i>
                    <div class="linkText d-inline">Reports<i class="fa fa-chevron-down linkText" aria-hidden="true" style="float: right; margin-top: 6px;"></i></div>
                    
                </a>
                <div class="dropdown-content">
                    <a href="TotalSalesCharts.aspx">Total Sales</a>
                    <a href="PopularityCharts.aspx">Popularity</a>
                    <a href="ActivityCharts.aspx">Activity</a>
                    <a href="PaymentsChart.aspx">Payments</a>
                    <a href="Heatmap.aspx">Heat Map</a>
                    <a href="Comparison.aspx">Comparison</a>
                </div>
            </div>
            <a class="nav-link" href="Tribes.aspx"><i class="fa fa-group" aria-hidden="true"></i>
                <div class="linkText d-inline">Tribes</div>
            </a>
            <asp:LinkButton ID="UploadButton" OnClick="Upload_Click" runat="server" CssClass="nav-link"> <i class="fa fa-upload" aria-hidden="true"></i><div class="linkText d-inline"> Upload</div></asp:LinkButton>
            <asp:LinkButton ID="AccountButton" OnClick="Account_click" runat="server" CssClass="nav-link"><i class="fa fa-user" aria-hidden="true"></i><div class="linkText d-inline"> Account</div></asp:LinkButton>
            <asp:LinkButton ID="LogOut" OnClick="LogOut_click" runat="server" CssClass="nav-link">
               <i class="fa fa-sign-out" aria-hidden="true"></i><div class="linkText d-inline">Log out</div></asp:LinkButton>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4 col-md-offset-4 col-xs-4 col-xs-offset-4 UploadContent">
                    <h1 style="margin-left: 19%; margin-top:48%;">Update details of the user</h1>

                        <div class="labels" style="margin-top: 6%">
                            <label>Username </label>
                            <asp:TextBox ID="userName" runat="server" CssClass="textbox form-control input-sm chat-input "></asp:TextBox>
                            <label>Password</label>
                            <asp:TextBox ID="userPassword" runat="server" CssClass="textbox form-control input-sm chat-input " TextMode="Password"></asp:TextBox>
                            <label>Role</label>
                            <asp:DropDownList ID="roles" runat="server" style="height:45px; font-size:17px;" CssClass="textbox form-control input-sm chat-input ">
                                <asp:ListItem>Admin</asp:ListItem>
                                <asp:ListItem>User</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <br />

                        <div class="wrapper" style="margin-top: 2%;margin-left: 1%">
                            <span class="group-btn">
                                <asp:Button ID="btnAdd" OnClick="Update_Click" runat="server" style="margin-left: 30%; width: 170px; height:45px; font-size:17px;" Text="Update" CssClass="btn btn-primary btn-lg"></asp:Button>
                            </span>
                        </div>
                    <br />
                    <asp:Label ID="Label1" runat="server" Visible="false" style="color:red;font-size:17px;"></asp:Label>
                    <br />
                    <br />
                   
                 </div>
                </div>
        </div>
    </form>



</body>
</html>
