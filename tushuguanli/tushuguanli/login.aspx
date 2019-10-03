<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="tushuguanli.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>登录</title>
    <meta charset="utf-8"/>
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

</head>
<body>
       <!-----start-main---->
    <div class="main">
        <div class="login-form">
            <h1>图书管理系统登录</h1>
            <div class="head">
                <img src="images/user.png" alt="" />
            </div>
            <form id="formlogin" runat="server">
                <asp:TextBox ID="TextBoxUser" runat="server" CssClass="textbox" placeholder="用户名"></asp:TextBox>
                <asp:TextBox ID="TextBoxPass" runat="server" CssClass="textbox" TextMode="Password" placeholder="密码"></asp:TextBox>
                <div>
                    &nbsp;<asp:Button ID="ButtonLogin" runat="server" OnClick="ButtonLogin_Click1" Text="登录" />
                </div>
                <p><asp:LinkButton ID="LinkButtonRegister" runat="server" OnClick="LinkButtonRegister_Click1">没有账号?注册</asp:LinkButton></p>
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
