<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FaGao Add</title>

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

</style>

</head>
<body>
<div class="container">
<!-- <div class="jumbotron"> -->
<!--   <h1>Hello, world!</h1> -->
<!--   <p>...</p> -->
<!--   <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p> -->
<!-- </div> -->

<h1>Add New Book</h1>
	<form action="/pixiv/fagao/book/insert" method="get">
	
	<div class="form-group">
    <label for="name">Name</label>
    <input class="form-control" type="text" name="name" id="name" maxlength="100" placeholder="please input name"/>
  	</div>
  	
  	<div class="form-group">
    <label for="name">Author</label>
    <input class="form-control" type="text" name="author" id="author" maxlength="100" placeholder="please input author"/>
  	</div>
  	
  	<div class="form-group">
    <label for="name">Price</label>
    <input class="form-control" type="text" name="price" id="price" maxlength="100" placeholder="please input price"/>
  	</div>
		<input class="btn btn-success" type="submit" value="Add"/>
	</form>
	
	<form action="/pixiv/fagao/book/list" method="get">			
		<input class="btn btn-primary" type="submit" value="Backtolist">
	</form>
</div>
</body>
</html>