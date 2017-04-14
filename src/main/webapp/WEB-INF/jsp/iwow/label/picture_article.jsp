<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<style>
.icons{
	margin-top:50px;
}
</style>
<script type="text/javascript">
function reportDetail(){
window.location.href="/iwowwow/iwow/sendEport?reportId=${picId}";
}
</script>
<div id="pic_info">
	<h1 id="pic_name"></h1>
	<h1 id="pic_author_name"></h1>
</div>

<div class="icons" id="pic_icons">
	<span 	class="glyphicon glyphicon-eye-open icon" aria-hidden="true" id="views"></span> 
	<span 	class="glyphicon glyphicon-star-empty icon" aria-hidden="true" id="likes"></span> 
	<span 	class="glyphicon glyphicon-shopping-cart icon" aria-hidden="true" id="shopping_cart"></span>
</div>

<div class="mainPicture" id="picture_img">
	<a><img id = "picture_img" /></a>
</div>

<div class="bottons" id="pic_buttons">
	<button class="btn btn-primary" type="submit" id="pic_buttons">FB</button>
	<button class="btn btn-success" type="submit" id="pic_buttons">DONATE</button>
	<button class="btn btn-danger"  type="submit" onclick="reportDetail()">檢舉</button>
</div>

<!-- tag -->
<div id="pic_tags"></div>

<!-- related pic -->
<div style="margin: 10px;" id="pic_related"></div>
