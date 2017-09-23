<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TimeFrameReports.aspx.cs" Inherits="Industrial_Project.webfroms.TimeFrameReports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/StyleSheet1.css" rel="stylesheet" />
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet" />
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.3/css/bootstrap-datetimepicker.min.css' />
    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' />
    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
        rel="stylesheet" type="text/css" />

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
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:DropDownList ID="timeFrame" runat="server" CssClass="textbox form-control input-sm chat-input dropListSelect">
            <asp:ListItem Value="Last week">Last week</asp:ListItem>
            <asp:ListItem Value="Last month">Last month</asp:ListItem>
            <asp:ListItem Value="Last 3 months">Last 3 months</asp:ListItem>
            <asp:ListItem Value="Last 6 months">Last 6 months</asp:ListItem>
            <asp:ListItem Value="Last year">Last year</asp:ListItem>
        </asp:DropDownList>

        <div>
            <canvas id="myChart" style="width:30%;height:40%;margin: 15px auto;"></canvas>
        </div>

        <div style="margin-left: 120px">
        </div>

        <script>

            
            var locations = [];
            var chartData;
            var columnData;
            var config = {
                type: 'pie',
                data: {
                },
                options: {
                    responsive: true,
                    title: {
                        display: true,
                        text: 'Total Sales'
                    }
                }
            };
            var colorNames = Object.keys(window.chartColors);

            window.onload = function () {

                var ctx = document.getElementById("myChart").getContext("2d");
                window.myPie = new Chart(ctx, config);

            };
          
            $(document).ready(function () {
                $(".dropListSelect").change(function () {
                    var sel = document.getElementById('timeFrame');

                    for (var index = 0; index < config.data.labels.length; ++index) {
                        config.data.datasets.pop();
                    }

                    var listBoxes = document.getElementById('timeFrame');
                    var selected = 0;
                    var listBox;
                    for (var i = 0; i < listBoxes.options.length; i++) {
                        if (listBoxes.options[i].selected) {
                            listBox = listBoxes.options[i].value;
                            selected++;
                        }
                    }
                    var obj = {};
                    obj.timeFrame = listBox;
                    $.when(
                        jQuery.ajax({
                            //async: false,
                            url: "TimeFrameReports.aspx/GetColumnData",
                            data: JSON.stringify(obj),
                            dataType: "json",
                            type: "POST",
                            contentType: " application/json; charset=utf-8",
                            success: function (data) {
                                columnData = data.d;
                            },
                            error: function () {
                            }
                        }),
                    jQuery.ajax({
                        //async: false,
                        url: "TimeFrameReports.aspx/getGraphData",
                        data: JSON.stringify(obj),
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            chartData = data.d;
                        },
                        error: function () {
                        }
                    })
                    ).then(function () {

                        config.data.labels = columnData;

                        if (chartData[0] !== null) {

                            //var colorName = colorNames[config.data.labels.length % colorNames.length];
                            var newColor = window.chartColors[colorName];
                            var newDataset = {
                                backgroundColor: [],//"rgba(153,255,51,0.6)",
                                borderColor: [],//"rgba(153,255,51,0.6)",
                                data: [],
                                fill: false
                            };

                            for (var index = 0; index < config.data.labels.length; ++index) {

                                var colorName = colorNames[index % colorNames.length];;
                                var newColor = window.chartColors[colorName];
                                newDataset.backgroundColor.push(newColor);
                                
                                newDataset.data.push(chartData[index]);
                            }

                            config.data.datasets.push(newDataset);

                        }
                        window.myPie.update();
                    });
                });
                });

        </script>

         <script src="../js/LoadCharts.js"></script>
    </form>

</body>
</html>

