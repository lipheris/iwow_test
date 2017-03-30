<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>report</title>

<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<style>
/* banner */
.banner_searchicon {
	margin-left: 100px;
	margin-top: 7px;
}

/* ���|���� */
.report_all{
	width:1000px;
	margin:0 auto;
}

/* ����Q���|���� */
.report_img{
	float:left;
	margin-top:50px;
	margin-right:40px;
}

/* �k���� */
/* fieldset */
fieldset{
	font-size:25px;
	font-family:Microsoft JhengHei; /* �L�n������ */
}

legend{
	font-size:40px;
	font-family:Courier;
}

/* ���Z */
.report_spac{
	margin:5px;
	margin-bottom:10px;
}

/* ����textarea���j�p�l�ϥΪ̵L�k�ۥ��Y�� */
textarea{
	resize: none;
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
	
	<!-- ���| -->
	<div class="report_all">
	
	<!-- �Q���|���� -->
	<div class="report_all_left">
	<img class="report_img" src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRpLzfMG2-bYjQhJ-Yz6KNBKE3H0NkYnWGJOJF3cE1Z0nzFKTP6">		
	</div>
	
	<div class="report_all_right">
	<fieldset>
				<legend>Report</legend>
	
	<form action="#" method="post" enctype="multipart/form-data">
		
	<!-- ���|��] -->
	<div class="report_spac">
		<label>���|��]�G</label>
	<div class="report_spac">	
		<input type="radio" name="reason" value="r18" id="r18"><label for="r18">�Q�K�T�o������</label>
	</div>
	<div class="report_spac">	
		<input type="radio" name="reason" value="portrait" id="portrait"><label for="portrait">�H�Ϩv���v</label>
	</div>
	<div class="report_spac">	
		<input type="radio" name="reason" value="copyright" id="copyright"><label for="copyright">�H�ϵۧ@�v�k</label>
	</div>
	</div>
	
	<!-- ��L��] -->
	<div class="report_spac">
		<label for="other">��L�G</label>
	</div>
	<div class="report_spac">
		<textarea  rows="6" cols="50" id="other" name="other" placeholder="�п�J���|��]"></textarea>
	</div>
	
	<!-- �e�X/�M�� -->
	<div class="report_spac">
		<input type="submit" value="�e�X">
	</div>
	
	</fieldset>
	
	</form>
	</div>
	
	</div>
</body>
</html>