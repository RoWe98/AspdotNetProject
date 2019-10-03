<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="rentandback.aspx.cs" Inherits="tushuguanli.rentandback" %>
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
	<div class="row clearfix">
		<div class="col-md-12 column">
			<table class="table">
				<thead>
					<tr>
						<th>
							书本id
						<th>
							书名
						</th>
						<th>
							出版社
						</th>
						<th>
							类型
						</th>
					</tr>
				</thead>
		       </table>
		</div>

        <div class ="row clearfix">
            <div class ="col-md-12 column">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="222px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" Width="1168px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="publish" HeaderText="publish" SortExpression="publish" />
                        <asp:BoundField DataField="book_name" HeaderText="book_name" SortExpression="book_name" />
                        <asp:BoundField DataField="book_type" HeaderText="book_type" SortExpression="book_type" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bookmanageConnectionString %>" SelectCommand="SELECT [id], [publish], [book_name], [book_type] FROM [book]"></asp:SqlDataSource>
            </div>
         </div>
	</div>
</div>
    </div>
</asp:Content>


