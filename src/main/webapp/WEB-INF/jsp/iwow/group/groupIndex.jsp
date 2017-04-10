<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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

.userPro, .shopPro {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.icons, .bottons {
	text-align: right;
	margin-top: 30px;
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

.member { /*左邊的friends, followings, fans 小圖*/
	width: 20%;
	margin-bottom: 5px;
}

.friends, .followings, .fans {
	margin: 0 auto;
	text-align: center;
}

.more {
	text-align: right;
	margin-right: 8%;
}

.member_mark, .group {
	text-align: left;
	margin-left: 8%;
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
	<c:import url="../banner.jsp" /> 


	<!-- aside -->
	<aside>
	<div class="userPro" style="margin-bottom: 30px;">
		<img src="https://secure.gravatar.com/avatar/afb1c54ac11486de1a71f6e0cd3ccc16?s=100&r=g&d=https://pacdn.500px.org/userpic.png">
		<h4 style="margin: 5px;"><sec:authentication property="principal.username" /></h4>
		
	<form action="/iwowwow/iwow/member/edit" method="get">
		<input type="hidden" name="email" value="<sec:authentication property="principal.username" />"> 
		<input class="btn btn-info" type="submit" value="編輯個人資料">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
	</div>

	<div class="icons">
		<span class="glyphicon glyphicon-eye-open icon" aria-hidden="true">4315</span>
		<span class="glyphicon glyphicon-star-empty icon" aria-hidden="true">92</span>
		<span class="glyphicon glyphicon-heart-empty icon" aria-hidden="true">13</span>
		<span class="glyphicon glyphicon-shopping-cart icon"
			aria-hidden="true">2</span>
	</div>

	<div class="friends">
		<h3 class="member_mark">Friends</h3>
		<a href="#"><img class="member"
			src="https://secure.gravatar.com/avatar/afb1c54ac11486de1a71f6e0cd3ccc16?s=100&r=g&d=https://pacdn.500px.org/userpic.png"></a>
		<a href="#"><p class="more">MORE</p></a>
	</div>

	<div class="followings">
		<h3 class="member_mark">Following</h3>
		<a href="#"><img class="member"
			src="https://secure.gravatar.com/avatar/afb1c54ac11486de1a71f6e0cd3ccc16?s=100&r=g&d=https://pacdn.500px.org/userpic.png"></a>
		<a href="#"><p class="more">MORE</p></a>
	</div>

	<div class="fans">
		<h3 class="member_mark">Collections</h3>
		<a href="<c:url value="/iwow/member/collectionlist"/>"><p class="more">MORE</p></a>
	</div>

	<div class="groups">
		<h3 class="member_mark">Group</h3>
		<a href="<c:url value="/iwow/group"/>"><p class="more">MORE</p></a> 
		<a href="<c:url value="/iwow/group/groupAdd"/>"><p class="more">CREATE</p></a>
	</div>

	</aside>

	<article>
	<div>
		<a href="#"><h2>Popular</h2></a>
		<h2>/</h2>
		<a href="#"><h2>Following</h2></a>
	</div>

	<!-- example01 -->
	<div>
	<c:forEach var="group" items="${groupList}">
		<div>
			${group.name}
		</div>
	
	</c:forEach>
	</div>
	
	
 	</article>

</body>
</html>