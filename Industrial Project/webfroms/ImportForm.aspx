<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImportForm.aspx.cs" Inherits="Industrial_Project.webfroms.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server">
                <asp:FileUpload ID="FileUpload" runat="server" />
                <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" ></asp:Button>
                <br />
                <asp:Label ID="lblMessage" runat="server" Text="" />
                <asp:PlaceHolder ID = "PlaceHolder1" runat="server" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
