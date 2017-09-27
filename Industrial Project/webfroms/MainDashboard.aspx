<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainDashboard.aspx.cs" Inherits="Industrial_Project.webfroms.MainDashboard" %>

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



    <title>Dashboard</title>
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
                <a href="#">Heat Map</a>
                <a href="Comparison.aspx">Comparison</a>
            </div>
        </div>
        <asp:LinkButton ID="UpButton" onclick="Upload_Click" runat="server" CssClass="nav-link"> <i class="fa fa-upload" aria-hidden="true"></i><div class="linkText d-inline"> Upload</div></asp:LinkButton>
        <asp:LinkButton ID="AccountButton" onclick="Account_Click" runat="server" CssClass="nav-link"><i class="fa fa-user" aria-hidden="true"></i><div class="linkText d-inline"> Account</div></asp:LinkButton>
        <asp:LinkButton ID="LogOut" OnClick="LogOut_click" runat="server" CssClass="nav-link">
               <i class="fa fa-sign-out" aria-hidden="true"></i><div class="linkText d-inline">Log out</div></asp:LinkButton>
    </nav>
       
    </form>
    <div class="background">
        <div class="container2Header">
            <h4><b>Statistics - Previous Week</b></h4>
        </div>

        <div class="container2">

            <%--Circle 1--%>
            <div class="div1">    
            <svg viewBox="0 0 200 200" preserveAspectRatio="xMinYMin meet">
                <circle cx="100" cy="100" r="90" stroke="#acabab" stroke-width="3" fill="#bababa" />
                <text x="67" y="105" font-family="calibri" font-size="25px" fill="black" font-weight="bold">£1480</text>
            </svg> 
                <asp:Label ID="Label1" runat="server" Text="Label" CssClass="label1">Total Profit</asp:Label>
            </div>


            <%--Circle 2--%>
             <div class="div1">  
            <svg viewBox="0 0 200 200" preserveAspectRatio="xMinYMin meet">
                <circle cx="100" cy="100" r="90" stroke="#a2c9d0" stroke-width="3" fill="#c2dbe9" />
                 <text x="67" y="105" font-family="calibri" font-size="25px" fill="black" font-weight="bold">Mono</text>
            </svg> <asp:Label ID="Label2" runat="server" Text="Label" CssClass="label1">Most Popular</asp:Label>

             </div>

            <%--Circle 3--%>
             <div class="div1">     
            <svg viewBox="0 0 200 200" preserveAspectRatio="xMinYMin meet">
                <circle cx="100" cy="100" r="90" stroke="#acabab" stroke-width="3" fill="#bababa" />
                <text x="67" y="105" font-family="calibri" font-size="25px" fill="black" font-weight="bold">£38.76</text>
            </svg> <asp:Label ID="Label3" runat="server" Text="Label" CssClass="label1">Total Redemptions</asp:Label>

             </div>

            <%--Circle 4--%>
             <div class="div1">              
            <svg viewBox="0 0 200 200" preserveAspectRatio="xMinYMin meet">
               <circle cx="100" cy="100" r="90" stroke="#a2c9d0" stroke-width="3" fill="#c2dbe9" />  
                <text x="67" y="105" font-family="calibri" font-size="25px" fill="black" font-weight="bold">Air Bar</text>
            </svg> 
                 <asp:Label ID="Label4" runat="server" Text="Label" CssClass="label1">Least Popular</asp:Label>         
             </div>
        </div>

        <%--Overview Graph--%>
        <div class="divContainer" style="float: left;">
            <br />
            <div id="graphDiv">
                <canvas id="myChart"></canvas>
            </div>
        </div>

        <%--Users Tally--%>
        <div style="text-align: center; background-color: #c2dbe9" class="divContainer">
            <h1><b>231</b></h1>
            <h2>yoyo users</h2>
            <br />
            <img src="../Pictures/users.png" />
            
        </div>
    </div>


      <%--  !! To be used at later stage !! --%>

       <%-- <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12" style="background-color: #b2b2b2; color: black; font-size: 12px;">
                    <div style = "font-family: Calibri; font-size: 25px; font-weight:600 !important; float: left;">
                    <h3><b>Daily Statistics</b></h3>
                        </div>
                     <div style = "font-family: Calibri; DISPLAY: inline-block;float: right !important;">
                    <h3><b>Week:</b> 13th Sep 2017</h3>
                        </div>
                    
                </div>


                <div class="col-sm-12" style="background-color: #e1dfdf; margin-bottom: 20px; border-width: 10px; border-color: #000000;">
                    <div class="col-sm-3" style="background-color: none;">
                        <br />
                        <br />
                        <div id="circle">
                            <div class="label1">
                                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                            </div>
                        </div>
                        <div style="text-align:center;">
                        <h4><b>Total Revenue</b></h4>
                            </div>
                    </div>

                    <div class="col-sm-3" style="background-color: none;">
                        <br />
                        <br />
                        <div id="circle" style="background-color: #b0c0d3; border-color: #95b0ca">

                            <div class="label1">
                                <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                            </div>
                        </div>
                         <div style="text-align:center;">
                        <h4><b>Most Popular</b></h4>
                            </div>
                    </div>
                    <div class="col-sm-3" style="background-color: none;">
                        <br />
                        <br />
                        <div id="circle">
                            <div class="label1">
                                <asp:Literal ID="Literal3" runat="server"></asp:Literal>
                            </div>
                        </div>
                        <div style="text-align:center;">
                        <h4><b>Total Redemptions</b></h4>
                            </div>
                    </div>

                    <div class="col-sm-3" style="background-color: none;">
                        <br />
                        <br />
                        <div id="circle" style="background-color: #b0c0d3; border-color: #95b0ca">
                            <div class="label1">
                                <asp:Literal ID="Literal4" runat="server"></asp:Literal>
                            </div>
                        </div>
                        <div style="text-align:center;">
                        <h4><b>Least Popular</b></h4>
                            </div>
                    </div>
                </div>
                <br />
                <br />--%>
       <%-- </div>
    </div>--%>
            <script>

            //global variables
            var chartData;
            var myChart;
            var chartLabels;
            
            window.onload = function () {
                $.when(
                    $.ajax({
                        url: "MainDashboard.aspx/getBarData",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            chartData = data.d;
                            console.log(chartData);
                        },
                        error: function () {
                            alert("Error loading chart data!");
                        }
                    })
                   
                )
                .then(function () {

                    var colors = [];
                    for (i =0; i < chartData.length;i++)
                    {
                        var color;
                        if(chartData[i]>0 && chartData[i]<=20)
                        {
                            color = "rgb(51, 102, 255)";
                        }
                        else if (chartData[i] > 20 && chartData[i] <= 40) {
                            color = "rgb(51, 204, 255)";
                        }
                        else if (chartData[i] > 40 && chartData[i] <= 60) {
                            color = "rgb(255, 153, 102)";
                        }
                        else if (chartData[i] > 60 && chartData[i] <= 80) {
                            color = "rgb(255, 128, 0)";
                        }
                        else if (chartData[i] > 80 && chartData[i] <= 100) {
                            color = "rgb(51, 102, 255)";
                        }
                        else
                        {
                            color = "rgb(230, 0, 0)";
                        }
                        colors.push(color);
                    }

                    console.log(chartData);
                    var ctx = document.getElementById("myChart").getContext("2d");
                    ctx.canvas.width = 200;
                    ctx.canvas.height = 170;
                    myChart = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            datasets: [{
                                label:'Revenue',
                                data: chartData,
                                backgroundColor: colors
                            }],
                            labels: ['Mon', 'Tues', 'Wed', 'Thurs', 'Fri', 'Sat', 'Sun']
                        },
                        options: {
                            responsive: true,
                            legend: {
                                display: false,

                            },
                            title: {
                                display: true,
                                text: 'Revenue Overview',
                                position: 'top',
                                fontSize: 16,
                                fontColor: 'rgb(0, 0, 0)'
                            },
                            scales: {
                                xAxes: [{
                                    ticks: {
                                        fontSize: 14
                                    }
                                }]
                            }

                        }
                    });

                });
            };
        </script>

</body>
</html>
