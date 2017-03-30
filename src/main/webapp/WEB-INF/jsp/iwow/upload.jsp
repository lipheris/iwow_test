<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>upload</title>

<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- jQuery datepicker���n��CSS ��JS -->
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>

// jQuery datepicker
$( function() {
    $( "#datepicker" ).datepicker({ minDate: -0, maxDate: "+1Y" });
  } );
  
</script>

<style>
/* banner */
.banner_searchicon {
	margin-left: 100px;
	margin-top: 7px;
}

/* �W�ǭ��� */
.upload_all{
	width:1000px;
	margin:0 auto;
}

/* fieldset */
fieldset{
	font-size:25px;
	font-family:Microsoft JhengHei; /* �L�n������ */
}

legend{
	font-size:40px;
	font-family:Courier;
}

/* ����ɮ� */
.upload_file_btn{
	
}


</style>
</head>
<body>
<!-- banner -->
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="#">iwowwow</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav" style="font-size: 35px">
				<li class="active"><span class="glyphicon glyphicon-search searchicon" aria-hidden="true"></span></li>
			</ul>

			<form class="navbar-form navbar-left">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>

				<sec:authorize access="hasRole('ROLE_USER')">					
					<c:url value="/logout" var="logoutUrl" />
						<form action="${logoutUrl}" method="post" id="logoutForm" >						
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form>									
					<script>
   						function formSubmit() {  
   							document.getElementById("logoutForm").submit();  
     					}  
					</script>  
				</sec:authorize>
				<ul class="nav navbar-nav navbar-right" style="font-size: 15px">
					<li><a href="javascript:formSubmit()">Logout</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right" style="font-size: 20px">
					<li><a href="#"><span class="glyphicon glyphicon-envelope"></span></a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right" style="font-size: 20px">
					<li><a href="#"><span class="glyphicon glyphicon-cloud-upload"></span></a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li><a style="padding: 0px; padding-top: 10px; margin-right: 10px;" href="#"><img style="width: 32px; margin-right: 5px;" src="https://secure.gravatar.com/avatar/afb1c54ac11486de1a71f6e0cd3ccc16?s=100&r=g&d=https://pacdn.500px.org/userpic.png">Tom</a></li>
				</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>
	
	<!-- �W�ǭ��� -->
	<div class="upload_all">
	
	<fieldset>
				<legend>Upload</legend>
	
	<form action="#" method="post" enctype="multipart/form-data">
	
	<!-- ����ɮ� -->
	<div>	
		<input class="upload_file_btn" type="file" name="picture" id="picture" accept="image/*">
	</div>
	
	<!-- �D�ءB������ -->
	<div>
		<label for="title">���D�G</label>
		<input type="text" id="title" name="title" value=" ">
	</div>
	
	<div>
		<label for="description">�y�z�G</label>
		<input type="text" id="description" name="description" value=" ">
	</div>
	
	<!-- TAG -->
	<div>
		<label for="tag">Tag�G</label>
		<input type="text" id="tag" name="tag" value=" ">
	</div>
	<div>
		<input type="checkbox" name="keytag" value="keytag" id="keytag"><label for="keytag">��wTAG�T���L�Τ�s��</label>
	</div>
	
	<!-- �s������ -->
	<div>
		<label>�s������G</label>
		<input type="radio" name="restriction" value="all" id="all"><label for="all">���~��</label>
		<input type="radio" name="restriction" value="r18" id="r18"><label for="r18">18�T</label>
	</div>
	
	<!-- ���p -->
	<div>
		<label>���p�G</label>
		<input type="radio" name="privacy" value="public" id="public"><label for="public">�Ҧ��H</label>
		<input type="radio" name="privacy" value="friends" id="friends"><label for="friends">�B��</label>
		<input type="radio" name="privacy" value="private" id="private"><label for="private">�p�H</label>
	</div>
	
	<!-- �w���Ƶ{��Z -->
	<div>
		<label>�w����Z�G</label>
		<div>
		<input type="checkbox" name="reservation" value="reservation" id="reservation">
		<input type="text" id="datepicker">
		</div>
	</div>
	
	<!-- �B���L -->
	<div>
		<label for="watermarks">�B���L</label>
		<div>
		<input type="checkbox" name="watermarks" value="watermarks" id="watermarks">
		<input type="text" id="watermarks" name="watermarks" placeholder="sample">
		</div>
	</div>
	
	<!-- QR Code -->
	<div>
		<label for="watermarks">QR Code</label>
		<div>
		<input type="checkbox" name="qr" value="qr" id="qr">
		</div>
	</div>
	
	<!-- �O�_�c�� -->
	
	<div>
		<label>�O�_�c��</label>
		<input type="radio" name="sale" value="yes" id="yes"><label for="yes">�O</label>
		<input type="radio" name="sale" value="no" id="no"><label for="no">�_</label>
	</div>
	
	<!-- �e�X/�M�� -->
	<div>
		<input type="submit" value="PUBLISH">
		<input type="reset" value="CLEAN">
	</div>
	
	</fieldset>
	
	</form>
	
	</div>
</body>
</html>