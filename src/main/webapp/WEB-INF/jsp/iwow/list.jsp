<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FaGao List</title>

<script  src="https://code.jquery.com/jquery-1.12.4.js"  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="  crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<style type="text/css">
form {
	margin-right: 10px;
	float: left;	
}

th{
	margin: 0px;
	padding: 0px;
}

.container{
	width: 800px;
	float: left;
	margin-left: 50px;
}

.btn-success{
	margin-top: 20px;
	margin-bottom: 15px;
}

</style>

</head>
<body>
<div class="container">
<!-- 	<h1>Hi,<sec:authentication property="principal.username" /></h1> -->
	<h1>Hi,FaGao</h1>
		
	<table class="table table-striped">
		<tr>
			<th>id</th>
			<th>assort</th>
			<th>name</th>
			<th>update</th>
			<th>uploaderId</th>
			<th>visibility</th>
			<th>file</th>
			<th>stats</th>
			<th>specs</th>
			<th>　</th>
		</tr>
		<c:forEach var="list" items="${pictureList}">
			<tr>
				<td>${list.id}</td>
				<td>${list.assort}</td>
				<td>${list.name}</td>
				<td>${list.update}</td>
				<td>${list.uploaderId}</td>
				<td>${list.visibility}</td>
<%-- 				<td><img src="${list.file}"></td> --%>
				<td><img src="${list.file}"></td>
				<td>${list.stats}</td>
				<td>${list.specs}</td>
				<td>

				</td>
			</tr>
		</c:forEach>
	</table>

</div>
</body>
</html>