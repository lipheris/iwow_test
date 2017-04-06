<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>setting profile</title>

<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- jQuery datepicker必要的CSS 及JS -->
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>

// swal('Hello world!');

//jQuery datepicker
$( function() {
    $( "#datepicker" ).datepicker({
      yearRange:"-100:+0",
   	  maxDate:new Date() ,
      changeMonth: true,
      changeYear: true
    });
  } );
</script>

<style>

/* 修改個人資料頁面 */
.profile_all{
	width:1000px;
	margin:0 auto;
}

/* fieldset */
fieldset{
	font-size:25px;
	font-family:Microsoft JhengHei; /* 微軟正黑體 */
}

legend{
	font-size:40px;
	font-family:Courier;
}

/* 間距 */
.profile_spac{
	margin:5px;
	margin-bottom:10px;
}
</style>
</head>
<body onload='document.logoutForm.username.focus();'>
<!-- banner import -->
	<c:import url="banner.jsp" /> 
	
	
	<!-- profile -->
	<div class="profile_all">
	
	<fieldset>
			<legend>修改個人資料</legend>
	
	<form action="/iwowwow/iwow/member/update" method="post">
	
	<!-- ID -->
	<input type="hidden" name="id" value="${editMember.id}" />	
			
	<!-- 姓名、暱稱 -->	
	
	<div class="profile_spac">
		<label for="name">姓名：</label>
		<input type="text" id="name" name="name" value="${editMember.name}" />
	</div>
	
	<div class="profile_spac">
		<label for="nickname">暱稱：</label>
		<input type="text" id="nickname" name="nickname" value="${editMember.nickname}">
	</div>	
	
	<!-- 性別 -->
	<div class="profile_spac">
		<label>性別：</label>
		<input type="radio" name="gender" value="MAN" id="MAN" checked="true"><label for="all">男</label>
		<input type="radio" name="gender" value="WOMAN" id="WOMAN"><label for="r18">女</label>
	</div>	
	
	<!-- 生日 -->
	<div class="profile_spac">
		<label>生日：</label>
		<div>
		<input type="text" id="datepicker" >
		</div>
	</div>	
	
	<!-- 電話、住址  -->
	<div class="profile_spac">
		<label for="phone">連絡電話：</label>
		<input type="text" id="phone" name="phone" value="${editMember.phone}">
	</div>	
	
	<div class="profile_spac">
		<label for="address">住址：</label>
		<input type="text" id="address" name="address" value="${editMember.address}">
	</div>	



	<!-- 送出/清除 -->
	<div class="profile_spac">
		<input type="submit" value="送出">
	</div>
	
	</fieldset>
	
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
	</form>
	
	</div>	
	
</body>
</html>