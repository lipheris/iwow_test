<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style>
.userPro {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
img {
	width: 30%;
}
.icons {
	text-align: right;
	margin-top: 30px;
}

.icon {
	font-size: 20px;
	margin-right: 10px;
}

</style>

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