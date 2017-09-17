<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImportForm.aspx.cs" Inherits="Industrial_Project.webfroms.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
<%--        <asp:Panel ID="Panel1" runat="server">
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" ></asp:Button>
                <br />
                <asp:Label ID="lblMessage" runat="server" Text="" />
                <asp:Literal ID="pathName" runat="server" Text="I am here" ></asp:Literal>
            </asp:Panel>--%>
        <div>
            <asp:Panel ID="Panel1" runat="server">
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" ></asp:Button>
                <br />
                <asp:Label ID="lblMessage" runat="server" Text="" />
                <asp:Literal ID="pathName" runat="server" Text="I am here" ></asp:Literal>
            </asp:Panel>
             
            <asp:Panel ID="Panel2" runat="server" Visible="false">
                <asp:Label ID="Label5" runat="server" Text="File Name" />
                <asp:Label ID="lblFileName" runat="server" Text="" />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Select Sheet" />
                <asp:DropDownList ID="ddlSheets" runat="server"
                    AppendDataBoundItems="true">
                </asp:DropDownList>
                <br />
                <asp:Label ID="Label3" runat="server" Text="Enter Source Table Name" />
                <asp:TextBox ID="txtTable" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label1" runat="server" Text="Has Header Row?" />
                <br />
                <asp:RadioButtonList ID="rbHDR" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes" Selected="True">
                    </asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
                <br />
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" ></asp:Button>
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"></asp:Button>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
