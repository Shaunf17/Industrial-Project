<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Upload.aspx.cs" Inherits="Industrial_Project.webfroms.Upload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/MainDashboardCSS.css" rel="stylesheet" />
    <link href="../css/UploadCSS.css" rel="stylesheet" />
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Upload</title>
</head>
<body>

    <form id="Form1" runat="server">
    <div class ="SideBar">
        <img id="YoyoLogo" src="../Pictures/Yoyo_white_Logo.png" />
        <div class ="SideBarMenu">
            <a href="MainDashboard.aspx"><span class="glyphicon glyphicon-th-large"></span>Dashboard</a>
            <a href="Reports.aspx"><span class="glyphicon glyphicon-stats"></span>Reports</a>
            <a href="RawData.aspx"><span class="glyphicon glyphicon-th-list"></span>Raw Data</a>
            <a href="Upload.aspx" class ="active"><span class="glyphicon glyphicon-upload"></span>Upload</a>
            <asp:LinkButton ID="LogOut" onclick="LogOut_click" runat="server"><span class="glyphicon glyphicon-log-out"></span>Logout</asp:LinkButton>
           
        </div>
    </div>

    <div class ="UploadContent">
        <div class ="UploadIcon">
            <span class="glyphicon glyphicon-level-up"></span>
        </div>
                <asp:Panel ID="Panel1" runat="server">
                    <div class="ChooseFile">
                        <asp:FileUpload ID="FileUpload" runat="server" />
                    </div>
                    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" class="UploadButton" ></asp:Button>
                    <br />
                    <asp:Label ID="lblMessage" runat="server" Text="" />
                    <asp:PlaceHolder ID = "PlaceHolder1" runat="server" />
                </asp:Panel>
    </div>
        </form>
</body>
</html>
