<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src='<c:url value="/js/banner_search.js"/>'></script>
<!-- logo字體 -->
<link href="https://fonts.googleapis.com/css?family=Ribeye" rel="stylesheet">


<!-- bootstrap&JQuery -->
<script src='<c:url value="/js/jquery-3.2.1.min.js"/>'></script>
<script src='<c:url value="/js/bootstrap.min.js"/>'></script>

<!-- banner.css -->
<link rel="stylesheet" href="<c:url value="/css/banner.css"/>" />

<!-- Top menu -->
<div class="banner">
	<nav class="navbar navbar-inverse navbar-fixed-top navbar-no-bg banner_css" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#top-navbar-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				
		<!-- logo -->
			<a class="navbar-brand logo_css" href="/iwowwow/iwow/index">iwowwow</a>
		<!-- logo -->
			
			</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="top-navbar-1">
				<ul class="nav navbar-nav navbar-right">
				<!-- search -->
					<form class="navbar-form navbar-left" id="searchForm" action='<c:url value="/iwow/search" />' method="get">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search" id="searchCtx" name="ctx"/>
							<button type="button" class="btn btn-default glyphicon glyphicon-search" id="searchBtn"></button>
						</div>
					</form>
				<!-- search -->	

			<ul class="nav navbar-nav navbar-right scroll-link banner_icon">
				<li><a href="javascript:formSubmit()">Logout</a></li>
			</ul>
			
			<!-- 沒東西 -->
			<ul class="nav navbar-nav navbar-right scroll-link banner_icon">
				<li><a href="#"><span class="glyphicon glyphicon-envelope"></span></a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right scroll-link banner_icon">
				<li><a href="<c:url value="/iwow/member/upload" />"><span class="glyphicon glyphicon-cloud-upload"></span></a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right scroll-link user_icon">
				<li><a class="user_name" href="<c:url value="/iwow/member"/>">
				<img class="user_img">
					<span class="user_nickname"></span></a></li>
<%-- 				<sec:authentication property="principal.username" /></a></li> --%>
			</ul>

				<sec:authorize access="hasRole('ROLE_USER')">					
				<c:url value="/logout" var="logoutUrl" />
					<form action="${logoutUrl}" method="post" id="logoutForm">						
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>									
				<script>
      					function formSubmit() {   
       						document.getElementById("logoutForm").submit();  
         				}   
  				</script>    
			</sec:authorize>
				
				</ul>
			</div>
		</div>
	</nav>
</div>	

<script>
//抓取登入者的資料（暱稱、頭像
$(function(){
	$.getJSON('/iwowwow/iwow/member/user_profile',function(user_profile){
  			var user_pic = $(".user_img").attr("src",user_profile.photoAddr);
			$(".user_nickname").html("<p>" + user_profile.nickname + "</p>");
	})
});
</script>