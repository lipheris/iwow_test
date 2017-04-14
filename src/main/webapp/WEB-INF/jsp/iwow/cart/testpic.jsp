<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title></title>


<style type="text/css">
.demo {
	width: 820px;
	margin: 50px auto 10px auto
}

.m-sidebar {
	position: fixed;
	top: 100px;
	right: 10px;
	background: #000;
	z-index: 2000;
	width: 50px;
	height: 100px;
	font-size: 12px;
	color: #fff;
}

.cart {
	color: #fff;
	text-align: center;
	line-height: 20px;
	padding: 0px 0 0 0px;
}

.cart span {
	display: block;
	width: 30px;
	margin: 0 auto;
}

.cart i {
	width: 35px;
	height: 35px;
	margin-top: 5px;
	margin-right: auto;
}

#msg {
	position: fixed;
	top: 300px;
	right: 35px;
	z-index: 10000;
	width: 1px;
	height: 52px;
	line-height: 52px;
	font-size: 20px;
	text-align: center;
	color: #fff;
	background: #360;
	display: none
}

.box {
	float: left;
	width: 198px;
	height: 320px;
	margin-left: 5px;
	border: 1px solid #e0e0e0;
	text-align: center
}

.box p {
	line-height: 20px;
	padding: 4px 4px 2px 4px;
	text-align: left
}

.box:hover {
	border: 1px solid #f90
}

.box h4 {
	line-height: 32px;
	font-size: 14px;
	color: #f30;
	font-weight: 500
}

.box h4 span {
	font-size: 20px
}

.u-flyer {
	display: block;
	width: 50px;
	height: 50px;
	border-radius: 50px;
	position: fixed;
	z-index: 9999;
}

.button {
	display: inline-block;
	outline: none;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	font: 16px/100% 'Microsoft yahei', Arial, Helvetica, sans-serif;
	padding: .5em 1em .55em;
	text-shadow: 0 1px 1px rgba(0, 0, 0, .3);
	-webkit-border-radius: .5em;
	-moz-border-radius: .5em;
	border-radius: .5em;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
}

.button:hover {
	text-decoration: none;
}

