<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FaGao Edit</title>

<script  src="https://code.jquery.com/jquery-1.12.4.js"  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="  crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<style type="text/css">
.container{
	width: 500px;
	float: left;
	margin-left: 50px;
}

form {
	margin-bottom: 10px;
}

.bookid{
	font-weight: bold;
	font-size: 16px;
	padding-top: 10px;
}
</style>

</head>
<body>
<div class="container">

<h1>Edit Book</h1>

	<form action="/pixiv/fagao/book/update" method="get">
	
		<p class="bookid">Book ID：${editBook.id}</p><input type="hidden" name="id" value="${editBook.id}" />
		
		<div class="form-group">
	    <label for="name">Name</label>
	    <input class="form-control" type="text" name="name" id="name" maxlength="100" value="${editBook.name}" />
	  	</div>
		
		<div class="form-group">
	    <label for="name">Author</label>
	    <input class="form-control" type="text" name="author" id="author" maxlength="100" value="${editBook.author}" />
	  	</div>
		
		<div class="form-group">
	    <label for="name">Price</label>
	    <input class="form-control" type="text" name="price" id="price" maxlength="100" value="${editBook.price}" />
	  	</div>
		
		<input class="btn btn-success" type="submit" value="Edit" />
	</form>


	<form action="/pixiv/fagao/book/list" method="get">			
		<input class="btn btn-primary" type="submit" value="Backtolist">
	</form>
</div>
</body>
</html>