<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoadCharts.aspx.cs" Inherits="Industrial_Project.webfroms.LoadCharts" %>


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
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        <div class="container">
            <div class="row">


                <div class="col-md-2 col-md-offset-2">
                    <div class="form-group">
                        <label for="chartType">Chart Type</label><br />
                        <asp:DropDownList ID="chartType" runat="server" CssClass="textbox form-control input-sm chat-input chartType">
                            <asp:ListItem Value="Bar">Bar</asp:ListItem>
                            <asp:ListItem Value="Pie">Pie</asp:ListItem>
                            <asp:ListItem Value="Line">Line</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group">
                        <label for="startDate">startDate</label>
                        <div class='input-group date locationChange' id='datetimepicker1'>
                            <!--<input type='text' class="form-control" />-->
                            <asp:TextBox ID="startingDate" type='text' runat="server" CssClass="form-control" Text="2015-09-15"></asp:TextBox>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group">
                        <label for="endDate">endDate</label>
                        <div class='input-group date locationChange' id='datetimepicker2'>
                            <!--<input type='text' class="form-control" />-->
                            <asp:TextBox ID="endingDate" type='text' runat="server" CssClass="form-control" Text="2015-09-29"></asp:TextBox>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 " id="timeFrameCol">
                    <div class="form-group">
                        <label for="timeFrame">Time Frame</label><br />
                        <asp:DropDownList ID="timeFrame" runat="server" CssClass="textbox form-control input-sm chat-input dropListSelect">
                            <asp:ListItem Value="None">None</asp:ListItem>
                            <asp:ListItem Value="Last week">Last week</asp:ListItem>
                            <asp:ListItem Value="Last month">Last month</asp:ListItem>
                            <asp:ListItem Value="Last 3 months">Last 3 months</asp:ListItem>
                            <asp:ListItem Value="Last 6 months">Last 6 months</asp:ListItem>
                            <asp:ListItem Value="Last year">Last year</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div id="locationDiv" class="col-md-2">
                    <div class="form-group">
                        <div class='input-group'>
                            <!--locationChange-->
                            <label for="outletLocation">Location</label><br />
                            <asp:ListBox ID="outletLocation" runat="server" SelectionMode="Multiple"></asp:ListBox>
                        </div>
                    </div>
                </div>


            </div>

            <div>
                <canvas id="canvas"></canvas>
                <br />
            </div>

        </div>

        <script>

            //global variables


            var chartData;// = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
            var columnData = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"];
            var lineConfig = {
                type: 'line',
                data: {
                    labels: columnData,
                    datasets: [{}]
                },
                options: {
                    responsive: true,
                    title: {
                        display: true,
                        text: 'Total Sales',
                        position: 'top',
                        fontSize: 24,
                        fontColor: 'rgb(0, 0, 0)'
                    },
                    tooltips: {
                        mode: 'index',
                        intersect: false,
                    },
                    hover: {
                        mode: 'nearest',
                        intersect: true
                    },
                    scales: {
                        xAxes: [{
                            display: true,
                            scaleLabel: {
                                display: true,
                                labelString: 'Month'
                            }
                        }],
                        yAxes: [{
                            display: true,
                            scaleLabel: {
                                display: true,
                                labelString: 'Value'
                            }
                        }]
                    }
                }
            };

            var barConfig = {
                type: 'bar',
                data: {
                    datasets: [{}]
                },
                options: {
                    responsive: true,
                    legend: {
                        display: false,

                    },
                    title: {
                        display: true,
                        text: 'Total Sales',
                        position: 'top',
                        fontSize: 24,
                        fontColor: 'rgb(0, 0, 0)'
                    },
                    scales: {
                        xAxes: [{
                            ticks: {
                                fontSize: 13,
                                autoSkip: false
                            }
                        }]
                    }
                }
            };


            var pieConfig = {
                type: 'pie',
                data: {
                    datasets: [{}]
                },
                options: {
                    responsive: true,
                    title: {
                        display: true,
                        text: 'Total Sales',
                        position: 'top',
                        fontSize: 24,
                        fontColor: 'rgb(0, 0, 0)'
                    }
                }
            };
            var colorNames = Object.keys(window.chartColors);



            window.onload = function () {

                var ctx = document.getElementById("canvas").getContext("2d");
                window.myChart = new Chart(ctx, barConfig);
                document.getElementById("locationDiv").style.display = "none";

            };
            $(document).ready(function () {
                $(".chartType").change(function () {

                    var listBoxes = document.getElementById('chartType');
                    var selected = 0;
                    var listBox;
                    for (var i = 0; i < listBoxes.options.length; i++) {
                        if (listBoxes.options[i].selected) {
                            listBox = listBoxes.options[i].value;
                            selected++;
                        }
                    }

                    if (listBox === "Bar") {
                        var labelsLength = barConfig.data.datasets.length;
                        barConfig.data.labels = [];
                        for (var index = 0; index < labelsLength; index++) {
                            barConfig.data.datasets.pop();
                        }
                        labelsLength = pieConfig.data.datasets.length;
                        pieConfig.data.labels = [];
                        for (var index = 0; index < labelsLength; index++) {
                            pieConfig.data.datasets.pop();
                        }
                        labelsLength = lineConfig.data.datasets.length;
                        lineConfig.data.labels = [];
                        for (var index = 0; index < labelsLength; index++) {
                            lineConfig.data.datasets.pop();
                        }
                        window.myChart.destroy();
                        var ctx = document.getElementById("canvas").getContext("2d");
                        window.myChart = new Chart(ctx, barConfig);
                        document.getElementById("locationDiv").style.display = "none";
                        document.getElementById("timeFrameCol").style.display = "block";
                        document.getElementById("timeFrame").selectedIndex = "0";
                        // Multiselect deselection
                        $('option', $('#outletLocation')).each(function (element) {
                            $(this).removeAttr('selected').prop('selected', false);
                        });
                        $("#outletLocation").multiselect('refresh');
                    }
                    else if (listBox === "Pie") {
                        var labelsLength = barConfig.data.datasets.length;
                        barConfig.data.labels = [];
                        for (var index = 0; index < labelsLength; index++) {
                            barConfig.data.datasets.pop();
                        }
                        labelsLength = pieConfig.data.datasets.length;
                        pieConfig.data.labels = [];
                        for (var index = 0; index < labelsLength; index++) {
                            pieConfig.data.datasets.pop();
                        }
                        labelsLength = lineConfig.data.datasets.length;
                        lineConfig.data.labels = [];
                        for (var index = 0; index < labelsLength; index++) {
                            lineConfig.data.datasets.pop();
                        }
                        window.myChart.destroy();
                        var ctx = document.getElementById("canvas").getContext("2d");
                        window.myChart = new Chart(ctx, pieConfig);
                        document.getElementById("locationDiv").style.display = "none";
                        document.getElementById("timeFrameCol").style.display = "block";
                        document.getElementById("timeFrame").selectedIndex = "0";
                        // Multiselect deselection
                        $('option', $('#outletLocation')).each(function (element) {
                            $(this).removeAttr('selected').prop('selected', false);
                        });
                        $("#outletLocation").multiselect('refresh');
                    }
                    else if (listBox === "Line") {
                        var labelsLength = barConfig.data.datasets.length;
                        barConfig.data.labels = [];
                        for (var index = 0; index < labelsLength; index++) {
                            barConfig.data.datasets.pop();
                        }
                        labelsLength = pieConfig.data.datasets.length;
                        pieConfig.data.labels = [];
                        for (var index = 0; index < labelsLength; index++) {
                            pieConfig.data.datasets.pop();
                        }
                        labelsLength = lineConfig.data.datasets.length;
                        lineConfig.data.labels = [];
                        for (var index = 0; index < labelsLength; index++) {
                            lineConfig.data.datasets.pop();
                        }
                        window.myChart.destroy();
                        var ctx = document.getElementById("canvas").getContext("2d");
                        window.myChart = new Chart(ctx, lineConfig);
                        document.getElementById("locationDiv").style.display = "block";
                        document.getElementById("timeFrameCol").style.display = "none";
                        document.getElementById("timeFrame").selectedIndex = "0";
                        // Multiselect deselection
                        $('option', $('#outletLocation')).each(function (element) {
                            $(this).removeAttr('selected').prop('selected', false);
                        });
                        $("#outletLocation").multiselect('refresh');
                    }
                });
            });

            $(document).ready(function () {
                $(".dropListSelect").change(function () {

                    if (window.myChart.config.type === "pie") {


                        var sel = document.getElementById('timeFrame');

                        for (var index = 0; index < pieConfig.data.labels.length; ++index) {
                            pieConfig.data.datasets.pop();
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
                        if (listBox === "None") {
                            pieConfig.data.labels = [];
                            window.myChart.update();
                        }
                        else {
                            var obj = {};
                            obj.timeFrame = listBox;
                            $.when(
                                jQuery.ajax({
                                    //async: false,
                                    url: "LoadCharts.aspx/GetBarPieColumnData",
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
                                url: "LoadCharts.aspx/GetBarPieGraphData",
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

                                pieConfig.data.labels = columnData;

                                if (chartData[0] !== null) {

                                    //var colorName = colorNames[pieConfig.data.labels.length % colorNames.length];
                                    var newColor = window.chartColors[colorName];
                                    var newDataset = {
                                        backgroundColor: [],//"rgba(153,255,51,0.6)",
                                        borderColor: [],//"rgba(153,255,51,0.6)",
                                        data: [],
                                        fill: false
                                    };

                                    for (var index = 0; index < pieConfig.data.labels.length; ++index) {

                                        var colorName = colorNames[index % colorNames.length];;
                                        var newColor = window.chartColors[colorName];
                                        newDataset.backgroundColor.push(newColor);

                                        newDataset.data.push(chartData[index]);
                                    }

                                    pieConfig.data.datasets.push(newDataset);

                                }
                                window.myChart.update();
                            });
                        }
                    }
                    else if (window.myChart.config.type === "bar") {


                        var sel = document.getElementById('timeFrame');

                        for (var index = 0; index < barConfig.data.labels.length; ++index) {
                            barConfig.data.datasets.pop();
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
                        if (listBox === "None") {
                            barConfig.data.labels = [];
                            window.myChart.update();
                        }
                        else {
                            var obj = {};
                            obj.timeFrame = listBox;
                            $.when(
                                jQuery.ajax({
                                    //async: false,
                                    url: "LoadCharts.aspx/GetBarPieColumnData",
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
                                url: "LoadCharts.aspx/GetBarPieGraphData",
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

                                barConfig.data.labels = columnData;

                                if (chartData[0] !== null) {

                                    //var colorName = colorNames[pieConfig.data.labels.length % colorNames.length];
                                    var newColor = window.chartColors[colorName];
                                    var newDataset = {
                                        backgroundColor: [],//"rgba(153,255,51,0.6)",
                                        borderColor: [],//"rgba(153,255,51,0.6)",
                                        data: [],
                                        fill: false
                                    };

                                    for (var index = 0; index < barConfig.data.labels.length; ++index) {

                                        var colorName = colorNames[index % colorNames.length];;
                                        var newColor = window.chartColors[colorName];
                                        newDataset.backgroundColor.push(newColor);

                                        newDataset.data.push(chartData[index]);
                                    }

                                    barConfig.data.datasets.push(newDataset);

                                }
                                window.myChart.update();
                            });
                        }
                    }
                });
            });

            $(document).ready(function () {
                $(".locationChange").change(function () {

                    if (window.myChart.config.type === "line") {
                        var labelsLength = lineConfig.data.datasets.length;
                        for (var index = 0; index < labelsLength; index++) {
                            lineConfig.data.datasets.pop();
                        }

                        //alert("Location/Date Change");

                        //$('#outletLocation').find(":selected")

                        //var index = 0;
                        //$('#outletLocation option').find(":selected").each(function () {
                        //    locations[index].val() = $(this).text();
                        //    index++;
                        //});
                        var outputMessage = "The following locations have no data for this date range: ";
                        var values = "";
                        var selected = 0;
                        var listBox = document.getElementById('outletLocation');
                        for (var i = 0; i < listBox.options.length; i++) {
                            if (listBox.options[i].selected) {
                                values += listBox.options[i].value + "%";
                                selected++;
                            }
                        }
                        if (values === "") values = "None selected";
                        var locations = [];
                        locations = values.split('%');

                        //alert(locations[0]);

                        if (locations[0] !== "None selected") {

                            //alert("Step 1");
                            for (i = 0; i < locations.length - 1; i++) {

                                //alert("Step 2 " + locations[i]);
                                var col = {};
                                col.outR = $.trim(locations[0]);
                                col.startDat = $.trim($("[id*=startingDate]").val());
                                col.endDat = $.trim($("[id*=endingDate]").val());
                                (function (i) {
                                    jQuery.ajax({
                                        async: false,
                                        url: "LoadCharts.aspx/GetColumnData",
                                        data: JSON.stringify(col),
                                        dataType: "json",
                                        type: "POST",
                                        contentType: " application/json; charset=utf-8",
                                        success: function (data) {
                                            columnData = data.d;

                                        },
                                        error: function () {
                                            //alert("Error loading data!");
                                            //columnData = null;
                                        }
                                    });
                                    lineConfig.data.labels = columnData;


                                    var obj = {};
                                    obj.outR = $.trim(locations[i]);
                                    obj.startDat = $.trim($("[id*=startingDate]").val());
                                    obj.endDat = $.trim($("[id*=endingDate]").val());
                                    jQuery.ajax({
                                        async: false,
                                        url: "LoadCharts.aspx/initializeChart",
                                        data: JSON.stringify(obj),
                                        dataType: "json",
                                        type: "POST",
                                        contentType: "application/json; charset=utf-8",
                                        success: function (data) {
                                            chartData = data.d;

                                            //alert(chartData);
                                        },
                                        error: function () {
                                            //chartData = -1;
                                            //outputMessage += loc[i] + ", ";
                                            alert(locations[i]);
                                        }
                                    });

                                    //if (chartData != -1) {
                                    var colorName = colorNames[lineConfig.data.datasets.length % colorNames.length];
                                    var newColor = window.chartColors[colorName];
                                    var loc = values.split('%');
                                    var newDataset = {
                                        label: loc[i],
                                        backgroundColor: newColor,//"rgba(153,255,51,0.6)",
                                        borderColor: newColor,//"rgba(153,255,51,0.6)",
                                        data: [],
                                        fill: false
                                    };

                                    for (var index = 0; index < lineConfig.data.labels.length; ++index) {
                                        //alert(chartData[index]);
                                        if (chartData[index] === 0) newDataset.data.push(null);
                                        else newDataset.data.push(chartData[index]);
                                    }

                                    lineConfig.data.datasets.push(newDataset);
                                    window.myChart.update();

                                })(i);
                            }
                        }
                    }
                    else if (window.myChart.config.type === "bar" || window.myChart.config.type === "pie") {
                        document.getElementById("timeFrame").selectedIndex = "0";
                        var labelsLength = window.myChart.data.datasets.length;
                        for (var index = 0; index < labelsLength; index++) {
                            window.myChart.config.data.datasets.pop();
                        }
                        var obj = {};
                        obj.startDat = $.trim($("[id*=startingDate]").val());
                        obj.endDat = $.trim($("[id*=endingDate]").val());
                        $.when(
                        jQuery.ajax({
                            //async: false,
                            url: "LoadCharts.aspx/GetBarPieDateRangeColumn",
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
                            url: "LoadCharts.aspx/GetBarPieDateRangeData",
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

                            window.myChart.data.labels = columnData;

                            if (chartData[0] !== null) {

                                //var colorName = colorNames[pieConfig.data.labels.length % colorNames.length];
                                var newColor = window.chartColors[colorName];
                                var newDataset = {
                                    backgroundColor: [],//"rgba(153,255,51,0.6)",
                                    borderColor: [],//"rgba(153,255,51,0.6)",
                                    data: [],
                                    fill: false
                                };

                                for (var index = 0; index < window.myChart.data.labels.length; ++index) {

                                    var colorName = colorNames[index % colorNames.length];;
                                    var newColor = window.chartColors[colorName];
                                    newDataset.backgroundColor.push(newColor);

                                    newDataset.data.push(chartData[index]);
                                }

                                window.myChart.data.datasets.push(newDataset);

                            }
                            window.myChart.update();
                        });


                    }

                    else if (window.myChart.config.type === "pie") {

                    }


                });
            });

            //Multiselect for location.
            $(function () {
                $('[id*=outletLocation]').multiselect({
                    includeSelectAllOption: true
                });
            });
        </script>
        <script src="../js/LoadCharts.js"></script>
    </form>

</body>
</html>
