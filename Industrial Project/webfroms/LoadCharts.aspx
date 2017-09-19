﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoadCharts.aspx.cs" Inherits="Industrial_Project.webfroms.LoadCharts" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/StyleSheet1.css" rel="stylesheet" />
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet" />
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.3/css/bootstrap-datetimepicker.min.css' />
    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' />


    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js'></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.min.js'></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.3/js/bootstrap-datetimepicker.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.min.js"></script>


    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="outletRef">Outlet Reference</label>
                        <asp:TextBox ID="outletReference" type='text' runat="server" CssClass="form-control" Text="238"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="startDate">startDate</label>
                        <div class='input-group date' id='datetimepicker1'>
                            <!--<input type='text' class="form-control" />-->
                            <asp:TextBox ID="startingDate" type='text' runat="server" CssClass="form-control" Text="2015-09-15"></asp:TextBox>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="endDate">endDate</label>
                        <div class='input-group date' id='datetimepicker2'>
                            <!--<input type='text' class="form-control" />-->
                            <asp:TextBox ID="endingDate" type='text' runat="server" CssClass="form-control" Text="2015-09-29"></asp:TextBox>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>

                    </div>
                </div>
            </div>

            <div>
                <canvas id="myChart"></canvas>
            </div>
        </div>

        <script>

            //global variables

            var chartData;
            var columnData;

            window.onload = function() {
                $.ajax({
                    url: "LoadCharts.aspx/intializeChart",
                    data: "",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: OnSuccess,
                    error: function () {
                        alert("Error loading method!");
                    }

                }).done(function () {
                    alert("Method worked.");
                });
                dbConnect("GetChartData");
                dbConnect("GetColumnData");
                drawChart();
            };

            $(document).ready(function () {
                $(".date").change(function () {
                    //alert("The text has been changed." + chartData);


                    dbConnect("GetChartData");
                    dbConnect("GetColumnData");
                    drawChart();
                });
            });


            function dbConnect(str) {
                //alert("The string is:" + str + encodeURIComponent(str));

                $.ajax({
                    url: "LoadCharts.aspx/"+str,
                    data: "",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        if (str == "GetChartData") chartData = data.d;
                        if (str == "GetColumnData") columnData = data.d;
                    },
                    error: function () {
                        alert("Error loading data!");
                    }


                }).done(function () {
                    //alert("Done.");
                });
            }


            function drawChart() {

                // var chartData = chartData;

                var ctx = document.getElementById('myChart').getContext('2d');

                var myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: columnData,
                        datasets: [{
                            label: 'Total Sales',
                            data: chartData,
                            backgroundColor: "rgba(153,255,51,0.6)"
                        }]
                    }
                });
            }

        </script>
        <script src="../js/LoadCharts.js"></script>
        <div style="margin-left: 120px">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>
    </form>

</body>
</html>
