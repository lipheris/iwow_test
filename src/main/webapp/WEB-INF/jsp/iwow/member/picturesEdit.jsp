<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><sec:authentication property="principal.username" />
	修改圖片</title>
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

<!-- sweetalert -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.4.2/sweetalert2.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.4.2/sweetalert2.min.css">

<style type="text/css">
form {
	margin-right: 10px;
	float: left;
}

th {
	margin: 0px;
	padding: 0px;
}

p {
	align: center;
}

.container {
	width: 680px;
	float: left;
}

.btn-success {
	margin-top: 20px;
	margin-bottom: 15px;
}

a {
	
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${not empty pictureList}">


			<div class="container">
				<table>
					<tr>
						<th><p>分級</p></th>
						<th><p>圖片名稱</p></th>
						<th><p>上傳日期</p></th>
						<th><p>visibility</p></th>
						<th><p>圖片</p></th>
						<th><p>tags</p></th>
						<th><p>stats</p></th>
						<th><p>刪除</p></th>
						<th><p>修改</p></th>
						<th></th>
					</tr>
					<c:forEach var="list" items="${pictureList}">
						<form action="<c:url value="/iwow/update"/>" method="get">
							<input name="id" type="hidden" value="${list.id}" id="id">
							<tr>
								<c:choose>
									<c:when test="${list.assort eq 'RESTRICTED'}">
										<td><select name="assort" id="assort">

												<option value="GENERAL">全年齡</option>
												<option value="RESTRICTED" selected="true">18禁</option>
										</select></td>
									</c:when>
									<c:otherwise>
										<td><select name="assort" id="assort">
												<option value="GENERAL" selected="true">全年齡</option>
												<option value="RESTRICTED">18禁</option>
										</select></td>
									</c:otherwise>
								</c:choose>

								<td><input name="picName" type="text" value="${list.name}"
									id="picName" size="7" /></td>
								<td><fmt:parseDate value="${list.update}"
										pattern="yyyy-MM-dd" var="parsedDate" type="date" /> <fmt:formatDate
										value="${parsedDate}" var="stdDatum" type="date"
										pattern="yyyy.MM.dd" />${stdDatum}</td>
								<c:choose>
									<c:when test="${list.visibility eq 'PRIVATE'}">
										<td><select name="visibility" id="visibility">
												<option value="PUBLIC">公開</option>
												<option value="PRIVATE" selected="true">私人</option>
										</select></td>
									</c:when>
									<c:otherwise>
										<td><select name="visibility" id="visibility">
												<option value="PUBLIC" selected="true">公開</option>
												<option value="PRIVATE">私人</option>
										</select></td>
									</c:otherwise>
								</c:choose>

								<td><img height='120' width='120'
									src='${list.pictureAddress}' /></td>
								<td><a
									href="<c:url value="/iwow/picture/tags?id=${list.id}"/>"
									style='color: black; font-size: 13px;' class="edit_tags"data-picId="${list.id}" >顯示編輯</a> 
								<td>${list.stats}</td>
								<td><a
									href="<c:url value="/iwow/member/delete?id=${list.id}"/>"class="del_picture"data-picId="${list.id}">
									刪除</a></td>
								<td><input type="submit" value="修改" class="edit_picture" /></td>
							</tr>
						</form>
					</c:forEach>
				</table>
			</div>
		</c:when>
		<c:otherwise>
			<div>您還沒有上傳圖片唷!!!</div>
		</c:otherwise>
	</c:choose>
	<script>
		$.ajaxSetup({
			cache : false
		});
		$(document)
				.on(
						"click",
						".edit_picture",
						function(event) {
							event.preventDefault();
							var form = (event.target.form), 
								id = $(form.id).val(), 
								assort = $(form.assort).val(),
								picName = $(form.picName).val(),
								visibility = $(form.visibility).val()
							url = "${pageContext.request.contextPath}/iwow/member/update";
							$.get(url, {
								"assort" : assort,
								"picName" : picName,
								"visibility" : visibility,
								"id" : id
							}, function(response) {
								if (response) {
									swal({
										type : 'success',
										text : '修改成功!',
										showConfirmButton : false,
										customClass : 'swal',
										timer : 1000,

									});
								}
							})
						}

				);
		
		$(document)
				.on(
						"click",
						".del_picture",
						function(event) {
							var id = $(event.target).attr('data-picId');
							event.preventDefault();
							var test=$(id);
							url = "${pageContext.request.contextPath}/iwow/member/delete";
							console.log(id)
							$.get(url, {
								"id" : id
							}, function() {
								$(event.target).parent().parent().remove();
							})
						});
		$(document)
		.on(
				"click",
				".edit_tags",
				function(event) {
					var id = $(event.target).attr('data-picId');
					event.preventDefault();
					var test=$(id);
					url = "${pageContext.request.contextPath}/iwow/picture/tags";
					console.log(id)
					$.get(url, {
						"id" : id
					}, function() {
						window.open('${pageContext.request.contextPath}/iwow/picture/tags?id='+id,'tagsedit', 'width=800, height=600');
					})
					});
	</script>
</body>
</html>