<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tester.aspx.cs" Inherits="Industrial_Project.webfroms.tester" %>

<!DOCTYPE html>
<link href="../css/StyleSheet1.css" rel="stylesheet" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <h1> Total Revenue </h1>
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>

             <h1> Most Popular Location </h1>
           <asp:Literal ID="Literal2" runat="server"></asp:Literal>

             <h1> Total Redemptions </h1>
           <asp:Literal ID="Literal3" runat="server"></asp:Literal>

             <h1> Least Popular Location</h1>
           <asp:Literal ID="Literal4" runat="server"></asp:Literal>
            
            <br /><br />
           
        </div>
    </form>
</body>
</html>
