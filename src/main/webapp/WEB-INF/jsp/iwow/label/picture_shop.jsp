<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<style>
.picture_shop.jsp {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
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

.u-flyer {
	display: block;
	width: 50px;
	height: 50px;
	border-radius: 50px;
	position: fixed;
	z-index: 9999;
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
						addcar.css("cursor", "default")
// 						.removeClass(
// 								'orange').unbind('click');
						//add 
						var buyCookie = GetCookie("buyCar");
						if (buyCookie.indexOf(buyId) == -1) {
							if (buyCookie && buyCookie != "null"
									&& buyCookie != "") {
								buyCookie = buyCookie + "," + buyId;
							} else {
								buyCookie = buyId;
							}
							SetCookie("buyCar", buyCookie);
						} else {
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

				
			});
});

function getCookieVal(offset) {
	var endstr = document.cookie.indexOf(";", offset);
	if (endstr == -1)
		endstr = document.cookie.length;
	return unescape(document.cookie.substring(offset, endstr));
}

function GetCookie(name) {
	var arg = name + "=";
	var alen = arg.length;
	var clen = document.cookie.length;
	var i = 0;
	while (i < clen) {
		var j = i + alen;
		if (document.cookie.substring(i, j) == arg) {
			return getCookieVal(j);
		}
		i = document.cookie.indexOf(" ", i) + 1;
		if (i == 0)
			break;
	}
	return null;
}

function SetCookie(name, value) {
	var argv = SetCookie.arguments;
	var argc = SetCookie.arguments.length;
	var expires = (argc > 2) ? argv[2] : null;
	var path = (argc > 3) ? argv[3] : null;
	var domain = (argc > 4) ? argv[4] : null;
	var secure = (argc > 5) ? argv[5] : false;
	document.cookie = name
			+ "="
			+ escape(value)
			+ ((expires == null) ? "" : ("; expires=" + expires
					.toGMTString()))
			+ ((path == null) ? "" : ("; path=" + path))
			+ ((domain == null) ? "" : ("; domain=" + domain))
			+ ((secure == true) ? "; secure" : "");
}

</script>
</head>

<body>
	<div class="picture_shop.jsp" style="margin-bottom: 30px;">
		<h3 style="margin-bottom: 0px;" align="center">Shopping</h3>
		<div class="m-sidebar">
			<a href="/iwowwow/iwow/picture/showcartcontent">
				<div class="cart" align="center">
					<i id="end"><img src="../../images/car.gif"></i> <span
						id="carCnt"></span> <span id="carMoney"></span>
				</div>
			</a>
			<div id="msg">已成功加入購物車！</div>
		</div>


	</div>
</body>
</html>
