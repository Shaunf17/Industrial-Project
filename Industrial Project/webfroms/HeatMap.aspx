<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HeatMap.aspx.cs" Inherits="HeatmapTest.Webforms.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="/css/HeatMapStyle.css" />
    <title>Heatmap</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        </div>
    </form>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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

        function myFunc() {
            alert("hello");
            //document.body.style.backgroundColor = "black";
        };
    </script>
</body>
</html>