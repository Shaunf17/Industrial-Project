<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DifferentNavigation.aspx.cs" Inherits="Industrial_Project.webfroms.DifferentNavigation" %>


<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="../css/Navbar.css" rel="stylesheet" />

</head>

<body>
    <form runat="server">
    
    <nav class="nav flex-column">
        <div class="nav-item">
            <img id="YoyoLogo" src="../Pictures/logo.png" />
        </div>
        <a class="nav-link" id="active" href="MainDashboard.aspx"><i class="fa fa-th-large" aria-hidden="true"></i>
            <div class="linkText d-inline">Home</div>
        </a>
        <div class="dropdown">
            <a class="nav-link" href="Reports.aspx"><i class="fa fa-bar-chart" aria-hidden="true"></i>
                <div class="linkText d-inline">Reports</div><i class="fa fa-chevron-down linkText" aria-hidden="true" style="float:right; margin-top:6px;"></i>
              
                </a>
            <div class="dropdown-content">
                <a href="#">Total Sales</a>
                <a href="#">Popularity</a>
                <a href="#">Activity</a>
                <a href="#">Heat Map</a>
                <a href="#">Comparison</a>
            </div>
        </div>
        <a class="nav-link" href="RawData.aspx"><i class="fa fa-th-list" aria-hidden="true"></i>
            <div class="linkText d-inline">Raw Data</div>
        </a>
        <a class="nav-link" href="Upload.aspx"><i class="fa fa-upload" aria-hidden="true"></i>
            <div class="linkText d-inline">Upload</div>
        </a>
     <%--   <a class="nav-link" href="#"><i class="fa fa-sign-out" aria-hidden="true"></i>
            <div class="linkText d-inline">Log out</div>--%>
            <asp:LinkButton ID="LogOut" OnClick="LogOut_click" runat="server" CssClass="nav-link">
               <i class="fa fa-sign-out" aria-hidden="true"></i><div class="linkText d-inline">Log out</div></asp:LinkButton>
       <%-- </a>--%>
    </nav>

        <div class="back">
    </div>
        </form>

    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
</body>
</html>

