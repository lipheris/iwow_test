<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>   

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
.profile_all{
	margin-top:40px;
	margin-left:20px;
	font-family:Microsoft JhengHei;
	text-align:left;
}
/* 間距 */
.profile_spac{
	margin-bottom:10px;
}
</style>

	<!-- profile -->
	<div class="profile_all">
	
	<fieldset>
			<legend>修改個人資料</legend>
	
<!-- 	<form action="/iwowwow/iwow/member/update" method="post"> -->
	
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
