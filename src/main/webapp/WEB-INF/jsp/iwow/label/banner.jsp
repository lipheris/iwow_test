<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src='<c:url value="/js/banner_search.js"/>'></script>
<!-- logo字體 -->
<link href="https://fonts.googleapis.com/css?family=Ribeye" rel="stylesheet">
<!-- banner.css -->
<link rel="stylesheet" href="<c:url value="/css/banner.css"/>" />

<!-- bootstrap&JQuery -->
<script src='<c:url value="/js/jquery-3.2.1.min.js"/>'></script>
<script src='<c:url value="/js/bootstrap.min.js"/>'></script>

<script src='<c:url value="/js/menu_main.js"/>'></script>

<!-- Top menu -->
<div class="banner">
	<nav class="navbar navbar-inverse navbar-fixed-top navbar-no-bg" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#top-navbar-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				
	<!-- logo -->
	<a class="navbar-brand" href="/iwowwow/iwow/index">iwowwow</a>
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

			<ul class="nav navbar-nav navbar-right scroll-link" style="font-size: 20px;">
				<li><a href="javascript:formSubmit()">Logout</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right scroll-link" style="font-size: 20px;">
				<li><a href="#"><span class="glyphicon glyphicon-envelope"></span></a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right scroll-link" style="font-size: 20px;">
				<li><a href="#"><span class="glyphicon glyphicon-cloud-upload"></span></a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right scroll-link">
				<li><a style="padding: 0px; padding-top: 5px; margin-right: 10px;font-size:20px; color:#FFCCCC;" href="<c:url value="/iwow/index_user"/>"><img style="width: 40px; margin-right: 5px; " src="https://secure.gravatar.com/avatar/afb1c54ac11486de1a71f6e0cd3ccc16?s=100&r=g&d=https://pacdn.500px.org/userpic.png"><sec:authentication property="principal.username" /></a></li>
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
	
	<script src='<c:url value="/js/menu_main.js"/>'></script>
