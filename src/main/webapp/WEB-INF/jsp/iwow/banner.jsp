<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>banner</title>

<style>
/* banner */
.searchicon {
	margin-left: 100px;
	margin-top: 7px;
}
</style>
</head>
<body onload='document.logoutForm.username.focus();'>
	<!-- banner -->
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="#">iwowwow</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav" style="font-size: 35px">
				<li class="active"><span class="glyphicon glyphicon-search searchicon" aria-hidden="true"></span></li>
			</ul>

			<form class="navbar-form navbar-left">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>

				<sec:authorize access="hasRole('ROLE_USER')">					
					<c:url value="/logout" var="logoutUrl" />
						<form action="${logoutUrl}" method="post" id="logoutForm" >						
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>									
					<script>
   						function formSubmit() {  
   							document.getElementById("logoutForm").submit();  
     					}  
					</script>  
				</sec:authorize>
				<ul class="nav navbar-nav navbar-right" style="font-size: 15px">
					<li><a href="javascript:formSubmit()">Logout</a></li>
				</ul>
				
				<ul class="nav navbar-nav navbar-right" style="font-size: 15px">
					<li><a href="javascript:formSubmit()">Login</a></li>
				</ul>
				
				<ul class="nav navbar-nav navbar-right" style="font-size: 15px">
					<li><a href="javascript:formSubmit()">Signup</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right" style="font-size: 20px">
					<li><a href="#"><span class="glyphicon glyphicon-envelope"></span></a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right" style="font-size: 20px">
					<li><a href="#"><span class="glyphicon glyphicon-cloud-upload"></span></a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li><a style="padding: 0px; padding-top: 10px; margin-right: 10px;" href="#"><img style="width: 32px; margin-right: 5px;" src="https://secure.gravatar.com/avatar/afb1c54ac11486de1a71f6e0cd3ccc16?s=100&r=g&d=https://pacdn.500px.org/userpic.png"><sec:authentication property="principal.username" /></a></li>
				</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>


</body>
</html>