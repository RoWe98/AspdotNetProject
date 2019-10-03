<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="myinfo.aspx.cs" Inherits="tushuguanli.myinfo" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
	<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<ul class="breadcrumb">
						<li>
							 <a href="Default.aspx">Home</a>
						</li>
						<li>
							 <a href="myinfo.aspx">我的信息</a>
						</li>
                        <li>
							 <a href="bookinfo.aspx">查看馆藏</a>
						</li>
                        <li>
							 <a href="rentandback.aspx">借阅归还</a>
						</li>
                        <li>
							 <a href="login.aspx">退出登录</a>
						</li>
					</ul>
				</div>
			</div>
    </div>
	<div class="row clearfix">
		<div class="col-md-6 column">
			<img alt="140x140" src="https://s2.ax1x.com/2019/08/08/e7lGlj.png" style="margin-left: 179px" />
		</div>
		<div class="col-md-6 column">
			<dl>
				<dt>
					用户名
				</dt>
				<dd>
                    <%Response.Write(Session["CurrentUser"].ToString()); %>
				</dd>
				<dt>
					邮箱
				</dt>
				<dd>
					<%Response.Write(Session["email"].ToString()); %>
				</dd>
				<dt>
					用户类型
				</dt>
				<dd>
					<%Response.Write(Session["UserType"].ToString()); %>
				</dd>
			</dl>
		</div>
	    <br />
&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: larger">下面是该用户目前借阅的书籍，点击选择来归还书籍<br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="margin-left: 42px" Text="添加书籍" />
        </span>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<table class="table">
				<thead>
					<tr>
						<th>
							用户id
						<th>
							书名
						</th>
						<th>
							借阅时间
						</th>
					</tr>
				</thead>
		       </table>
		</div>
        <br />
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" CssClass="mll" Height="148px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="1202px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="user_id" HeaderText="user_id" SortExpression="user_id" />
                <asp:BoundField DataField="borrow_name" HeaderText="borrow_name" SortExpression="borrow_name" />
                <asp:BoundField DataField="borrow_date" HeaderText="borrow_date" SortExpression="borrow_date" />
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:bookmanageConnectionString %>" SelectCommand="SELECT [user_id], [borrow_name], [borrow_date] FROM [userborrow] WHERE ([user_id] = @user_id)">
            <SelectParameters>
                <asp:SessionParameter Name="user_id" SessionField="CurrentUser" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    </div>
    </div>
</asp:Content>
