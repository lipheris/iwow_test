<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.social {
	margin-top: 40px;
	font-family: Microsoft JhengHei;
	text-align: left;
}
/* search */
#search {
	margin-left: 25px;
}

/* social_box */
.social_box {
	padding: 10px 20px;
}

.social_box:hover {
	background-color: #DDDDDD;
}
/* social_box_img */
.social_box_img {
	border-radius: 100px;
	width: 50px;
}
/* social_box_name */
.social_box_name {
	margin: 10px;
}
/* social_box_btn */
.social_box_btn {
	border-radius: 5px;
	float: right;
	margin-top: 10px;
	margin-right: 5px;
}
</style>

<!-- 群組   group-->
<div id="js-lightbox-bg" class="res-group-popup-bg"></div>
<div class="res-group-popup" id="js-lightbox-main">

	<!-- 　離開叉叉　 -->
	<div id="js-lightbox-close">
		<span aria-hidden="true" class="glyphicon glyphicon-remove"></span>
	</div>

	<!-- social -->
	<div class="social">

		<!-- search	-->
		<nav class="navbar navbar-light bg-faded justify-content-between">
			<form class="form-inline" id="searchForm" action='<c:url value="/iwow/group/search" />' method="get">
				<div class="form-group">
					<input type="text" class="form-control mr-sm-2" placeholder="Search Group" id="searchCtx" name="ctx" />
					<button type="button" class="btn btn-default glyphicon glyphicon-search my-2 my-sm-0" id="searchBtn"></button>
				</div>
			</form>
		</nav>


		<!-- social box -->
		<!-- 		1 -->
		<div id="group_info">
			<h1 id="group_name"></h1>
			<h1 id="pic_author_name"></h1>
		</div>
		
		<div class="mainGroup" id="group_img">
			<a><img id = "group_img" /></a>
		</div>
		
		<div class="social_box">
			<img class="social_box_img"
				src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/1_copy.jpg">
			<span class="social_box_name">我想下班</span>

			<button type="button" class="btn btn-danger social_box_btn">退出</button>
			<button type="button" class="btn btn-info social_box_btn">加入</button>

		</div>

		<!-- social box end -->
	</div>

	<div class="res-group js-lightbox-group"></div>
</div>

<script src='<c:url value="/js/banner_search.js"/>'></script>