.button:active {
	position: relative;
	top: 1px;
}
/* orange */
.orange {
	color: #fef4e9;
	border: solid 1px #da7c0c;
	background: #f78d1d;
	background: -webkit-gradient(linear, left top, left bottom, from(#faa51a),
		to(#f47a20));
	background: -moz-linear-gradient(top, #faa51a, #f47a20);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#faa51a',
		endColorstr='#f47a20');
}

.orange:hover {
	background: #f47c20;
	background: -webkit-gradient(linear, left top, left bottom, from(#f88e11),
		to(#f06015));
	background: -moz-linear-gradient(top, #f88e11, #f06015);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f88e11',
		endColorstr='#f06015');
}

.orange:active {
	color: #fcd3a5;
	background: -webkit-gradient(linear, left top, left bottom, from(#f47a20),
		to(#faa51a));
	background: -moz-linear-gradient(top, #f47a20, #faa51a);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f47a20',
		endColorstr='#faa51a');
}
</style>
<script type="text/javascript" src="../../js/jquery-1.11.3.min.js"></script>
<script src="../../js/jquery.fly.min.js"></script>


<script>
	$(function() {
		var offset = $("#end").offset();
		$(".addcar").click(
				function(event) {
					var addcar = $(this);
					var buyId = addcar.parent().find('input').eq(0).val();
					var img = addcar.parent().find('img').attr('src');
					var flyer = $('<img class="u-flyer" src="'+img+'">');
					flyer.fly({
						start : {
							left : event.pageX,
							top : event.pageY
						},
						end : {
							left : offset.left + 10,
							top : offset.top + 10,
							width : 0,
							height : 0
						},
						onEnd : function() {
							$("#msg").show().animate({
								width : '250px'
							}, 200).fadeOut(1000);
							addcar.css("cursor", "default").removeClass(
									'orange').unbind('click');
							//add 
							var buyCookie = GetCookie("buyCar");
							if(buyCookie.indexOf(buyId) == -1){
								if(buyCookie && buyCookie != "null" && buyCookie != ""){
									buyCookie = buyCookie + "," + buyId;
								}else{
									buyCookie =  buyId;
								}
								SetCookie("buyCar", buyCookie);
							}else{
								alert("購物車已有");
							}							
							this.destory();
						}
					});

					var money = $(this).attr("money");
					var carMoney = $("#carMoney").text();

					var carCnt = $("#carCnt").text();
					if (carCnt == null || carCnt == undefined || carCnt == '') {
						carCnt = parseInt(0);
					}
					if (carMoney == null || carMoney == undefined
							|| carMoney == '') {
						carMoney = parseInt(0);
					}

					carMoney = carMoney.toString().replace("$", "");
					$("#carMoney").text(
							'$' + (parseInt(money) + parseInt(carMoney)));

					carCnt = carCnt.toString().replace("(", "");
					carCnt = carCnt.toString().replace(")", "");
					$("#carCnt").text('(' + (parseInt(carCnt) + 1) + ')');

				});
	});
	
	function getCookieVal(offset) {
		var endstr = document.cookie.indexOf (";", offset);
		if (endstr == -1)
		endstr = document.cookie.length;
		return unescape(document.cookie.substring(offset, endstr));
	}
		
	function GetCookie (name) {
		var arg = name + "=";
		var alen = arg.length;
		var clen = document.cookie.length;
		var i = 0;
		while (i < clen) {
			var j = i + alen;
			if (document.cookie.substring(i, j) == arg){
				return getCookieVal (j);
			}
			i = document.cookie.indexOf(" ", i) + 1;
			if (i == 0)
				break;
		}
		return null;
	}
	
	function SetCookie (name, value) {
		var argv = SetCookie.arguments;
		var argc = SetCookie.arguments.length;
		var expires = (argc > 2) ? argv[2] : null;
		var path = (argc > 3) ? argv[3] : null;
		var domain = (argc > 4) ? argv[4] : null;
		var secure = (argc > 5) ? argv[5] : false;
		document.cookie = name + "=" + escape (value) +
		((expires == null) ? "" : ("; expires=" + expires.toGMTString())) +
		((path == null) ? "" : ("; path=" + path)) +
		((domain == null) ? "" : ("; domain=" + domain)) +
		((secure == true) ? "; secure" : "");
	}
</script>
</head>

<body>

	<div id="main">
		<form action="/iwowwow/iwow/cart/buypic" method="get">
			<c:forEach var="list" items="${picMsg}">
				<div class="demo">
					<div class="box">
						<img src="${list.pictureAddress}" width="180" height="180" name="picId" 
						value="${list.id}">
						<p align="center">
							$<span>100</span>
						</p>
						<p align="center">${list.name}</p>
						<input type="hidden" name="id" value="${list.id}"> <input
							type="hidden" name="name" value="${list.name}"> <input
							type="hidden" name="pictureAddress"
							value="${list.pictureAddress}"> <a
							href="javascript: void(0)" class="button orange addcar"
							money='100'>加入購物車</a>
					</div>
				</div>
			</c:forEach>

			<div class="m-sidebar">
				<a href="/iwowwow/iwow/cart/showcartcontent">
					<div class="cart">
						<i id="end"><img src="../../images/car.jpg" width=50px></i><span
							id="carCnt"></span> <span id="carMoney"></span>
					</div>
				</a>
			</div>
			<div id="msg">已成功加入購物車！</div>
		</form>
	</div>
	
	<center>
		<a href="<c:url value='/iwow/cart/orderlistdetail' />">訂購紀錄</a>
	</center>
	<!-- 	<form action="/iwowwow/iwow/listpic" method="get"> -->
	<!-- 		<input type="submit" value="查詢所有圖"> -->
	<!-- 	</form> -->



</body>
</html>
