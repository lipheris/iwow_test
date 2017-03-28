<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>login</title>

<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" />

<style>
.searchicon {
	margin-left: 100px;
	margin-top: 7px;
}

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
    margin: auto;
    padding: 32px 40px 24px;
    color: #71767a;
}
.btn-login {
	color: #fff;
	background-color: #34bf49;
	border-color: rgba(0, 0, 0, 0.2);
	text-align:center;
	padding-right:60px;
}

</style>
</head>
<body onload='document.loginForm.username.focus();'>

	<!-- banner -->
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="#">iwowwow</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav" style="font-size: 35px">
				<li class="active"><span
					class="glyphicon glyphicon-search searchicon" aria-hidden="true"></span></li>
			</ul>

			<form class="navbar-form navbar-left">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>

			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">Sign Up</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->

	</div>
	<!-- /.container-fluid --> </nav>


	<!-- login -->

	<div class="login">

		<h2>Log In to iwowwow</h2>
		
		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>
		
		<form name='loginForm' action="<c:url value="/login_check?targetUrl=${targetUrl}" />" method='post'>

			<div class="form-group">
				<label for="name">Email</label> <input class="form-control" type="text" name="email" id="email" maxlength="50" placeholder="email" />
			</div>

			<div class="form-group">
				<label for="name">Password</label> <input class="form-control" type="password" name="password" id="password" maxlength="50" placeholder="password" />
			</div>

			 
			<input class="btn btn-block btn-lg btn-social btn-login" name="submit" type="submit"
						value="Log in" />
			<a class="btn btn-block btn-lg btn-social btn-facebook"> 
			<span class="fa fa-facebook"></span> Log in with Facebook
			</a> 
			<a class="btn btn-block btn-lg btn-social btn-google"> 
			<span class="fa fa-google"></span> Log in with Google
			</a>
			
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			
		</form>

	</div>

</body>
</html>
