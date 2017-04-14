<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>iwowwow</title>


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

<style>
.imgbox {
	width: 1000px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}

img {
	width: 30%;
	margin: 5px;
	display: inline-block;
	vertical-align: top;
}

.imgBtn {
	width: 100%;
}

.imgForm {
	width: 30%;
	margin: 5px;
	display: inline-block;
	vertical-align: top;
}

.buttons {
	text-align: center;
	margin-top: 30px;
	margin-bottom: 80px;
}
</style>

</head>
<body>
	<c:set var="funcName" value="ORD" scope="session" />
	<center>
		<table border="2" bordercolor="blue" style="background: #EFEFFB;">

			<tr height='50'>
				<th colspan="4" align="center">您好，您的訂購紀錄如下</th>
			</tr>
			<tr height='36'>
				<th>訂單編號</th>
				<th>訂購日期</th>
				<th>下載檔案</th>

			</tr>
			<c:forEach var="anOrderBean" varStatus="stat" items="${orders}">
				<TR height='30'>
					<TD width="86" align="center"><a
						href='<c:url value='/iwow/cart/getalldetail?id=${anOrderBean.id}' />'>
							${anOrderBean.id} </a></TD>
					<TD width="200" align="center">${anOrderBean.update}</TD>
					<TD width="200" align="center"><a href="<c:url value='/iwow/cart/download?id=${anOrderBean.id}' />">圖片下載</a></TD>					
				</TR>


			</c:forEach>


			<tr height='36'>
				<td align="center" colspan="4"><A
					href="<c:url value='/iwow/cart/listpic' />">回首頁</a></td>
			</tr>
		</TABLE>
	</center>
</body>
</html>