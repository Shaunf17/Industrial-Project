<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardChart.aspx.cs" Inherits="Industrial_Project.webfroms.DashboardChart" %>

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
        <div>
            <canvas id="myChart"></canvas>
        </div>

        <script>

            //global variables
            var chartData;
            var myChart;
            var chartLabels;
            
            window.onload = function () {
                $.when(
                    $.ajax({
                        url: "DashboardChart.aspx/getGraphData",
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
                    myChart = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            datasets: [{
                                label:'Revenue',
                                data: chartData,
                                backgroundColor: colors
                            }],
                            labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
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
                                fontSize: 24,
                                fontColor: 'rgb(0, 0, 0)'
                            },
                            scales: {
                                xAxes: [{
                                    ticks: {
                                        fontSize: 24
                                    }
                                }]
                            }

                        }
                    });

                });
            };
        </script>


    </form>

</body>
</html>
