<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>個人訂單明細</title>

</head>
<body>

	<p />
	<TABLE border="2">
		<tr height='50'>
			<th align="center" colspan="8"><h3>訂單明細</h3></th>
		</tr>
		<tr height='36'>
			<td colspan="7">
				<table border='0'>
					<tr>

						<td align="center" width="500px">訂購日期:${OrderBean.update}</td>
						<td align="right" width="150px">訂單編號:${OrderBean.id}</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr height='36'>
			<th width="ˇ350px" align="center">圖片</th>
			<th width="1200px" align="center">圖片名稱</th>
			<th width="100px" align="center">單價</th>

		</tr>
		<c:set var="subtotal" value="0" />
		<c:forEach var="aBean" varStatus="stat"	items="${OrderBean.orderDetails}">
			<tr>	
				<td align="center"><img height='120' width='120' src='${aBean.picSpec}'></TD>

				<td align="center">${aBean.picName}&nbsp;</td>
				<td align="center"><fmt:formatNumber value="${aBean.price}"
						pattern="#,###,###" />元</td>


				<c:set var="subtotal" value="${subtotal+aBean.price}" />
			</tr>


		</c:forEach>
	
		<tr height='30'>
			<TD width="300px" colspan="2" align="center">合 計</TD>
			<TD width="300px" align="center">${price}元</TD>
		</tr>
		
		<tr>
			<TD align="center">補充說明：</TD>
			<TD width="300px" colspan="2" rows="5" name="DSC">${OrderBean.dsc}</TD>
		</tr>
		
		
	</TABLE>
	<p />

	<center>
		<a href="<c:url value='/iwow/cart/listpic' />">回首頁</a>
	</center>
</body>
</html>



