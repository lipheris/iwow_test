<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>report</title>

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

<style>

/* 檢舉頁面 */
.report_all {
	width: 1000px;
	margin: 0 auto;
}

/* 左邊被檢舉的圖 */
.report_img {
	float: left;
	margin-top: 50px;
	margin-right: 40px;
}

/* 右邊表單 */
/* fieldset */
fieldset {
	font-size: 25px;
	font-family: Microsoft JhengHei; /* 微軟正黑體 */
}

legend {
	font-size: 40px;
	font-family: Courier;
}

/* 間距 */
.report_spac {
	margin: 5px;
	margin-bottom: 10px;
}
/* 限制textarea的大小始使用者無法自由縮放 */
textarea {
	resize: none;
}
.report_all{
	margin-top:100px;
}
</style>

</head>
<body onload='document.logoutForm.username.focus();'>
	<!-- banner import -->
	<c:import url="../label/banner.jsp" />


	<!-- 檢舉 -->
	<div class="report_all">

		<!-- 被檢舉的圖 -->
		<div class="report_all_left">
			<img class="report_img"
				src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRpLzfMG2-bYjQhJ-Yz6KNBKE3H0NkYnWGJOJF3cE1Z0nzFKTP6">
		</div>

		<div class="report_all_right">
			<fieldset>
				<legend>Report</legend>

				<form action="/iwowwow/iwow/insertReport" method="post">

					<!-- 檢舉原因 -->
					<div class="report_spac">
						<label>檢舉原因：</label>
						<div class="report_spac">
							<input type="radio" name="reason" value="r18" id="r18"><label
								for="r18">十八禁卻未標籤</label>
						</div>
						<div class="report_spac">
							<input type="radio" name="reason" value="portrait" id="portrait"><label
								for="portrait">違反肖像權</label>
						</div>
						<div class="report_spac">
							<input type="radio" name="reason" value="copyright"
								id="copyright"><label for="copyright">違反著作權法</label>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" name="reportId" value="${picId}" />
					</div>

					<!-- 其他原因 -->
					<div class="report_spac">
						<label for="other">其他：</label>
					</div>
					<div class="report_spac">
						<textarea rows="6" cols="50" id="other" name="textReport"
							placeholder="請輸入檢舉原因"></textarea>
					</div>

					<!-- 送出/清除 -->
					<div class="report_spac">
						<input type="submit" value="送出">
					</div>
				</form>
			</fieldset>


		</div>

	</div>
</body>
</html>