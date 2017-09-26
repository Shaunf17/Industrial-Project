<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentsChart.aspx.cs" Inherits="Industrial_Project.webfroms.PaymentsChart" %>


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
                 <div id="locationDiv" class="col-md-3">
                    <div class="form-group">
                        <div class='input-group locationChange'>
                            <!--locationChange-->
                            <label for="outletLocation">Location</label><br />
                            <asp:ListBox ID="outletLocation" runat="server" SelectionMode="Multiple" ></asp:ListBox>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 col-md-offset-5">
                    <div class="form-group">
                        <label for="startDate">Start Date</label>
                        <div class='input-group date locationChange' id='datetimepicker1'>
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
                            <asp:TextBox ID="endingDate" type='text' runat="server" CssClass="form-control" Text="2015-09-29"></asp:TextBox>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                            </span>
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

            var barConfig = {
                type: 'bar',
                data: {
                    datasets: [{}]
                },
                options: {
                    responsive: true,
                    legend: {
                        display: true

                    },
                    title: {
                        display: true,
                        text: 'Transactions',
                        position: 'top',
                        fontSize: 24,
                        fontColor: 'rgb(0, 0, 0)'
                    },
                    scales: {
                        xAxes: [{
                            display: true,
                            scaleLabel: {
                                display: true,
                                labelString: 'Locations'
                            }
                        }],
                        yAxes: [{
                            display: true,
                            scaleLabel: {
                                display: true,
                                labelString: 'Transactions'
                            }
                        }]
                    }
                }
            };

            var colorNames = Object.keys(window.chartColors);


            window.onload = function () {

                var ctx = document.getElementById("canvas").getContext("2d");
                window.myChart = new Chart(ctx, barConfig);
               
            };

            $(document).ready(function () {
                $(".locationChange").change(function () {

                    var discountedPayment = [];
                    var payment = [];
                    var redemption = [];
                    var refund = [];
                    var reversal = [];
                    var xAxesData = [];
                    var labelsLength = barConfig.data.datasets.length;
                    for (var index = 0; index < labelsLength; index++) {
                        barConfig.data.datasets.pop();
                    }

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
                    columnData

                    if (locations[0] !== "None selected") {

                        for (i = 0; i < locations.length - 1; i++) {
                            (function (i) {
                                xAxesData.push(locations[i]);
                                var obj = {};
                                obj.outR = $.trim(locations[i]);
                                obj.startDat = $.trim($("[id*=startingDate]").val());
                                obj.endDat = $.trim($("[id*=endingDate]").val());

                                jQuery.ajax({
                                    async: false,
                                    url: "PaymentsChart.aspx/getPayments",
                                    data: JSON.stringify(obj),
                                    dataType: "json",
                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    success: function (data) {
                                        chartData = data.d;
                                        discountedPayment.push(chartData[0]);
                                        payment.push(chartData[1]);
                                        redemption.push(chartData[2]);
                                        refund.push(chartData[3]);
                                        reversal.push(chartData[4]);
                                    },
                                    error: function () {


                                    }
                                });
                            })(i);


                        }
                        barConfig.data.labels = xAxesData;
                        var discountedPayment;
                        var payment;
                        var redemption;
                        var refund;
                        var reversal;

                        var discountedPaymentDataset = {
                            label: 'Discounted Payment',
                            backgroundColor: "rgba(153,255,51,0.6)",
                            borderColor: "rgba(153,255,51,0.6)",
                            data: discountedPayment
                        };
                        barConfig.data.datasets.push(discountedPaymentDataset);

                        var paymentDataset = {
                            label: 'Payment',
                            backgroundColor: "rgba(214, 47, 66,0.6)",
                            borderColor: "rgba(214, 47, 66,0.6)",
                            data: payment,

                        };

                        barConfig.data.datasets.push(paymentDataset);

                        var redemptionDataset = {
                            label: 'Redemption',
                            backgroundColor: "rgba(255,255,51,0.6)",
                            borderColor: "rgba(255,255,51,0.6)",
                            data: redemption
                        };

                        barConfig.data.datasets.push(redemptionDataset);

                        var refundDataset = {
                            label: 'Refund',
                            backgroundColor: "rgba(255,198,51,0.6)",
                            borderColor: "rgba(255,198,51,0.6)",
                            data: refund
                        };

                        barConfig.data.datasets.push(refundDataset);

                        var reversalDataset = {
                            label: 'Reversal',
                            backgroundColor: "rgba(153,255,255,0.6)",
                            borderColor: "rgba(153,255,255,0.6)",
                            data: reversal
                        };

                        barConfig.data.datasets.push(reversalDataset);

                        window.myChart.update();
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
