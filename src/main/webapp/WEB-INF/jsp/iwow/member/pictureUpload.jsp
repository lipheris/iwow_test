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
<!-- Sweet Alert 2 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.4.2/sweetalert2.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.4.2/sweetalert2.min.css">
<script type="text/javascript" src='<c:url value="/js/picture.js" />'></script>

<script>
	// jQuery datepicker
	$(function() {
		$("#datepicker").datepicker({
			minDate : -0,
			maxDate : "+1Y",
		}).datepicker("setDate", "0");
	});
</script>

<style>
/* banner */
.banner_searchicon {
	margin-left: 100px;
	margin-top: 7px;
}

/* 上傳頁面 */
#upload_all {
	position: absolute;
	left: 30%;
	top: 20%;
	margin-left: $demoW/-2;
	margin-top: $demoH/-2;
	padding: 20px 20px 20px 20px;
	width: $demoW;
	height: $demoH;
	background: #FFFFFF;
	border-radius: 3.0rem;
	box-shadow: 0 2rem 2rem rgba(0, 0, 0, 0.15);
	overflow: hidden;
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
	width:400px;
}

.panel panel-infos {
	margin-left: 100px;
}
</style>
</head>
<body>
	<!-- http://localhost:8080/iwowwow/iwow/member/upload -->
	<!-- banner -->
	<c:import url="../label/banner.jsp" />

	<!-- 上傳頁面 -->
	<div id="upload_all" class="panel panel-info">
		<!-- 把_csrf以Get的方法傳送 -->
		<form
			action="<c:url value="/iwow/doUpload"/>?${_csrf.parameterName}=${_csrf.token}"
			method="post" enctype="multipart/form-data">
			<!-- 	<form action="/iwow_test/iwow/doUpload2 " method="post" enctype="multipart/form-data"> -->

			<fieldset>
				<div class="col-lg-12">
					<h1 class="page-header">Upload</h1>
				</div>

				<!-- 選擇檔案 -->
				<div class="form-group">
					<label>File input</label> <input class="upload_file_btn"
						type="file" name="pic" id="picture" accept="image/*">
				</div>

				<!-- 題目、說明文 -->

				<div>
					<label class="control-label" for="inputWarning">標題：</label> <input
						type="text" id="title" name="name" value="">
				</div>

				<div>
					<label class="control-label" for="inputError">描述：</label> <input
						type="text" id="description" name="description" value="">
				</div>
				<h5 class="page-header"></h5>
				<!-- TAG -->

					<label for="tag">建議：</label>
				
				<div id="suggest">
					<c:forEach var="tags" items="${tags}">
						<input type="button" class="add_field_button" name=""
							value="${tags.name}">
					</c:forEach>
				</div>

				<div>
					<label class="control-label" for="inputSuccess">Tags:</label>
					<div class="input_fields_wrap">
						<input type="text" id="tagtext" name="tagtext">
						<div></div>
					</div>
				</div>

				<h5 class="page-header"></h5>

				<!-- 瀏覽限制 -->

				<div class="form-group">
					<label>瀏覽限制：</label>
					<div class="radio">
						<label> <input type="radio" name="assort" value="GENERAL"
							id="all" checked>全年齡
						</label> <label> <input type="radio" name="assort"
							value="RESTRICTED" id="r18">18禁
						</label>
					</div>
				</div>


				<!-- 隱私 -->
				<div class="form-group">
					<label>隱私：</label>
					<div class="radio">
						<label> <input type="radio" name="visibility"
							value="PUBLIC" id="PUBLIC" checked>所有人
						</label> <label for="private"> <input type="radio"
							name="visibility" value="PRIVATE" id="PRIVATE">私人
						</label>
					</div>
				</div>


				<!-- 預約排程投稿 -->

				<div class="form-group has-error">
					<label class="control-label" for="inputError">預約投稿：</label> <input
						type="checkbox" value="reservation" id="reservation" /> <input
						type="text" name="update" id="datepicker" value="" />
				</div>


				<!-- 送出/清除 -->

				<div align="right">
					<input type="submit" value="PUBLISH" class="btn btn-danger">
					<input type="reset" value="CLEAN" class="btn btn-primary">
				</div>

			</fieldset>
		</form>

		<script type="text/javascript">
			var max_fields = 5; //maximum input boxes allowed
			var wrapper = $(".input_fields_wrap"); //Fields wrapper
			var add_button = (".add_field_button"); //Add button ID
			var x = 1; //initlal text box count

			$('#suggest')
					.on(
							"click",
							".add_field_button",
							function(e) { //on add input button click
								e.preventDefault();
								if (x < max_fields) { //max input box allowed
									x++; //text box increment
									$(this).closest('input').remove();
									$(wrapper)
											.append(
													'<input type="button" class="remove_field"  name="tags" value="'
															+ $(this).attr(
																	"value")
															+ '" ><input type="hidden" name="tags"class="remove_field" value="'
															+ $(this).attr(
																	"value")
															+ '" >'); //add input box
								}
							});
			$(wrapper).on(
					"click",
					".remove_field",
					function(e) { //user click on remove text
						e.preventDefault();
						$("#suggest").append(
								'<input type="button" class="add_field_button" name="" value="'
										+ $(this).attr("value") + '" >'); //add input box
						$(this).next('input').remove();
						$(this).closest('input').remove();
						x--;
					})
			$('input[name=tagtext]')
					.change(
							function() {
								if (x < max_fields) { //max input box allowed
									x++; //text box increment
									$(wrapper)
											.append(
													'<input type="button" class="remove_field_write"  value="'
															+ $(
																	'input[name=tagtext]')
																	.val()
															+ '" ><input type="hidden" name="tags"class="remove_field" value="'
															+ $(
																	'input[name=tagtext]')
																	.val()
															+ '" >'); //add input box
								}
								$('input[name=tagtext]').val("");
							});
			$(wrapper).on("click", ".remove_field_write", function(e) { //user click on remove text
				e.preventDefault();
				$(this).next('input').remove();
				$(this).closest('input').remove();
				x--;
			})
		</script>

	</div>
</body>
</html>