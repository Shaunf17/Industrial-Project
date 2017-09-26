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
            <asp:Repeater ID="rptheatmap" runat="server">
                <HeaderTemplate>
                    <table id="heatmap">
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                </ItemTemplate>

                <FooterTemplate>
                    </table>
                </FooterTemplate>

            </asp:Repeater>
        </div>

        <div>
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        </div>
    </form>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
        $(function () {
            //$('tr > td:odd').each(function (index) {
            $('table td:nth-child(1) ~ td').each(function () {
                var scale = [['vPoor', 10], ['poor', 20], ['avg', 50], ['good', 150], ['vGood', 500]];
                var score = $(this).text();
                for (var i = 0; i < scale.length; i++) {
                    if (score <= scale[i][1]) {
                        $(this).addClass(scale[i][0]);
                    }
                }
            });
        });
    </script>
    <!--<script type="text/javascript">
        //alert("hello");

        var temp = document.getElementById("heatmap").getElementsByTagName("td");
        var largest = 5;
        for (var i = 0; i < temp.length; i++)
        {
            temp[i].innerHTML = i;
        }
        
    </script>-->

    <script>

</script>
</body>
</html>