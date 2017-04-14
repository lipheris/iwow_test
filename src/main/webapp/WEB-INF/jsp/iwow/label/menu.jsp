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
		<!-- pop up start -->

			<a href='javascript:' onClick="jsLightbox('res-profile-popup', 500, 400, 385)"  class="smoothScroll"><span class="menu_text">修改個人資料</span></a>
			<a href='javascript:' onClick="jsLightbox('res-friends-popup', 500, 400, 385)"  class="smoothScroll"><span class="menu_text">好友</span></a>
			<a href='javascript:' onClick="jsLightbox('res-follow-popup', 500, 400, 385)"  class="smoothScroll"><span class="menu_text">追隨中</span></a>
			<a href='javascript:' onClick="jsLightbox('res-fans-popup', 500, 400, 385)"  class="smoothScroll"><span class="menu_text">粉絲</span></a>
			<a href='javascript:' onClick="jsLightbox('res-group-popup', 500, 400, 385)"  class="smoothScroll"><span class="menu_text">群組</span></a>

		</div>
		
		<!-- Menu button -->
		<div id="menuToggle"><i class="icon-reorder"></i></div>
	</nav>
	
	<script src='<c:url value="/js/menu_main.js"/>'></script>

