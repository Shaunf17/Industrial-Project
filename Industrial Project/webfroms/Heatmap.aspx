<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Heatmap.aspx.cs" Inherits="Industrial_Project.webfroms.Heatmap" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet" />
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.3/css/bootstrap-datetimepicker.min.css' />
    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' />
    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
        rel="stylesheet" type="text/css" />

    <link href="../css/MainDashboardCSS.css" rel="stylesheet" />
    <link href="../css/Navbar.css" rel="stylesheet" />
    <link rel="stylesheet" href="../css/HeatMapStyle.css" />
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js'></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.min.js'></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.3/js/bootstrap-datetimepicker.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.min.js"></script>
    <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js" type="text/javascript"></script>

    <!--Chart.js && Utils && Analytics-->
    <script src="../js/analytics.js"></script>
    <script src="../js/utils.js"></script>
    <script src="../js/Chart.bundle.js"></script>

    <title>Heat Map</title>
</head>
<body>
    <form id="form1" runat="server">

        <nav class="nav flex-column" style="z-index: 1;">
            <div class="nav-item">
                <img id="YoyoLogo" src="../Pictures/logo.png" />
            </div>
            <a class="nav-link" id="active" href="MainDashboard.aspx" style="display: inline-flex; padding: 10px 65px 5px 25px;"><i class="fa fa-th-large" aria-hidden="true"></i>
                <div class="linkText" style="padding: 0px 0px 10px 5px; margin-top: -5px;">Home</div>
            </a>
            <br />
            <div class="dropdown">
                <a class="nav-link" href="#" style="display: inline-flex; padding: 10px 20px 5px 25px;"><i class="fa fa-bar-chart" aria-hidden="true"></i>
                    <div class="linkText" style="padding: 0px 0px 10px 5px; margin-top: -5px;">Reports  <i class="fa fa-chevron-down linkText" aria-hidden="true" style="float: right; margin-top: 5px; margin-left: 5px;"></i></div>

                </a>
                <div class="dropdown-content">
                    <a href="Heatmap.aspx">Total Sales</a>
                    <a href="PopularityCharts.aspx">Popularity</a>
                    <a href="ActivityCharts.aspx">Activity</a>
                    <a href="PaymentsChart.aspx">Payments</a>
                    <a href="Heatmap.aspx">Heat Map</a>
                    <a href="Comparison.aspx">Comparison</a>
                </div>
            </div>
            <br />
            <a class="nav-link" href="Tribes.aspx" style="display: inline-flex; padding: 10px 65px 5px 25px;"><i class="fa fa-group" aria-hidden="true"></i>
                <div class="linkText" style="padding: 0px 0px 10px 5px; margin-top: -5px;">Tribes</div>
            </a>
            <asp:LinkButton ID="UploadButton" OnClick="Upload_Click" runat="server" CssClass="nav-link" Style="display: inline-flex; padding: 10px 55px 5px 25px;"> <i class="fa fa-upload" aria-hidden="true"></i><div class="linkText" style="padding: 0px 0px 10px 5px; margin-top: -5px;"> Upload</div></asp:LinkButton><br />
            <asp:LinkButton ID="AccountButton" OnClick="AccClick" runat="server" CssClass="nav-link" Style="display: inline-flex; padding: 10px 55px 5px 25px;"><i class="fa fa-user" aria-hidden="true"></i><div class="linkText" style="padding: 0px 0px 10px 5px; margin-top: -5px;"> Account</div></asp:LinkButton><br />
            <asp:LinkButton ID="LogOut" OnClick="LogOut_click" runat="server" CssClass="nav-link" Style="display: inline-flex; padding: 10px 55px 5px 25px;">
               <i class="fa fa-sign-out" aria-hidden="true"></i><div class="linkText" style="padding: 0px 0px 10px 5px; margin-top: -5px;">Log out</div></asp:LinkButton>
        </nav>

        <div class="container-fluid chartContainer" style="z-index: -1;margin-left:10%;">
            <div class="row">
                <h1 class="col-md-4 col-md-offset-5">Heat Map</h1>
             </div>
            <div class="row">


                
                <div class="col-md-2 col-md-offset-1">
                    <div class="form-group">
                        <label for="startDate">Date</label>
                        <div class='input-group date locationChange' id='datetimepicker1'>
                            <!--<input type='text' class="form-control" />-->
                            <asp:TextBox ID="startingDate" type='text' runat="server" CssClass="form-control" Text="2015-09-15" style="z-index: -1;"></asp:TextBox>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" >
                <br/>
                <br/>

                <div class="col-md-10 col-md-offset-1">
            <asp:GridView ID="GridView1" runat="server"  CssClass="table table-hover table-striped" ></asp:GridView>
        </div>
            </div>
        </div>

<script>
        $(function () {
            //$('tr > td:odd').each(function (index) {
            $('table td:nth-child(1) ~ td').each(function () {
                var scale = [['bad',5], ['vPoor', 10], ['poor', 20], ['avg', 50], ['good', 100], ['vGood', 200], ['great', 10000]];
                var score = $(this).text();
                for (var i = 0; i < scale.length; i++) {
                    if (score <= scale[i][1]) {
                        $(this).addClass(scale[i][0]);
                    }
                }
            });
        });

      

   </script>      

          <script src="../js/LoadCharts.js"></script>
    </form>

</body>
</html>
