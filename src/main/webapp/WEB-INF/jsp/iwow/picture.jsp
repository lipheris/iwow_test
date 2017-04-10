<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>picture</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="  crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Sweet Alert 2 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.4.2/sweetalert2.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.4.2/sweetalert2.min.css">


<style>
img {
	width: 30%;
}

aside {
	margin-left: 50px;
	width: 15%;
	float: left;
	/*  background-color:pink;  */
}

article {
	margin-left: 25%;
	width: 70%;
}


.icons, .bottons {
	text-align: right;
	margin-top: 30px;
}

.icon {
	font-size: 20px;
	margin-right: 10px;
}

.mainPicture {
	margin-left: auto;
	margin-right: auto;
	margin: 20px;
	text-align: center;
}

.btn-sm {
	border-radius: 10px;
	margin-left: 15px;
	margin-top: 10px;
	margin-bottom: 10px;
}

.related {
	margin: 5px;
	vertical-align: top;
}

.relatedBtn {
	margin-top: 30px;
	margin-bottom: 80px;
	text-align: center;
}
</style>
</head>
<body>
	<!-- banner import -->
	<c:import url="banner.jsp" />


	<!-- aside -->
	<aside>
	<!-- picture_painter import-->
	<c:import url="picture_painter.jsp" /> 
	
	<!-- picture_shop.jsp import-->
	<c:import url="picture_shop.jsp.jsp" /> 
	
	<!-- picture_comment import-->
	<c:import url="picture_comment.jsp" /> 

	<img style="float: left; margin: 3px; margin-top: 10px;"
		src="http://www.rd.com/wp-content/uploads/sites/2/2016/02/12-13-things-you-didnt-know-about-cats-no-chocolate.jpg">
	<h4 style="display: inline-block; margin-bottom: 0px;">cat01</h4>
	<p
		style="display: inline-block; margin-bottom: 0px; margin-left: 10px;">Aprl
		05</p>
	<p>yummy</p>

	<img style="float: left; margin: 3px; margin-top: 10px;"
		src="http://www.rd.com/wp-content/uploads/sites/2/2016/02/12-13-things-you-didnt-know-about-cats-no-chocolate.jpg">
	<h4 style="display: inline-block; margin-bottom: 0px;">cat01</h4>
	<p
		style="display: inline-block; margin-bottom: 0px; margin-left: 10px;">Mar
		28</p>
	<p>So Cute</p>

	<img style="float: left; margin: 3px; margin-top: 10px;"
		src="http://www.rd.com/wp-content/uploads/sites/2/2016/02/12-13-things-you-didnt-know-about-cats-no-chocolate.jpg">
	<h4 style="display: inline-block; margin-bottom: 0px;">cat01</h4>
	<p
		style="display: inline-block; margin-bottom: 0px; margin-left: 10px;">Mar
		05</p>
	<p>WOW</p>


	</aside>
	<!-- article -->
	<c:import url="picture_article.jsp" />
</body>
</html>