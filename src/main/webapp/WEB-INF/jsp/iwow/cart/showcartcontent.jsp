<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"
	integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<!-- Sweet Alert 2 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.4.2/sweetalert2.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.4.2/sweetalert2.min.css">
<script type="text/javascript" src='<c:url value="/js/picture.js" />'></script>

<style class="cp-pen-styles">
.d {
	margin-top: 100px;
	margin-left: 150px;
	margin-right: 150px;
}

.product-image {
	float: left;
	width: 20%;
}

.dscs {
	inline-display: block;
	width: 12%
}

.product-details {
	float: left;
	width: 37%;
}

.product-price {
	float: left;
	width: 12%;
}

.product-quantity {
	float: left;
	width: 10%;
}

.product-removal {
	float: left;
	width: 9%;
}

.product-line-price {
	float: left;
	width: 12%;
	text-align: right;
}

/* This is used as the traditional .clearfix class */
.group:before, .shopping-cart:before, .column-labels:before, .product:before,
	.totals-item:before, .group:after, .shopping-cart:after, .column-labels:after,
	.product:after, .totals-item:after {
	content: '';
	display: table;
}

.group:after, .shopping-cart:after, .column-labels:after, .product:after,
	.totals-item:after {
	clear: both;
}

.group, .shopping-cart, .column-labels, .product, .totals-item {
	zoom: 1;
}

.product .product-price:before, .product .product-line-price:before,
	.totals-value:before {
	content: '$';
}

/* Body/Header stuff */
body {
	padding: 0px 30px 30px 20px;
	font-family: "HelveticaNeue-Light", "Helvetica Neue Light",
		"Helvetica Neue", Helvetica, Arial, sans-serif;
	font-weight: 100;
}

h1 {
	font-weight: 100;
}

label {
	color: #aaa;
}

.shopping-cart {
	margin-top: -45px;
}

/* Column headers */
.column-labels label {
	padding-bottom: 15px;
	margin-bottom: 15px;
	border-bottom: 1px solid #eee;
}

.column-labels .product-image, .column-labels .product-details,
	.column-labels .product-removal {
	text-indent: -9999px;
}

/* Product entries */
.product {
	margin-bottom: 20px;
	padding-bottom: 10px;
	border-bottom: 1px solid #eee;
}

.product .product-image {
	text-align: center;
}

.product .product-image img {
	width: 200px;
}

.product .product-details .product-title {
	margin-right: 20px;
	margin-left: 30px;
	font-family: "HelveticaNeue-Medium", "Helvetica Neue Medium";
	font-size: 20px;
}

.product .product-details .product-description {
	margin: 5px 20px 5px 30px;
	line-height: 1.4em;
}

.product .product-quantity input {
	width: 40px;
}

.product .remove-product {
	border: 0;
	padding: 4px 8px;
	background-color: #c66;
	color: #fff;
	font-family: "HelveticaNeue-Medium", "Helvetica Neue Medium";
	font-size: 12px;
	border-radius: 3px;
}

.product .remove-product:hover {
	background-color: #a44;
}

/* Totals section */
.totals .totals-item {
	float: right;
	clear: both;
	width: 20%;
	inline-display: block;
}

.totals .totals-item label {
	float: left;
	clear: both;
	width: 79%;
	text-align: right;
}

.totals .totals-item .totals-value {
	float: right;
	width: 21%;
	text-align: right;
}

.totals .totals-item-total {
	font-family: "HelveticaNeue-Medium", "Helvetica Neue Medium";
}

.checkout {
	float: right;
	border: 0;
	margin-top: -45px;
	padding: 6px 25px;
	background-color: #6b6;
	color: #fff;
	font-size: 25px;
	border-radius: 3px;
}

.giveup {
	float: right;
	border: 0;
	margin-top: -45px;
	margin-right: 20px;
	padding: 6px 25px;
	background-color: #6b6;
	color: #fff;
	font-size: 25px;
	border-radius: 3px;
}

.end {
	float: center;
}

.checkout:hover {
	background-color: #494;
}

/* Make adjustments for tablet */
@media screen and (max-width: 650px) {
	.shopping-cart {
		margin: 0;
		padding-top: 20px;
		border-top: 1px solid #eee;
	}
	.column-labels {
		display: none;
	}
	.product-image {
		float: right;
		width: auto;
	}
	.product-image img {
		margin: 0 0 10px 10px;
	}
	.product-details {
		float: none;
		margin-bottom: 10px;
		width: auto;
	}
	.product-price {
		clear: both;
		width: 70px;
	}
	.product-quantity {
		width: 100px;
	}
	.product-quantity input {
		margin-left: 20px;
	}
	.product-quantity:before {
		content: 'x';
	}
	.product-removal {
		width: auto;
	}
	.product-line-price {
		float: right;
		width: 70px;
	}
}
/* Make more adjustments for phone */
@media screen and (max-width: 350px) {
	.product-removal {
		float: right;
	}
	.product-line-price {
		float: right;
		clear: left;
		width: auto;
		margin-top: 10px;
	}
	.product .product-line-price:before {
		content: 'Item Total: $';
	}
	.totals .totals-item label {
		width: 60%;
	}
	.totals .totals-item .totals-value {
		width: 40%;
	}
}
</style>
</head>

