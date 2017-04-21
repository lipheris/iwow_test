<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
img {
	width: 30%;
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

</style>

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
		<a href="<c:url value="/iwow/group/add"/>"><p class="more">CREATE</p></a>
	</div>
	