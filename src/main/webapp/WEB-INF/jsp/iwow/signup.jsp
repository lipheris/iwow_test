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
 
<!-- sweetalert -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
 <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>

<script>
$(function(){
	//檢查密碼
 	document.getElementById("password").onblur = chkPwd;
	
	//AJAX驗證帳號        
	$('#email').blur(function(){
	    var emailVal = $('#email').val();
	    
	    $.get('${pageContext.servletContext.contextPath}/iwow/member/checkUserEmail', {"email":emailVal},
	    	function(data){
	    		$('#message').html(data);
	    			if(data == "帳號已存在"){
 	    				//alert("帳號已存在");
	    				$('#errormail').addClass('glyphicon glyphicon-remove-sign');
	    				$('#correctmail').removeClass();
	    				document.getElementById("errormail").innerHTML = "";
	    			} else if (data == "帳號不存在") { //帳號不存在
 	    				//alert("帳號不存在");
	    				$('#errormail').removeClass();
	    				$('#correctmail').addClass('glyphicon glyphicon-ok-sign');
	    				document.getElementById("errormail").innerHTML = "";
	    			} else {
	    				//使用者沒輸入信箱，信箱不可為空白
	    				$('#errormail').removeClass();
	    				$('#correctmail').removeClass();
	    				document.getElementById("errormail").innerHTML = "信箱不可為空白";
	    			}
	    		}
	    	);	    		
	   })
});

//檢查密碼  1.不可空白
	function chkPwd() {
		var thePwd = document.getElementById("password").value;
		var thePwdLen = thePwd.length;
		
		if (thePwdLen == "") {
	        document.getElementById("errorpwd").innerHTML = "密碼不可為空白";
	    } else {
	    	document.getElementById("errorpwd").innerHTML = "";
	    }
	}
		
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
fieldset, .btnsubmit{
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
<body>
<!-- banner import -->
<%-- 	<c:import url="banner.jsp" />  --%>
	
	
	<!-- sign up -->
	<div class="signup_all">
	
	<fieldset>
			<legend>Sign Up</legend>
	
	<form action="/iwowwow/iwow/member/insert" method="post">
		
	<!-- 信箱、密碼、姓名、暱稱 -->	
	<div class="signup_spac">
		<label for="email">信箱：</label>
		<input type="text" id="email" name="email" placeholder="請輸入信箱" value=${param.email}>
 		<span id ="errormail" style="color:red"></span>
        <span id="correctmail" style="color:green"></span>
	</div>
	
	<div class="signup_spac">
		<label for="password">密碼：</label>
		<input type="password" id="password" name="password" placeholder="請輸入密碼">
		<span id ="errorpwd" style="color:red"></span>
	</div>
	
	<div class="signup_spac">
		<label for="name">姓名：</label>
		<input type="text" id="name" name="name" value="${param.name}">
	</div>
	
	<div class="signup_spac">
		<label for="nickname">暱稱：</label>
		<input type="text" id="nickname" name="nickname" value="${param.nickname}">
	</div>	
	
	<!-- 性別 -->
	<div class="signup_spac">
		<label>性別：</label>
		<input type="radio" name="gender" value="MAN" id="MAN"><label for="all">男</label>
		<input type="radio" name="gender" value="WOMAN" id="WOMAN"><label for="r18">女</label>
	</div>	
	
	<!-- 生日 -->
	<div class="signup_spac">
		<label>生日：</label>
		<div>
		<input type="text" id="datepicker" name="birth" value="">
		</div>
	</div>	
	
	<!-- 電話、住址  -->
	<div class="signup_spac">
		<label for="phone">連絡電話：</label>
		<input type="text" id="phone" name="phone" value="${param.phone}">
	</div>	
	
	<div class="signup_spac">
		<label for="address">住址：</label>
		<input type="text" id="address" name="address" value="${param.address}">
	</div>	
		
	<!-- 送出/清除 -->
	<div class="signup_spac">
		<input type="submit" class="btn btn-success btnsubmit" value="送出">
	</div>
	
	</fieldset>
	
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
	</form>
	
	</div>	
	
	<script>
	$(function(){
		 if("${errorMsg.error}" != ""){
			 swal({ 
				  title: "註冊失敗！", 
				  text: "請再檢查是否有資料輸入錯誤", 
				  type: "error"
				});
		 }
	});
	</script>
	
</body>
</html>