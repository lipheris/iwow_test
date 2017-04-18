<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<style>
.icons {
	margin-top: 50px;
}
</style>

<script type="text/javascript">
	function reportDetail() {
		window.location.href = "/iwowwow/iwow/sendEport?reportId=${picId}";
	}
	console.log(picture_id)
	function get_picture_value(picture) {
		// 	$("#cart-val").text(picture.name);
		// 	var picture_img = $("img[id='picture_img']").attr({ "src": picture.pictureAddress}).css({"width": "70%", "height": "70%"});
		//	var picture_link= picture_img.parent().attr({"href":picture.pictureAddress,"data-lightbox":"picture",'data-title':picture.name});
	}
</script>
<div id="pic_info">
	<h1 id="pic_name"></h1>
	<h1 id="pic_author_name"></h1>
</div>

<div class="icons" id="pic_icons">
	<span class="glyphicon glyphicon-eye-open icon" aria-hidden="true"
		id="views"></span> <span class="glyphicon glyphicon-star-empty icon"
		aria-hidden="true" id="likes"></span>
	<p align="center">
		$<span>100</span>
	</p>
	<div id="cart-val">

		<img src="${picture.pictureAddress}" width="180" height="180"
			name="picId" value="${picture.id}" style="display: none"> <input
			type="hidden" name="id" value="${picture.id}"> <input
			type="hidden" name="name" value="${picture.name}"> <input
			type="hidden" name="pictureAddress" value="${picture.pictureAddress}">
		<a href="javascript: void(0)" money='100' class="addcar"> <span
			class="glyphicon glyphicon-shopping-cart icon" aria-hidden="true"
			id="shopping_cart"></span>
		</a>
	</div>
</div>


<div class="mainPicture" id="picture_img">
	<a><img id="picture_img" /></a>
</div>

<div class="bottons" id="pic_buttons">
	<button class="btn btn-primary" type="submit" id="pic_buttons">FB</button>
	<button class="btn btn-success" type="submit" id="pic_buttons">DONATE</button>
	<button class="btn btn-danger" type="submit" onclick="reportDetail()">檢舉</button>
</div>

<!-- tag -->
<div id="pic_tags"></div>

<!-- related pic -->
<div style="margin: 10px;" id="pic_related"></div>