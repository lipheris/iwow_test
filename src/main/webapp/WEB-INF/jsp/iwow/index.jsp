<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>iwowwow</title>

<script src='<c:url value="/js/jquery-3.2.1.min.js"/>'></script>
<script src='<c:url value="/js/bootstrap.min.js"/>'></script>

<!-- index.css -->
<link rel="stylesheet" href="<c:url value="/css/index.css"/>" />

</head>

<body>
	<!-- banner import -->
	<c:import url="label/menu.jsp" />

	<!-- banner import -->
	<c:import url="label/banner.jsp" />
	
	
<div id="fixed">	
	<div id="main">
		<div class="inner">
			<div class="columns">
			<c:forEach var="item" items="${picMsg}">
				<div class="image fit">
					<a href="<c:url value="/iwow/picture/${item.id}"/>" title="${item.description}"><img src='${item.pictureAddress}' /></a>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>	

</body>
</html>