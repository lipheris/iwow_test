<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="../../js/jquery-1.11.3.min.js"></script>
<script>
	// 	$(function() {
	// 		var buyIds =  GetCookie("car");
	// 		var buyIdArray = buyIds.split(",");
	// 	});

	// 	function getCookieVal(offset) {
	// 		var endstr = document.cookie.indexOf (";", offset);
	// 		if (endstr == -1)
	// 		endstr = document.cookie.length;
	// 		return unescape(document.cookie.substring(offset, endstr));
	// 	}

	// 	function GetCookie (name) {
	// 		var arg = name + "=";
	// 		var alen = arg.length;
	// 		var clen = document.cookie.length;
	// 		var i = 0;
	// 		while (i < clen) {
	// 			var j = i + alen;
	// 			if (document.cookie.substring(i, j) == arg){
	// 				return getCookieVal (j);
	// 			}
	// 			i = document.cookie.indexOf(" ", i) + 1;
	// 			if (i == 0)
	// 				break;
	// 		}
	// 		return null;
	// 	}

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

	<TABLE border='1' width="684">
		<TR>
			<TD colspan='2'>
				<TABLE width="500">
					<TR height='18'>
						<TD width="270">&nbsp;</TD>
						<TD width="150" align='left'><FONT size='+2'>購物清單</FONT></TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
		
		<form id='form1' method="GET" action="<c:url value='/iwow/cart/process' />">

			<font size='-1' face='標楷體, Arial'>
				<TABLE border='1'>
					<TR>
						<TH width="200">圖片</TH>
						<TH width="280">圖片名稱</TH>
						<TH width="70">圖片價格</TH>
						<TH width="110">修改</TH>
					</TR>
					<c:set var="totalAmount" value="0"/>
					<c:forEach var="list" items="${picMsg}">
						<TR height='16'>
							<TD align='center'><img height='120' width='120'
								src='${list.pictureAddress}' name="id" value="${list.id}"></TD>
							<TD>${list.name}</TD>
							<TD>$100</TD>
							<TD align='center'><a
								href="<c:url value="/iwow/cart/delpic?picId=${list.id}"/>"><Input
									type="button" name="delete" value="刪除"></a></TD>
							<c:set var="totalAmount" value="${totalAmount + 100}"/>
						</TR>
					</c:forEach>
	
					<TR height='16'>
						<TD colspan='2' align='right'>合計金額：</TD>
						<TD align='right'>${totalAmount}元</TD>
					</TR>
	
				</TABLE>
			</font>
	
			<div>
	
				<h3>
					補充說明:
					<textarea rows=5 name="DSC" cols=70></textarea>
				</h3>
	
			</div>
	
			<TABLE border='1' width="684">
				<TR>
					<TD width="260" align='center'>
						<a href="javascript:;" onclick="document.getElementById('form1').submit();">送出訂單</a>
					</TD>
					<TD width="260" align='center'><A
						href="<c:url value='/iwow/cart/giveup' />" onClick="return Abort();">放棄購物</A></TD>
				</TR>
			</TABLE>
		
		</form>
</body>
</html>