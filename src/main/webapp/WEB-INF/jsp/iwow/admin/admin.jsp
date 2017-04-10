<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<html>
<body>
	<h1>Title : ${title}</h1>
	<h1>Message : ${message}</h1>

	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<c:url value="/logout" var="logoutUrl" />
		<form action="${logoutUrl}" method="post" id="logoutForm">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
		<script>
			function formSubmit() {
				document.getElementById("logoutForm").submit();
			}
		</script>
	</sec:authorize>
	
	
	<sec:authorize access="isRememberMe()">
		<h2># This user is login by "Remember Me Cookies".</h2>
	</sec:authorize>

	<sec:authorize access="isFullyAuthenticated()">
		<h2># This user is login by username / password.</h2>
	</sec:authorize>


	<ul class="nav navbar-nav navbar-right" style="font-size: 15px">
		<li><a href="javascript:formSubmit()">Logout</a></li>
	</ul>



</body>
</html>