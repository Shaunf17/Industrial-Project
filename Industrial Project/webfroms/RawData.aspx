<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RawData.aspx.cs" Inherits="Industrial_Project.webfroms.RawData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/StyleSheet1.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
            <table id="YoyoDisbursals" border ="0" >
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
