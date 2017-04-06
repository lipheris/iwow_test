<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>iwowwow</title>


<script  src="https://code.jquery.com/jquery-1.12.4.js"  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="  crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<style>

.imgbox{
	width:1000px;
	margin-left:auto;
	margin-right:auto;
	margin-top:50px;
}

img{
	width:30%;
	margin:5px;
	display:inline-block;
	vertical-align:top;
}

.imgBtn{ 
 	width:100%; 
} 

 .imgForm{
 	width:30%;
	margin:5px;
	display:inline-block;
	vertical-align:top;
}

.buttons{
	text-align:center;
	margin-top:30px;
	margin-bottom:80px;
}
</style>

</head>
<body >
	<!-- banner import -->
	<c:import url="banner.jsp" /> 
	
	
<div class="container">
	<div class="imgbox">
		<h1>waterflow</h1>
		
		
		<c:forEach var="list" items="${pictureList}">
						<tr>
							<td><a href="<c:url value="/iwow/picture/${list.id}"/>"><img src='${list.pictureAddress}' /></a></td>												
						</tr>
		</c:forEach>
		
		<form class="imgForm" action="/iwowwow/iwow/picture" method="get">			
			<input class="imgBtn" type="image" name="imgBtn" id="imgBtn" src="https://upload.wikimedia.org/wikipedia/commons/3/32/House_sparrow04.jpg" onClick="document.form1.submit()">
		</form>
		
		
		
	<c:forEach var="p" items="${picMsg}">
<%-- 	<c:url value='/iwow/picture/{p.id}' /> --%>
<!-- 				<form class="imgForm" action="/iwowwow/iwow/picture/{p.id}" method="get"> -->
				<form class="imgForm" action="<c:url value='/iwow/picture/${p.id}' />" method="post">
					<input class="imgBtn" type="image" name="imgBtn" id="imgBtn" src="${p.pictureAddress}" >
					<input type="hidden" name="jId" value="${p.id}" >
					<input type="hidden" name="data" value="${p.pictureAddress}" >	
					<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>	
				</form>			
		</c:forEach>
		
	</div>
</div>

<div class="buttons">
	<button class="btn btn-success" type="submit">LOGIN</button>
	<button class="btn btn-info" type="submit">See More</button>
</div>

</div>
</body>
</html>