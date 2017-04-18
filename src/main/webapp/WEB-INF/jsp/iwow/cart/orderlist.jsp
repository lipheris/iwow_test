<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"
	integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<style class="cp-pen-styles">
.d {
	margin-top: 100px;
	margin-left: 200px;
	margin-right: 200px;
}

</style>
</head>

<html>
<body>
	<c:import url="../label/banner.jsp" />

	<div class="d">
		<h1>Shopping Cart Order Details</h1>
		<table class="table">
			<thead>
				<tr>
					<th>Order Nnumber</th>
					<th >Order Date</th>
					<th>Download</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="anOrderBean" varStatus="stat" items="${orders}">
				<tr>
					<td><a href='<c:url value='/iwow/cart/getalldetail?id=${anOrderBean.id}' />'>
							${anOrderBean.id} </a></td>
					<td>${anOrderBean.update}</td>
					<td><a href="<c:url value='/iwow/cart/download?id=${anOrderBean.id}' />">Picture Download</a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>


	</div>
</body>
</html>