<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="tushuguanli.AddBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>图书添加</title>
    <meta charset="utf-8"/>
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

</head>
<body>
       <!-----start-main---->
    <div class="main">
        <div class="login-form">
            <h1>图书添加</h1>
     
            <form id="formlogin" runat="server">
                <asp:TextBox ID="TextBoxBook" runat="server" CssClass="textbox" placeholder="书名"></asp:TextBox>
                <asp:TextBox ID="TextBoxPublish" runat="server" CssClass="textbox" placeholder="出版社"></asp:TextBox>
                <asp:TextBox ID="TextBoxType" runat="server" CssClass="textbox"  placeholder="类型"></asp:TextBox>
                <div>
                    &nbsp;<asp:Button ID="ButtonAdd" runat="server" OnClick="ButtonAdd_ClickAdd" Text="添加" />
                </div>
            </form>
        </div>
        <!--//End-login-form-->
        <!-----start-copyright---->
        <div class="copy-right">
            <p>My Blog <a href="https://blog.luoshaoqi.cn">Blog</a></p>
        </div>
        <!-----//end-copyright---->
    </div>
    <!-----//end-main---->

</body>
</html>
