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

                <div class="col-md-4 col-md-offset-1">
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
                <div class="col-md-4">
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
                <div class="col-md-2">
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
                <canvas id="canvas" style="margin-left: -3%;"></canvas>
                <br />
            </div>

        </div>

        <script>

            //global variables

            var locations = [];
            var chartData;// = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
            var columnData = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"];
            var config = {
                type: 'line',
                data: {
                    labels: columnData,
                    //datasets: [{}]
                },
                options: {
                    responsive: true,
                    title: {
                        display: true,
                        text: 'Total Sales'
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
            var colorNames = Object.keys(window.chartColors);



            window.onload = function () {

                var ctx = document.getElementById("canvas").getContext("2d");
                window.myLine = new Chart(ctx, config);

            };
          
            $(document).ready(function () {
                $(".locationChange").change(function () {

                    for (var index = 0; index < config.data.labels.length; ++index) {
                        config.data.datasets.splice(0, 1);
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
                                    contentType:" application/json; charset=utf-8",
                                    success: function (data) {
                                        columnData = data.d;

                                    },
                                    error: function () {
                                        //alert("Error loading data!");
                                        //columnData = null;
                                    }
                                });
                                config.data.labels = columnData;


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
                                    var colorName = colorNames[config.data.datasets.length % colorNames.length];
                                    var newColor = window.chartColors[colorName];
                                    var loc = values.split('%');
                                    var newDataset = {
                                        label: loc[i],
                                        backgroundColor: newColor,//"rgba(153,255,51,0.6)",
                                        borderColor: newColor,//"rgba(153,255,51,0.6)",
                                        data: [],
                                        fill: false
                                    };

                                    for (var index = 0; index < config.data.labels.length; ++index) {
                                        //alert(chartData[index]);
                                        if (chartData[index] === 0) newDataset.data.push(null);
                                        else newDataset.data.push(chartData[index]);
                                    }

                                    config.data.datasets.push(newDataset);
                                    window.myLine.update();

                            })(i);
                        }
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
