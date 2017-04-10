<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><sec:authentication property="principal.username" />
	List</title>

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

<style type="text/css">
form {
	margin-right: 10px;
	float: left;
}

th {
	margin: 0px;
	padding: 0px;
}

.container {
	width: 800px;
	float: left;
	margin-left: 50px;
}

.btn-success {
	margin-top: 20px;
	margin-bottom: 15px;
}
</style>

</head>
<body>
	<div class="container">
		<h1>
			Hi,
			<sec:authentication property="principal.username" />
		</h1>


		<table class="table table-striped">
			<tr>
				<th>name</th>
				<th>描述</th>
				<th>刪除</th>
				<th>修改</th>
				<th></th>
			</tr>

			<c:forEach var="list" items="${tags}">

				<form action="<c:url value="/iwow/tags/update"/>" method="get">
					<tr>
						<td><input name="name" type="text" value="${list.name}" /></td>
						<td><input name="dsc" type="text" value="${list.dsc}" /></td>
						<td><a
							href="<c:url value="/iwow/tags/delete?id=${list.id}"/>">測試</a></td>
						<td><input type="submit" value="測試" /></td>
						<td></td>
					</tr>
				</form>
			</c:forEach>
		</table>

	</div>
</body>
</html>