<script type="text/javascript" src="../../js/jquery-1.11.3.min.js"></script>
<script>
	function DelCookie(name)
	//删除Cookie
	{
		var exp = new Date();
		exp.setTime(exp.getTime() - 1);
		var cval = GetCookie("buyCar");
		documents.cookie = name + "=" + cval + ";  expires="
				+ exp.toGMTString();
	}
</script>


<html>
<body>
	<c:import url="../label/banner.jsp" />

	<div class="d">
		<h1>Shopping Cart</h1>
		<div class="shopping-cart">

			<div class="column-labels">
				<label class="product-image">Image</label> <label
					class="product-details">Product</label> <label
					class="product-price">Price</label> 
					<label class="product-quantity">Quantity</label>
				<label class="product-removal">Remove</label> <label
					class="product-line-price">Total</label>
			</div>
			<c:set var="totalAmount" value="0" />
			<c:forEach var="list" items="${picMsg}">
				<div class="product">
					<div class="product-image">
						<img src='${list.pictureAddress}' name="id" value="${list.id}">
					</div>
					<div class="product-details">
						<div class="product-title">${list.name}</div>
						<p class="product-description"></p>
					</div>
					<div class="product-price">100</div>
					<div class="product-quantity">
						<input type="number" value="1" min="1" max="1">
					</div>
					<div class="product-removal">
						<a href="<c:url value="/iwow/picture/delpic?picId=${list.id}"/>">Remove</a>
					</div>
					<div class="product-line-price">100</div>
				</div>
				<c:set var="totalAmount" value="${totalAmount + 100}" />
			</c:forEach>
			<div class="totals">
				<div class="totals-item">
					<label>Subtotal</label>
					<div class="totals-value" id="cart-subtotal">${totalAmount}</div>
				</div>
			</div>

		</div>
		<form id='form1' method="GET"
			action="<c:url value='/iwow/picture/process' />">
			<div class="dscs">
				<h4>Description</h4>
				<textarea rows=4 name="DSC" cols=70></textarea>
			</div>
		</form>
		
<form id="formCreditCard" method="post" accept-charset="UTF-8"
 action="https://payment-stage.allpay.com.tw/Cashier/AioCheckOut/V2" >
<input type="hidden" name="MerchantID" value="2000132" />
<input type="hidden" name="MerchantTradeNo" value="DX${reportDate}0c16" />
<input type="hidden" name="MerchantTradeDate" value="${reportDate2}" />
<input type="hidden" name="PaymentType" value="aio" />
<input type="hidden" name="TotalAmount" value="${price}" />
<input type="hidden" name="TradeDesc" value="${tradeDesc}" />
<input type="hidden" name="ItemName" value="${ItemName}x${count}" />
<input type="hidden" name="ReturnURL" value="http://192.168.21.117:8080/iwowwow/iwow/trade/get" />
<input type="hidden" name="ChoosePayment" value="Credit" checked="checked" />
<input type="hidden" name="ClientBackURL" value="${ClientBackURL}" />
<input type="hidden" name="CreditInstallment" value="" />
<input type="hidden" name="InstallmentAmount" value="" />
<input type="hidden" name="Redeem" value="" />
<input type="hidden" name="EncryptType" value="1" />
<input type="hidden" name="CheckMacValue" value="${checkMacValue}" />
<!-- <input type="submit" value="送出訂單" /> -->

</form>
			<div class="end">
<!-- 				<a href="javascript:;" id="check" -->
<!-- 					onclick="document.getElementById('form1').submit();"> -->
					<button	class="checkout" id="check">Checkout</button></a> 
				<a href="<c:url value='/iwow/picture/giveup' />" onClick="return Abort();">
				<button class="giveup">Give up</button></a>
			</div>
		

	</div>
	<script type="text/javascript" src="../../js/jquery-1.11.3.min.js"></script>
	<script>
	$(function(){
		$("#check").on(type="click",function(){
			var dsc=$("textarea[name='DSC']").val();		
			console.log(dsc)
			$.getJSON("/iwowwow/iwow/picture/process",{"DSC":dsc},function(event){
				if(event){
					
					document.getElementById("formCreditCard").submit();
				}
				else{
					document.location.href='${pageContext.servletContext.contextPath}/iwow/index';
				}
			})
				
			
		})
	})
	</script>
</body>
</html>