<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>upload</title>

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

<!-- jQuery datepicker必要的CSS 及JS -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	// jQuery datepicker
	$(function() {
		$("#datepicker").datepicker({
			minDate : -0,
			maxDate : "+1Y"
		});
	});
</script>

<style>
/* banner */
.banner_searchicon {
	margin-left: 100px;
	margin-top: 7px;
}

/* 上傳頁面 */
.upload_all {
	width: 1000px;
	margin: 0 auto;
}

/* fieldset */
fieldset {
	font-size: 25px;
	font-family: Microsoft JhengHei; /* 微軟正黑體 */
}

legend {
	font-size: 40px;
	font-family: Courier;
}

/* 選擇檔案 */
.upload_file_btn {
	
}
</style>
</head>
<body>
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

			<sec:authorize access="hasRole('ROLE_USER')">
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
			<ul class="nav navbar-nav navbar-right" style="font-size: 15px">
				<li><a href="javascript:formSubmit()">Logout</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right" style="font-size: 20px">
				<li><a href="#"><span class="glyphicon glyphicon-envelope"></span></a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right" style="font-size: 20px">
				<li><a href="#"><span
						class="glyphicon glyphicon-cloud-upload"></span></a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li><a
					style="padding: 0px; padding-top: 10px; margin-right: 10px;"
					href="#"><img style="width: 32px; margin-right: 5px;"
						src="https://secure.gravatar.com/avatar/afb1c54ac11486de1a71f6e0cd3ccc16?s=100&r=g&d=https://pacdn.500px.org/userpic.png">Tom</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	<!-- 上傳頁面 -->
	<div class="upload_all">
<!-- 把_csrf以Get的方法傳送 -->
		<form action="<c:url value="/iwow/doUpload"/>?${_csrf.parameterName}=${_csrf.token}" method="post"
			enctype="multipart/form-data">
			<!-- 	<form action="/iwow_test/iwow/doUpload2 " method="post" enctype="multipart/form-data"> -->
			
			<fieldset>
				<legend>Upload</legend>


				<!-- 選擇檔案 -->
				<div>
					<input class="upload_file_btn" type="file" name="pic" id="picture"
						accept="image/*">
				</div>

				<!-- 題目、說明文 -->
				<div>
					<label for="title">標題：</label> <input type="text" id="title"
						name="name" value=" ">
				</div>

				<div>
					<label for="description">描述：</label> <input type="text"
						id="description" name="description" value=" ">
				</div>

				<!-- TAG -->
				<div>
					<label for="tag">Tag：</label> <input type="text" id="tag"
						name="tags" value=" ">
				</div>
				<div>
					<input type="checkbox" name="keytag" value="keytag" id="keytag"><label
						for="keytag">鎖定TAG禁止其他用戶編輯</label>
				</div>

				<!-- 瀏覽限制 -->
				<div>
					<label>瀏覽限制：</label> <input type="radio" name="assort"
						value="GENERAL" id="all"><label for="all">全年齡</label> <input
						type="radio" name="assort" value="RESTRICTED" id="r18"><label
						for="r18">18禁</label>
				</div>

				<!-- 隱私 -->
				<div>
					<label>隱私：</label> <input type="radio" name="visibility"
						value="PUBLIC" id="PUBLIC"><label for="public">所有人</label>
					<!-- 		<input type="radio" name="visibility" value="friends" id="friends"><label for="friends">朋友</label>  enum暫時沒有可能要討論  -->
					<input type="radio" name="visibility" value="PRIVATE" id="PRIVATE"><label
						for="private">私人</label>
				</div>

				<!-- 預約排程投稿 -->
					<div>
						<label>預約投稿：</label>
						<div>
						<input type="checkbox"  value="reservation" id="reservation"/>
						<input type="text" name="update"id="datepicker" value="" />
						</div>
					</div>


				<!-- 送出/清除 -->

				<div>
					<input type="submit" value="PUBLISH"> <input type="reset"
						value="CLEAN">
				</div>

			</fieldset>
		</form>

	</div>
</body>
</html>