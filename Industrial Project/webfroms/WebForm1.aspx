<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Industrial_Project.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/StyleSheet1.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.min.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
    </form>
    <div class="container">
        <div>
            <canvas id="myChart"></canvas>
        </div>
    </div>
    <script>
        var ctx = document.getElementById('myChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
                datasets: [{
                    label: 'apples',
                    data: [12, 19, 3, 17, 6, 3, 7],
                    backgroundColor: "rgba(153,255,51,0.6)"
                }, {
                    label: 'oranges',
                    data: [2, 29, 5, 5, 2, 3, 10],
                    backgroundColor: "rgba(255,153,0,0.6)"
                }]
            }
        });
    </script>
</body>
</html>
