<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>     

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
<!-- logo字體 -->
<link href="https://fonts.googleapis.com/css?family=Ribeye" rel="stylesheet">

<!-- bootstrap&JQuery -->
<script src='<c:url value="/js/jquery-3.2.1.min.js"/>'></script>
<script src='<c:url value="/js/bootstrap.min.js"/>'></script>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>" />

<style>
/* background */
 body{ 
 	background-image: url("<c:url value="/images/login_background.jpg"/>");
 } 

/* banner */
.btn-social.btn-lg {
	padding-left: 61px;
}

.btn-social {
    position: relative;
    text-align: left;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.btn-facebook {
	color: #fff;
	background-color: #3b5998;
	border-color: rgba(0, 0, 0, 0.2);
}

.btn-google {
	color: #fff;
	background-color: #dd4b39;
	border-color: rgba(0, 0, 0, 0.2);
}
.login {
    width: 400px;
    padding: 32px 40px 24px;
    color: #71767a;
    background-color: rgba(255,255,255,.45);
    position: absolute;
	top: 50%;
	left: 50%;
 	margin-top:-300px; 
	margin-left:-200px;
}
.btn-login,.btn-signup {
	color: #fff;
	background-color: #34bf49;
	border-color: rgba(0, 0, 0, 0.2);
	text-align:center;
	padding-right:60px;
}
.or_text{
	font-weight: bold;
    text-align: center;
    color: #b9c1c7;
    margin:20px;
}
.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}

.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
}

/* login_logo iwow */
.login_logo{
	color:white;
	font-family:Ribeye;
}

form{
	margin-top:50px;
}

</style>
</head>
<body>
	<!-- login -->

	<div class="login">

		<h2 class="login_logo">iwowwow</h2>
		
		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>
		
		<form name='loginForm' action="<c:url value="/login_check?targetUrl=${targetUrl}" />" method='post'>

			<div class="form-group">
				<input class="form-control" type="text" name="email" id="email" maxlength="50" placeholder="email" />
			</div>

			<div class="form-group">
				<input class="form-control" type="password" name="password" id="password" maxlength="50" placeholder="password" />
			</div>

			 
			<input class="btn btn-block btn-lg btn-social btn-login" name="submit" type="submit" value="Log in" />

			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			
			</form>
			
			<div class="or_text">or</div>
			
			<a class="btn btn-block btn-lg btn-social btn-signup" href="/iwowwow/iwow/signup">Sign up</a>
			
			<a class="btn btn-block btn-lg btn-social btn-facebook"> 
			<span class="fa fa-facebook"></span> Log in with Facebook
			</a> 
			<a class="btn btn-block btn-lg btn-social btn-google"> 
			<span class="fa fa-google"></span> Log in with Google
			</a>

	</div>
</body>
</html>