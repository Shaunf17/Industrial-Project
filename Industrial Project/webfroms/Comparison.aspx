<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Comparison.aspx.cs" Inherits="Industrial_Project.webfroms.Comparison" %>


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

        <%--        <div class="container">
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
                        <label for="startDate">Start Date</label>
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
                        <label for="endDate">End Date</label>
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

        </div>--%>

        <div class="container">
            <div class="row">

                <div class="col-md-2 col-md-offset-2">
                    <div class="form-group change">
                        <label for="outletRef">Statistic</label>
                        <asp:DropDownList ID="procedureSelect" type='text' runat="server" CssClass="form-control statisticType"></asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group change">
                        <label for="outletRef">Location</label>
                        <asp:DropDownList ID="locationSelect" type='text' runat="server" CssClass="form-control locationType"></asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class='input-group change'>
                        <!--locationChange-->
                        <label for="yearsSelect">Year</label><br />
                        <asp:ListBox ID="yearsSelect" runat="server" SelectionMode="Multiple" CssClass="yearsSelect"></asp:ListBox>
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
                    labels: columnData
                },
                options: {
                    responsive: true,
                    title: {
                        display: true,
                        text: 'Activity',
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
                                labelString: 'Customers'
                            }
                        }]
                    }
                }
            };



            var colorNames = Object.keys(window.chartColors);



            window.onload = function () {

                var ctx = document.getElementById("canvas").getContext("2d");
                window.myChart = new Chart(ctx, lineConfig);
            };
            $(document).ready(function () {
                $(".statisticType").change(function () {

                    var myYears;  ///
                    var listBoxes = document.getElementById('procedureSelect');
                    var selected = 0;
                    var listBox;
                    for (var i = 0; i < listBoxes.options.length; i++) {
                        if (listBoxes.options[i].selected) {
                            listBox = listBoxes.options[i].value;
                            selected++;
                        }
                    }

                    var listBoxes1 = document.getElementById('locationSelect');
                    var selected1 = 0;
                    var listBox1;
                    for (var i = 0; i < listBoxes1.options.length; i++) {
                        if (listBoxes1.options[i].selected) {
                            listBox1 = listBoxes1.options[i].value;
                            selected++;
                        }
                    }

                    var datasetsLength = window.myChart.data.datasets.length;
                    for (var index = 0; index < datasetsLength; index++) {
                        window.myChart.data.datasets.pop();
                    }



                    // Multiselect deselection
                    $('option', $('#yearsSelect')).each(function (element) {
                        $(this).remove();
                    });

                    $("#yearsSelect").multiselect('refresh');
                    var obj = {};
                    obj.listbox = listBox1;
                    $.when(
                        jQuery.ajax({
                            //async: false,
                            data: JSON.stringify(obj),
                            url: "Comparison.aspx/loadYearDropdown",
                            dataType: "json",
                            type: "POST",
                            contentType: " application/json; charset=utf-8",
                            success: function (data) {
                                console.log("success" + data.d);
                                myYears = data.d;
                            },
                            error: function () {
                                console.log("error");
                            }
                        })
                        ).then(function () {
                            //Rebuild Multiselect
                            for (i = 0; i < myYears.length; i++) {
                                var htm = '';
                                htm += '<option>' + myYears[i] + '</option>';
                                $('#yearsSelect').append(htm);
                            }
                            $('#yearsSelect').multiselect('rebuild');
                            console.log(listBox);
                            window.myChart.options.title.text = listBox;

                            if (listBox === "Total Sales") {
                                window.myChart.options.scales.yAxes[0].scaleLabel.labelString = "Values";
                            }
                            else if (listBox === "Popularity") {
                                window.myChart.options.scales.yAxes[0].scaleLabel.labelString = "Transactions";
                            }
                            else if (listBox === "Activity") {
                                window.myChart.options.scales.yAxes[0].scaleLabel.labelString = "Customers";
                            }

                            window.myChart.update();

                        });
                });
            });

            $(document).ready(function () {
                $(".locationType").change(function () {
                    /*
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
                                    url: "Comparison.aspx/GetBarPieColumnData",
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
                                url: "Comparison.aspx/GetBarPieGraphData",
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
                                    url: "Comparison.aspx/GetBarPieColumnData",
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
                                url: "Comparison.aspx/GetBarPieGraphData",
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
                */

                    var myYears;  ///
                    var listBoxes = document.getElementById('procedureSelect');
                    var selected = 0;
                    var listBox;
                    for (var i = 0; i < listBoxes.options.length; i++) {
                        if (listBoxes.options[i].selected) {
                            listBox = listBoxes.options[i].value;
                            selected++;
                        }
                    }

                    var listBoxes1 = document.getElementById('locationSelect');
                    var selected1 = 0;
                    var listBox1;
                    for (var i = 0; i < listBoxes1.options.length; i++) {
                        if (listBoxes1.options[i].selected) {
                            listBox1 = listBoxes1.options[i].value;
                            selected++;
                        }
                    }


                    var datasetsLength = window.myChart.data.datasets.length;
                    for (var index = 0; index < datasetsLength; index++) {
                        window.myChart.data.datasets.pop();
                    }
                    //window.myChart.destroy();
                    //var ctx = document.getElementById("canvas").getContext("2d");
                    //window.myChart = new Chart(ctx, lineConfig);


                    // Multiselect deselection
                    $('option', $('#yearsSelect')).each(function (element) {
                        $(this).remove();
                    });
                    $("#yearsSelect").multiselect('refresh');
                    var yearsObj = {};
                    yearsObj.listbox = listBox1;

                    $.when(
                        jQuery.ajax({
                            //async: false,
                            data: JSON.stringify(yearsObj),
                            url: "Comparison.aspx/loadYearDropdown",
                            dataType: "json",
                            type: "POST",
                            contentType: " application/json; charset=utf-8",
                            success: function (data) {
                                console.log("success" + data.d);
                                myYears = data.d;
                            },
                            error: function () {
                                console.log("error");
                            }
                        })
                        ).then(function () {
                            //Rebuild Multiselect
                            for (i = 0; i < myYears.length; i++) {
                                var htm = '';
                                htm += '<option>' + myYears[i] + '</option>';
                                $('#yearsSelect').append(htm);
                            }
                            $('#yearsSelect').multiselect('rebuild');
                            console.log(listBox);
                            window.myChart.update();

                        });

                });
            });

            $(document).ready(function () {
                $(".yearsSelect").change(function () {

                    var labelsLength = lineConfig.data.datasets.length;
                    for (var index = 0; index < labelsLength; index++) {
                        lineConfig.data.datasets.pop();
                    }

                    var statisticsBoxes = document.getElementById('procedureSelect');
                    var selectedStat = 0;
                    var statisticName;
                    for (var i = 0; i < statisticsBoxes.options.length; i++) {
                        if (statisticsBoxes.options[i].selected) {
                            statisticName = statisticsBoxes.options[i].value;
                            selectedStat++;
                        }
                    }

                    var locationBoxes = document.getElementById('locationSelect');
                    var selectedPlace = 0;
                    var locationName;
                    for (var i = 0; i < locationBoxes.options.length; i++) {
                        if (locationBoxes.options[i].selected) {
                            locationName = locationBoxes.options[i].value;
                            selectedPlace++;
                        }
                    }
                    var values = "";
                    var selected = 0;
                    var listBox = document.getElementById('yearsSelect');
                    for (var i = 0; i < listBox.options.length; i++) {
                        if (listBox.options[i].selected) {
                            values += listBox.options[i].value + "%";
                            selected++;
                        }
                    }
                    if (values === "") values = "None selected";
                    var years = [];
                    years = values.split('%');

                    if (years[0] !== "None selected") {

                        for (i = 0; i < years.length - 1; i++) {

                            (function (i) {
                                var obj = {};
                                obj.year = $.trim(years[i]);
                                obj.statistic = $.trim(statisticName);
                                obj.location = $.trim(locationName);
                                jQuery.ajax({
                                    async: false,
                                    url: "Comparison.aspx/getYearData",
                                    data: JSON.stringify(obj),
                                    dataType: "json",
                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    success: function (data) {
                                        chartData = data.d;
                                    },
                                    error: function () {
                                        alert("error");
                                    }
                                });

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

                                window.myChart.config.data.datasets.push(newDataset);
                                window.myChart.update();

                            })(i);
                        }
                    }




                });
            });

            //Multiselect for location.
            $(function () {
                $('[id*=yearsSelect]').multiselect({
                    includeSelectAllOption: true
                });
            });
        </script>
        <script src="../js/LoadCharts.js"></script>
    </form>

</body>
</html>
