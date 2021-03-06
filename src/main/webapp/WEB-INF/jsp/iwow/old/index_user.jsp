<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index_user</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- jQuery datepicker必要的CSS 及JS -->
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- sweetalert -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
 <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>

<script>
$(function(){
	 if("${correctMsg.correct}" != ""){
		 swal({ 
			  title: "註冊成功！", 
			  text: "恭喜您註冊成功！", 
			  type: "success"
			});
	 }
});
</script>

<style>

img {
	width: 30%;
}
aside {
	margin-left: 50px;
	width: 15%;
	float: left;
}
article {
	margin-left: 25%;
	width: 70%;
}

.icon {
	font-size: 20px;
	margin-right: 10px;
}

.main_picture {
	margin: 0 auto;
	margin: 20px;
	text-align: center;
}

h2 {
	display: inline;
}

.main_picture_panter_img_profile {
	display: inline-block;
	width: 200px;
}

.main_picture_panter_img_profile_picture {
	display: inline;
}

.main_picture_panter_img_profile_nickname {
	display: inline;
	font-size: 28px;
}

.main_picture_icons {
	display: inline-block;
	margin-left: 49%;
}

.main_picture_panter_detail_all {
	width: 68%;
	margin: 0 auto;
}

.main_picture_item {
	margin-bottom: 100px;
}
</style>
</head>
<body>
	<!-- banner import -->
	<c:import url="../label/banner.jsp" /> 

	<!-- aside -->
	<aside>
	<!-- user_profile import -->
	<c:import url="../label/user_profile.jsp" /> 
	<!-- user_social import -->
	<c:import url="../label/user_social.jsp" /> 
	</aside>
	<!-- aside -->

	<article>
	<div>
		<a href="#"><h2>Popular</h2></a>
		<h2>/</h2>
		<a href="#"><h2>Following</h2></a>
	</div>

	<!-- example01 -->
	<div class="main_picture_item">
		<div class="main_picture">
			<img style="width: 70%;" src="${pictureAd}">
		</div>

		<div class="main_picture_panter_detail_all">
			<div class="main_picture_panter_detail_top">
				<div class="main_picture_panter_img_profile">
					<a href="#"><img
						class="main_picture_panter_img_profile_picture"
						src="http://www.rd.com/wp-content/uploads/sites/2/2016/02/12-13-things-you-didnt-know-about-cats-no-chocolate.jpg"></a>
					<a href="#"><p class="main_picture_panter_img_profile_nickname">Cat</p></a>
				</div>

				<div class="main_picture_icons">
					<span class="glyphicon glyphicon-eye-open icon" aria-hidden="true">4315</span>
					<span class="glyphicon glyphicon-star-empty icon"
						aria-hidden="true">92</span> <span
						class="glyphicon glyphicon-heart-empty icon" aria-hidden="true">13</span>
					<span class="glyphicon glyphicon-shopping-cart icon"
						aria-hidden="true">2</span> <a href="#"><span
						class="glyphicon glyphicon-comment icon" aria-hidden="true"></span></a>
				</div>
			</div>
			<!-- main_picture_panter_detail_top -->

			<div class="main_picture_panter_detail_bottom">
				<h3>Bird</h3>
				<p>small bird withpale belly and breast and patterned wing and
					head stands on concrete</p>
			</div>
			<!-- main_picture_panter_detail_bottom -->

		</div>
		<!-- main_picture_panter_detail_all -->
	</div>
	<!-- main_picture_item --> <!-- example02 -->
	<div class="main_picture_item">
		<div class="main_picture">
			<img style="width: 70%;"
				src="https://upload.wikimedia.org/wikipedia/commons/3/32/House_sparrow04.jpg">
		</div>

		<div class="main_picture_panter_detail_all">
			<div class="main_picture_panter_detail_top">
				<div class="main_picture_panter_img_profile">
					<a href="#"><img
						class="main_picture_panter_img_profile_picture"
						src="http://www.rd.com/wp-content/uploads/sites/2/2016/02/12-13-things-you-didnt-know-about-cats-no-chocolate.jpg"></a>
					<a href="#"><p class="main_picture_panter_img_profile_nickname">Cat</p></a>
				</div>

				<div class="main_picture_icons">
					<span class="glyphicon glyphicon-eye-open icon" aria-hidden="true">4315</span>
					<span class="glyphicon glyphicon-star-empty icon"
						aria-hidden="true">92</span> <span
						class="glyphicon glyphicon-heart-empty icon" aria-hidden="true">13</span>
					<span class="glyphicon glyphicon-shopping-cart icon"
						aria-hidden="true">2</span> <a href="#"><span
						class="glyphicon glyphicon-comment icon" aria-hidden="true"></span></a>
				</div>
			</div>
			<!-- main_picture_panter_detail_top -->

			<div class="main_picture_panter_detail_bottom">
				<h3>Bird</h3>
				<p>small bird withpale belly and breast and patterned wing and
					head stands on concrete</p>
			</div>
			<!-- main_picture_panter_detail_bottom -->

		</div>
		<!-- main_picture_panter_detail_all -->
	</div>
	<!-- main_picture_item --> <!-- example03 -->
	<div class="main_picture_item">
		<div class="main_picture">
			<img style="width: 70%;"
				src="https://upload.wikimedia.org/wikipedia/commons/3/32/House_sparrow04.jpg">
		</div>

		<div class="main_picture_panter_detail_all">
			<div class="main_picture_panter_detail_top">
				<div class="main_picture_panter_img_profile">
					<a href="#"><img
						class="main_picture_panter_img_profile_picture"
						src="http://www.rd.com/wp-content/uploads/sites/2/2016/02/12-13-things-you-didnt-know-about-cats-no-chocolate.jpg"></a>
					<a href="#"><p class="main_picture_panter_img_profile_nickname">Cat</p></a>
				</div>

				<div class="main_picture_icons">
					<span class="glyphicon glyphicon-eye-open icon" aria-hidden="true">4315</span>
					<span class="glyphicon glyphicon-star-empty icon"
						aria-hidden="true">92</span> <span
						class="glyphicon glyphicon-heart-empty icon" aria-hidden="true">13</span>
					<span class="glyphicon glyphicon-shopping-cart icon"
						aria-hidden="true">2</span> <a href="#"><span
						class="glyphicon glyphicon-comment icon" aria-hidden="true"></span></a>
				</div>
			</div>
			<!-- main_picture_panter_detail_top -->

			<div class="main_picture_panter_detail_bottom">
				<h3>Bird</h3>
				<p>small bird withpale belly and breast and patterned wing and
					head stands on concrete</p>
			</div>
			<!-- main_picture_panter_detail_bottom -->

		</div>
		<!-- main_picture_panter_detail_all -->
	</div>
	<!-- main_picture_item --> </article>

</body>
</html>