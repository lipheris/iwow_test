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
<script src="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css"></script>
<script src="https://cdn.datatables.net/buttons/1.2.4/css/buttons.dataTables.min.css"></script>
<script src="https://cdn.datatables.net/select/1.2.1/css/select.dataTables.min.css"></script>
<script src="https://editor.datatables.net/extensions/Editor/css/editor.dataTables.min.css"></script>

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


		<table id="example" class="table table-striped">
			<tr>
				<th>id</th>
				<th>assort</th>
				<th>name</th>
				<th>update</th>
				<th>uploaderId</th>
				<th>visibility</th>
				<th>file</th>
				<th>tags</th>
				<th>stats</th>
				<th>specs</th>
				<th>刪除</th>
				<th>修改</th>
				<th></th>
			</tr>

			<c:forEach var="list" items="${pictureList}">
			
				<form action="<c:url value="/iwow/update"/>"method="get">
				<tr>
					<td>${list.id}<input type="hidden" name="id" value="${list.id}"/></td>
					<c:choose>
						<c:when test="${list.assort eq 'RESTRICTED'}">
							<td><select name="assort">
									<option value="GENERAL">全年齡</option>
									<option value="RESTRICTED" selected="true">18禁</option>
							</select></td>
						</c:when>
						<c:otherwise>
							<td><select name="assort">
									<option value="GENERAL" selected="true">全年齡</option>
									<option value="RESTRICTED">18禁</option>
							</select></td>
						</c:otherwise>
					</c:choose>

					<td><input name="picName" type="text" value="${list.name}"/></td>
					<td>${list.update}</td>
					<td>${list.uploader}</td>
					<c:choose>
						<c:when test="${list.visibility eq 'PRIVATE'}">
							<td><select name="visibility">
									<option value="PUBLIC">公開</option>
									<option value="PRIVATE" selected="true">私人</option>
							</select></td>
						</c:when>
						<c:otherwise>
							<td><select name="visibility">
									<option value="PUBLIC" selected="true">公開</option>
									<option value="PRIVATE">私人</option>
							</select></td>
						</c:otherwise>
					</c:choose>
					
					<td><img height='120' width='120' src='${list.pictureAddress}' /></td>
					<td><a href="<c:url value="/iwow/tags?id=${list.id}"/>">編輯</a>
					<c:forEach var="tag" items="${list.tags}">${tag.name}</c:forEach>
					</td>
					<td>${list.stats}</td>
					<td>${list.specs}</td>
					<td><a href="<c:url value="/iwow/delete?id=${list.id}"/>">測試</a></td>
					<td><input type="submit" value="測試"/></td>
					<td></td>
				</tr>
				</form>
			</c:forEach>
		</table>

	</div>
<script>
$(document).ready(function() {
    $('#example').DataTable();
} );
</script>
</body>
</html>