<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 修改圖片 edit -->
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
.picture_box_img {
	border-radius: 100px;
	width: 200px;
	float:left;
}
.picture_box{
height:170px;
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
<!-- sweetalert -->
<script src='<c:url value="/js/pictures_edit.js"/>'></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.4.2/sweetalert2.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.4.2/sweetalert2.min.css">

<div id="js-lightbox-bg" class="res-picturesedit-popup-bg"></div>
<div class="res-picturesedit-popup" id="js-lightbox-main">
	<div id="js-lightbox-close">
		<span aria-hidden="true" class="glyphicon glyphicon-remove"></span>
	</div>
	<div class="res-picturesedit js-lightbox-fans">
	
	</div>
	<!-- social -->
	<div class="social" id="social">

		<!-- search	-->
		<nav class="navbar navbar-light bg-faded justify-content-between">
		<div id = "boxs">
		</div> 
		</nav>
		</div>
</div>