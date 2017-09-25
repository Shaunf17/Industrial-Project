<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RawData.aspx.cs" Inherits="Industrial_Project.webfroms.RawData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link href="../css/StyleSheet1.css" rel="stylesheet" />

    <title></title>
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
    <script>
        // Wait for window load
        $(window).load(function () {
            $(".loading").fadeOut("slow");;  
            <ul>
                <li class="Loading-message:">Please wait while the page is being loaded, this could take several minutes</li>
            </ul>
            // Animate loader off screen
            $(".se-pre-con").fadeOut("slow");;
            
        });
    </script>
</head>
   
<body>
  
    <div class="se-pre-con"></div>

    <h1>Raw Data</h1>
    <br />
    <p>Overview of all of the data</p>
    <br />
    <br />


    <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
    <form id="form1" runat="server">

        <div id="container">

            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
            <table id="YoyoDisbursals" border="0">
                <tr>
                    <td>Date & Time</td>
                    <td>Retailer Ref</td>
                    <td>Outlet Ref</td>
                    <td>Retailer Name</td>
                    <td>Outlet Name</td>
                    <td>New user id</td>
                    <td>Transaction Type</td>
                    <td>Cash Spent</td>
                    <td>Discount Amount</td>
                    <td>Total Amount</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
