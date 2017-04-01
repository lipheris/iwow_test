<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sign up</title>

<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- jQuery datepicker必要的CSS 及JS -->
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>

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

/* 註冊頁面 */
.signup_all{
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
.signup_spac{
	margin:5px;
	margin-bottom:10px;
}
</style>
</head>
<body onload='document.logoutForm.username.focus();'>
<!-- banner import -->
	<c:import url="banner.jsp" /> 
	
	
	<!-- sign up -->
	<div class="signup_all">
	
	<fieldset>
			<legend>Sign Up</legend>
	
	<form action="/iwowwow/iwow/member/insert" method="post">
		
	<!-- 信箱、密碼、姓名、暱稱 -->	
	<div class="signup_spac">
		<label for="email">信箱：</label>
		<input type="text" id="email" name="email" value="">
	</div>
	
	<div class="signup_spac">
		<label for="password">密碼：</label>
		<input type="password" id="password" name="password" value="">
	</div>
	
	<div class="signup_spac">
		<label for="name">姓名：</label>
		<input type="text" id="name" name="name" value="">
	</div>
	
	<div class="signup_spac">
		<label for="nickname">暱稱：</label>
		<input type="text" id="nickname" name="nickname" value="">
	</div>	
	
	<!-- 性別 -->
	<div class="signup_spac">
		<label>性別：</label>
		<input type="radio" name="gender" value="male" id="male"><label for="all">男</label>
		<input type="radio" name="gender" value="female" id="female"><label for="r18">女</label>
	</div>	
	
	<!-- 生日 -->
	<div class="signup_spac">
		<label>生日：</label>
		<div>
		<input type="text" id="datepicker">
		</div>
	</div>	
	
	<!-- 電話、住址  -->
	<div class="signup_spac">
		<label for="phone">連絡電話：</label>
		<input type="text" id="phone" name="phone" value="">
	</div>	
	
	<div class="signup_spac">
		<label for="address">住址：</label>
		<input type="text" id="address" name="address" value="">
	</div>	
		
	<!-- 送出/清除 -->
	<div class="signup_spac">
		<input type="submit" value="送出">
	</div>
	
	</fieldset>
	
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
	</form>
	
	</div>	
	
</body>
</html>