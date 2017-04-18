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
	width: 65%
}

.product-details {
	float: left;
	width: 37%;
	padding-right:30px;
	padding-left:30px;
}

.product-price {
	float: left;
	width: 12%;
	padding-right:30px;
	padding-left:30px;
}

.product-quantity {
	float: left;
	width: 10%;
	padding-right:30px;
	padding-left:30px;
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
	.column-labels {
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
	margin: 5px 0px 5px 30px;
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

.Details {
	float: right;
	border: 0;
	margin-top: -70px;
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

	.product-line-price {
		float: right;
		width: 70px;
	}
}
/* Make more adjustments for phone */
@media screen and (max-width: 350px) {
	
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
		<h5>Order Date：${OrderBean.update}</h5>
		<h5>Order Nnumber：${OrderBean.id}</h5>
		<div class="shopping-cart">

			<div class="column-labels">
				<label class="product-image">Image</label> <label
					class="product-details">Product</label> <label
					class="product-price" align="center">Price</label> 
					<label class="product-quantity" align="center">Quantity</label>
				<label class="product-line-price" align="center">Total</label>
			</div>
			<c:set var="totalAmount" value="0" />
			<c:forEach var="aBean" varStatus="stat"
				items="${OrderBean.orderDetails}">
				<div class="product">
					<div class="product-image">
						<img src='${aBean.picSpec}'">
					</div>
					<div class="product-details">
						<div class="product-title">${aBean.picName}</div>
						<p class="product-description">The best dog bones of all time.
							Holy crap. Your dog will be begging for these things! I got
							curious once and ate one myself. I'm a fan.</p>
					</div>
					<div class="product-price">100</div>
					<div class="product-quantity">1</div>
					<div class="product-line-price" value="${aBean.price}">100</div>
				</div>
				<c:set var="subtotal" value="${subtotal+aBean.price}" />
			</c:forEach>
			<div class="totals">
				<div class="totals-item">
					<label>Subtotal</label>
					<div class="totals-value" id="cart-subtotal">${subtotal}</div>
				</div>
			</div>

		</div>
		<form id='form1' method="GET"
			action="<c:url value='/iwow/cart/process' />">
			<div class="dscs">
				<div class="panel panel-success">
					<div class=" panel-heading">
						<h3 class=" panel-title ">Description</h3>
					</div>
					<div class=" panel-body ">${OrderBean.dsc}</div>
				</div>
			</div>
		</form>

		<div class="end">
			<a href="<c:url value='/iwow/cart/orderlistdetail' />">
				<button class="Details">Order Details</button>
			</a>
		</div>


	</div>
</body>
</html>