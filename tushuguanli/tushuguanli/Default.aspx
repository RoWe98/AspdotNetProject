<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tushuguanli._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<div class="container">
	<div class="row clearfix">
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
					<div class="carousel slide" id="carousel-553283">
						<ol class="carousel-indicators">
							<li class="active" data-slide-to="0" data-target="#carousel-553283">
							</li>
							<li data-slide-to="1" data-target="#carousel-553283">
							</li>
							<li data-slide-to="2" data-target="#carousel-553283">
							</li>
						</ol>
						<div class="carousel-inner">
							<div class="item active">
								<img alt="" src="http://cdn.ibootstrap.cn/lorempixel.com/1600/500/sports/1/default.jpg" />
								<div class="carousel-caption">
									<h4>
										First Thumbnail label
									</h4>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
								</div>
							</div>
							<div class="item">
								<img alt="" src="http://cdn.ibootstrap.cn/lorempixel.com/1600/500/sports/2/default.jpg" />
								<div class="carousel-caption">
									<h4>
										Second Thumbnail label
									</h4>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
								</div>
							</div>
							<div class="item">
								<img alt="" src="http://cdn.ibootstrap.cn/lorempixel.com/1600/500/sports/3/default.jpg" />
								<div class="carousel-caption">
									<h4>
										Third Thumbnail label
									</h4>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
								</div>
							</div>
						</div> <a class="left carousel-control" href="#carousel-553283" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-553283" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</asp:Content>
