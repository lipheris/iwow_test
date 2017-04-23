<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_parametername" content="${_csrf.parameterName}"/>
 </head>
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
<script src='<c:url value="/js/jquery.form.js"/>'></script>
<script src='<c:url value="/js/group.js"/>'></script>
<script src='<c:url value="/js/banner_search.js"/>'></script>

<!-- 群組   group-->
<div id="js-lightbox-bg" class="res-group-popup-bg"></div>
<div class="res-group-popup" id="js-lightbox-main">

	<!-- 　離開叉叉　 -->
	<div id="js-lightbox-close">
		<span aria-hidden="true" class="glyphicon glyphicon-remove"></span>
	</div>

	<!-- social -->
	<div class="social" id="social">

		<!-- search	-->
					
		<nav class="navbar navbar-light bg-faded justify-content-between">
			<form class="form-inline">
				<div>
					<input type="text" class="form-control mr-sm-2" placeholder="Search Group" id="searchCtx" name="ctx" />
					<button type="button" class="btn btn-default glyphicon glyphicon-search my-2 my-sm-0" id="searchBtn"></button>
					<button type="button" class="btn btn-default glyphicon glyphicon-search" id="findAllBtn">個人社群</button>
				</div>
				
			</form>
		</nav>

		<div id="createBtn">            
			<button type="button" class="btn btn-primary  " id="createBtn">新建社團</button>			
		</div>
		<div id="createbox">		
		</div>

		<!-- social box -->
		<div id = "boxs">
		</div> 
		<!-- social box end -->
				
	</div>

	<div class="res-group js-lightbox-group"></div>
</div>


