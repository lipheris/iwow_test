<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 字體import -->
<link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet">

<!DOCTYPE html>
<html>

<style>
body{ 
 	background:#88BFC6; 
 	font-family: 'Rubik', sans-serif;
 	font-family:Microsoft JhengHei;
}
.forbidden{
	position: absolute;
	top: 50%;
	left: 50%;
	
	margin-top:-250px;
	margin-left:-400px;
}
.forbidden_text{
	float:left; 
	width:400px;
	margin-left:50px;
	text-align:center;
}
.forbidden_image{ 
	float:left; 
	width:400px;  
}  
.forbidden_text_username{
 	color:white;
 	font-size:70px;
}
.forbidden_text_title{
 	color:white;
 	font-size:60px;
}
.forbidden_text_discription{
	font-size:50px;
}
</style>

<script>
	setTimeout(function(){ window.history.go(-1); }, 3000);
</script>

<body>
<!-- 	<h1>HTTP Status 403 - Access is denied</h1> -->
	
	<div class="forbidden">
	
	<img class="forbidden_image" src="<c:url value="/images/forbidden.png"/>">
	
	<div class="forbidden_text">
	<c:choose>
		<c:when test="${empty username}">
			<h2>You do not have permission to access this page!</h2>
		</c:when>
		<c:otherwise>
			<h1 class="forbidden_text_username">${username}</h1>
			<h1 class="forbidden_text_title">FORBIDDEN</h1>
			<h2 class="forbidden_text_discription">權限不足！</h2>
		</c:otherwise>
	</c:choose>	
	</div>
	</div>
</body>
	
</html>