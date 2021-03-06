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
<title>search</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"
	integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script type="text/javascript">
var result = (${result})
</script>
<script type="text/javascript"
	src='<c:url value="/js/search_result.js" />'></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<style>

/* 搜尋結果頁面  search_all*/
.search_all {
	width: 1200px;
	margin: 0 auto;
}
/* 搜尋結果有幾張照片的統計數據 */
.search_picture {
	float: left;
}

.search_picture_stats {
	font-size: 25px;
	padding: 5px;
	padding-right: 10px;
}

/* 相關搜尋(TAG) */
.search_related {
	float: right;
}

.search_related_name, .search_related_tag {
	font-size: 25px;
}

/* search_bottom */
.search_bottom {
	padding-top: 80px;
}

/* Image、Auther */
.search_nav {
	clear: both;
	float: left;
	margin: 10px;
}

.search_nav_active, .search_nav_slash {
	display: inline-block;
	font-size: 30px;
}

/* ☆進階搜尋☆ */
.search_advanced {
	padding: 20px;
}

.search_advanced_stats {
	font-size: 25px;
	float: right;
	padding: 5px;
	padding-right: 10px;
}

/* Search結果 */
.search_result {
	clear: left;
}

.search_result_picture {
	width: 30%;
	margin: 5px;
	display: inline-block;
	vertical-align: top;
}
</style>
</head>
<body>
	<!-- banner import -->
	<c:import url="../label/banner.jsp" />


	<!-- 搜尋結果頁面  -->
	<div class="search_all">

		<div class="search_top">
			<!-- 搜尋結果有幾張照片的統計數據 -->
			<div class="search_picture">
				<span class="search_picture_stats">1,163,241</span> <span
					class="search_picture_stats">Bird</span> <span
					class="search_picture_stats">Picture</span>
			</div>

			<!-- 相關搜尋(TAG) -->
			<div class="search_related">
				<span class="search_related_name">Related Searches：</span> <a
					href="#" class="search_related_tag">nature,</a> <a href="#"
					class="search_related_tag">wings,</a> <a href="#"
					class="search_related_tag">animal</a>
			</div>
		</div>

		<!-- search_bottom -->
		<div class="search_bottom">
			<!-- Image、Auther -->
			<div class="search_nav">
				<a href="#" class="search_nav_active">Image</a>
				<p class="search_nav_slash">/</p>
				<a href="#" class="search_nav_active">Auther</a>
			</div>

			<!-- ☆進階搜尋☆ -->
			<div class="search_advanced">
				<a href="#"
					class="glyphicon glyphicon-star-empty search_advanced_stats"
					aria-hidden="true">500</a> <a href="#"
					class="glyphicon glyphicon-star-empty search_advanced_stats"
					aria-hidden="true">100</a> <a href="#"
					class="glyphicon glyphicon-star-empty search_advanced_stats"
					aria-hidden="true">50</a>
			</div>

			<!-- Search結果 -->
			<div class="search_result" id="search_result"></div>
		</div>
	</div>
</body>
</html>