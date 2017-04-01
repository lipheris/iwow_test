<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>upload</title>

<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- jQuery datepicker必要的CSS 及JS -->
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>

// jQuery datepicker
$( function() {
    $( "#datepicker" ).datepicker({ minDate: -0, maxDate: "+1Y" });
  } );
  
</script>

<style>

/* 上傳頁面 */
.upload_all{
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
.upload_spac{
	margin:5px;
	margin-bottom:10px;
}


</style>
</head>
<body onload='document.logoutForm.username.focus();'>
<!-- banner import -->
	<c:import url="banner.jsp" /> 
	
	
	<!-- 上傳頁面 -->
	<div class="upload_all">
	
	<fieldset>
				<legend>Upload</legend>
	
	<form action="#" method="post" enctype="multipart/form-data">
	
	<!-- 選擇檔案 -->
	<div class="upload_spac">	
		<input class="upload_file_btn" type="file" name="picture" id="picture" accept="image/*">
	</div>
	
	<!-- 題目、說明文 -->
	<div class="upload_spac">
		<label for="title">標題：</label>
		<input type="text" id="title" name="title" value=" ">
	</div>
	
	<div class="upload_spac">
		<label for="description">描述：</label>
		<input type="text" id="description" name="description" value=" ">
	</div>
	
	<!-- TAG -->
	<div class="upload_spac">
		<label for="tag">Tag：</label>
		<input type="text" id="tag" name="tag" value=" ">
	</div>
	<div class="upload_spac">
		<input type="checkbox" name="keytag" value="keytag" id="keytag"><label for="keytag">鎖定TAG禁止其他用戶編輯</label>
	</div>
	
	<!-- 瀏覽限制 -->
	<div class="upload_spac">
		<label>瀏覽限制：</label>
		<input type="radio" name="restriction" value="all" id="all"><label for="all">全年齡</label>
		<input type="radio" name="restriction" value="r18" id="r18"><label for="r18">18禁</label>
	</div>
	
	<!-- 隱私 -->
	<div class="upload_spac">
		<label>隱私：</label>
		<input type="radio" name="privacy" value="public" id="public"><label for="public">所有人</label>
		<input type="radio" name="privacy" value="friends" id="friends"><label for="friends">朋友</label>
		<input type="radio" name="privacy" value="private" id="private"><label for="private">私人</label>
	</div>
	
	<!-- 預約排程投稿 -->
	<div class="upload_spac">
		<label>預約投稿：</label>
		<div>
		<input type="checkbox" name="reservation" value="reservation" id="reservation">
		<input type="text" id="datepicker">
		</div>
	</div>
	
	<!-- 浮水印 -->
	<div class="upload_spac">
		<label for="watermarks">浮水印</label>
		<div>
		<input type="checkbox" name="watermarks" value="watermarks" id="watermarks">
		<input type="text" id="watermarks" name="watermarks" placeholder="sample">
		</div>
	</div>
	
	<!-- QR Code -->
	<div class="upload_spac">
		<label for="watermarks">QR Code</label>
		<div>
		<input type="checkbox" name="qr" value="qr" id="qr">
		</div>
	</div>
	
	<!-- 是否販售 -->
	
	<div class="upload_spac">
		<label>是否販售</label>
		<input type="radio" name="sale" value="yes" id="yes"><label for="yes">是</label>
		<input type="radio" name="sale" value="no" id="no"><label for="no">否</label>
	</div>
	
	<!-- 送出/清除 -->
	<div class="upload_spac">
		<input type="submit" value="PUBLISH">
		<input type="reset" value="CLEAN">
	</div>
	
	</fieldset>
	
	</form>
	
	</div>
</body>
</html>