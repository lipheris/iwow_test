<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <!-- Custom styles for this template -->
	<link rel="stylesheet" href="<c:url value="/css/menu_main.css"/>" />
	<link rel="stylesheet" href="<c:url value="/css/menu_font-awesome.min.css"/>" />
	
	<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>" />
	
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,300,700' rel='stylesheet' type='text/css'>
	
		<!-- Menu -->
		<nav class="menu" id="theMenu">
		<div class="menu-wrap">

		<!-- pop up start -->
		<c:import url="lightbox/menu_profile.jsp" />
		<c:import url="lightbox/menu_friends.jsp" />
		<c:import url="lightbox/menu_follow.jsp" />
		<c:import url="lightbox/menu_fans.jsp" />
		<c:import url="lightbox/menu_group.jsp" />
		<c:import url="lightbox/menu_picturesedit.jsp" />
		<c:import url="lightbox/menu_upgradeAuthority.jsp"/>
		<!-- pop up start -->

<!-- 		編輯個人資料 -->
<!-- 		<form action="/iwowwow/iwow/member/edit" method="get"> -->
<%-- 			<input type="hidden" name="email" value="<sec:authentication property="principal.username" />">  --%>
<!-- 			<input class="btn btn-info" type="submit" value="編輯個人資料"> -->
<%-- 			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
<!-- 		</form> -->
<!-- 	編輯個人資料 -->

			<a href='javascript:' onClick="jsLightbox('res-profile-popup', 500, 400, 385)"  class="smoothScroll"><span class="menu_text">編輯個人資料</span></a>
<!-- 			<a href='javascript:' onClick="jsLightbox('res-friends-popup', 500, 400, 385)"  class="smoothScroll"><span class="menu_text">好友</span></a> -->
			<a href='javascript:' onClick="jsLightbox('res-follow-popup', 500, 400, 385)"  class="smoothScroll"><span class="menu_text">追隨中</span></a>
<!-- 			<a href='javascript:' onClick="jsLightbox('res-fans-popup', 500, 400, 385)"  class="smoothScroll"><span class="menu_text">粉絲</span></a> -->
			<a href='javascript:' onClick="jsLightbox('res-group-popup', 500, 400, 385)"  class="smoothScroll"><span class="menu_text">群組</span></a>
			<a href="#" onClick="jsLightbox('res-picturesedit-popup', 500, 400, 385)"  class="smoothScroll" id="pictures_edit"><span class="menu_text">編輯圖片</span></a>
			<a href='javascript:' onClick="jsLightbox('res-upgradeAuthority-popup', 500, 400, 385)"  class="smoothScroll" id="member_upgrade"><span class="menu_text">黃金會員</span></a>
			<a href='<c:url value="/iwow/picture/showcartcontent"/>'   class="smoothScroll"><span class="menu_text">前往購物車</span></a>
			<a href='<c:url value="/iwow/picture/orderlistdetail"/>'   class="smoothScroll"><span class="menu_text">我的購物清單</span></a>
		</div>
		
		<!-- Menu button -->
		<div id="menuToggle"><i class="icon-reorder"></i></div>
	</nav>
	
	<script src='<c:url value="/js/menu_main.js"/>'></script>

