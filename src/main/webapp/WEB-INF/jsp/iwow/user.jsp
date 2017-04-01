<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>user</title>

<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<style>
/* 個人頁面  user_all*/
.user_all{
	width:1200px;
	margin:0 auto;
}

/* user_profile 作者照片與名字 */
.user_profile{
	float: left;
}
.user_profile_img{
	float: left;
	width:130px;
	margin:20px;
}
.user_profile_name{
	float:left;
	font-size:80px;
	padding-top:30px;
}

/* user_action Follow、Add Friend、Hire按鈕 */
.user_action{
	float: left;
	width:100px;
	margin:30px;
}
.user_action_btn{
	width:100px;
}

/* 統計數據  user_stats*/
.user_stats{
	float: left;
	margin:50px;
	margin-left:200px;
}
.user_stats_icon{
	font-size:50px;
}

/* Works、Followers、Following、Likes、Service */
.user_nav{
	clear: left;
	margin:10px;
}
.user_nav_active, .user_nav_slash{
	display:inline-block;
	font-size:25px;
}

/* Works、Followers、Following、Likes、Service結果 */
.user_works_picture{
	width:30%;
	margin:5px;
	display:inline-block;
	vertical-align:top;
}
</style>
</head>
<body onload='document.logoutForm.username.focus();'>
<!-- banner import -->
	<c:import url="banner.jsp" /> 
	
	
	<!-- 個人頁面  -->
	<div class="user_all">
	
	<!-- 上方個人資訊  -->
	<div class="user_top">
	
	<!-- 作者照片與名字 -->
	<div class="user_profile">
		<img class="user_profile_img" src="https://secure.gravatar.com/avatar/afb1c54ac11486de1a71f6e0cd3ccc16?s=100&r=g&d=https://pacdn.500px.org/userpic.png">
		<span class="user_profile_name" >Tom</span>
	</div>
	
	<!-- Follow、Add Friend、Hire按鈕 -->
	<div class="user_action">
		<button class="btn btn-primary user_action_btn" type="submit">Follow</button>
		<button class="btn btn-success user_action_btn" type="submit">Add Friend</button>
		<button class="btn btn-info user_action_btn" type="submit">Hire</button>
	</div>
	
	<!-- 統計數據 -->
	<div class="user_stats">
		<span class="glyphicon glyphicon-eye-open user_stats_icon" aria-hidden="true">4315</span>
		<span class="glyphicon glyphicon-star-empty user_stats_icon" aria-hidden="true">92</span>
		<span class="glyphicon glyphicon-heart-empty user_stats_icon" aria-hidden="true">13</span>
		<span class="glyphicon glyphicon-shopping-cart user_stats_icon" aria-hidden="true">2</span>
	</div>
	
	</div>
	
	<!-- 下方個人資訊 -->
	<div class="user_bottom">
	<!-- Works、Followers、Following、Likes、Service -->
	<div class="user_nav">
		<a href="#" class="user_nav_active">Works</a>
		<p class="user_nav_slash">/</p>
		<a href="#" class="user_nav_active">Followers</a>
		<p class="user_nav_slash">/</p>
		<a href="#" class="user_nav_active">Following</a>
		<p class="user_nav_slash">/</p>
		<a href="#" class="user_nav_active">Likes</a>
		<p class="user_nav_slash">/</p>
		<a href="#" class="user_nav_active">Service</a>
	</div>

	<!-- Works、Followers、Following、Likes、Service結果 -->
	<div class="user_works">
		<img class="user_works_picture" src="http://d2fbmjy3x0sdua.cloudfront.net/sites/default/files/styles/engagement_card/public/sfw_apa_2013_28342_232388_briankushner_blue_jay_kk_high.jpg?itok=ttMfUhUu">
		<img class="user_works_picture" src="http://s7d2.scene7.com/is/image/PetSmart/ARFEAT-CaringForYourBird-20160818?$CL0601$">
		<img class="user_works_picture" src="https://s-media-cache-ak0.pinimg.com/originals/28/ca/6d/28ca6dc83ab41cfb2f90c867ebb31383.jpg">
		<img class="user_works_picture" src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTxWjwdli7SzC13-nd9JnsNFcBPPOL8QCI8fsWcA5Vo3RUCQQ5y">
		<img class="user_works_picture" src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRpLzfMG2-bYjQhJ-Yz6KNBKE3H0NkYnWGJOJF3cE1Z0nzFKTP6">
		<img class="user_works_picture" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQjXvYGODrgdGssCS2enKxCuhpU-xWC_aNwDX8q36OtmEUcV24FeA">	
	</div>
	
	</div>
	
	</div>

</body>
</html>