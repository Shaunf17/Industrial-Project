<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Upload.aspx.cs" Inherits="Industrial_Project.webfroms.Upload" %>

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
    <link href="../css/UploadCSS.css" rel="stylesheet" />


    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js'></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.min.js'></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.3/js/bootstrap-datetimepicker.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.min.js"></script>

    <title>Upload</title>
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
                <div class="linkText d-inline">Reports<i class="fa fa-chevron-down linkText" aria-hidden="true" style="float:right; margin-top:6px;"></i></div>
              
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
        <asp:LinkButton ID="UploadButton" onclick="Upload_Click" runat="server" CssClass="nav-link"> <i class="fa fa-upload" aria-hidden="true"></i><div class="linkText d-inline"> Upload</div></asp:LinkButton>
        <asp:LinkButton ID="AccountButton" onclick="Account_Click" runat="server" CssClass="nav-link"><i class="fa fa-user" aria-hidden="true"></i><div class="linkText d-inline"> Account</div></asp:LinkButton>
        <asp:LinkButton ID="LogOut" OnClick="LogOut_click" runat="server" CssClass="nav-link">
               <i class="fa fa-sign-out" aria-hidden="true"></i><div class="linkText d-inline">Log out</div></asp:LinkButton>
    </nav>
    <div class="div-center">
            <div class="content">
                <h1><b>File Upload</b></h1>
                <br/>
                <h4>To upload new yoyo data, simply choose an excel file from your folders</h4>
                <br/>
                <div class="uploadDiv">
                    <div class="imgUpload">
                        <img style="width: 50%;" src="../Pictures/upload.png" />
                    </div>
                </div>
                <br />
                <asp:Panel ID="Panel1" runat="server">
                    <div class="ChooseFile">
                        <asp:FileUpload ID="FileUp" runat="server" />
                    </div>
                    <div class="buttonDiv">
                        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" class="UploadButton"></asp:Button>
                    </div>
                    <br />

                    <asp:Label ID="labelMessage" runat="server" Text="" CssClass="label"/>
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server" />
                </asp:Panel>
            </div>
        </div>   
    </form>

</body>
</html>
