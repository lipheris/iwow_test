<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test</title>

<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<script>

$(function() {
		//ajax抓圖
		$.ajax({
			type:'GET',
			url:'/iwowwow/iwow/listajax',
			dataType:'json'
		}).done(function(datas){

			//datas就是一個JSON物件
			var myDiv = $('#show');
			//為解決這個問題，可以創建一個文檔碎片，把所有的新節點附加其上，
			//然後把文檔碎片的内容一次性添加到document中，這個就是createDocumentFragment()的用武之處。
			var docFragment = $(document.createDocumentFragment()); //javascript
			$.each(datas,function(idx,photo){
// 				var img = $('<img />').attr('src',park.Image).addClass('img-thumbnail thumb');
// 				var a = $('<a></a>').attr('href',park.Image).html(img); //點下去可連結到大圖
				var p="<div class=\"main_picture\"><img src='data:image/jpg;base64,"+ photo +"' /><div>";
	
				docFragment.append(p);
			})
			myDiv.append(docFragment);
		})

		//ajax抓圖detail
		$.ajax({
			type:'GET',
			url:'/iwowwow/iwow/pictures',
			dataType:'json'
		}).done(function(datas){
			//		console.log(datas[0].name);
			//datas就是一個JSON物件
			var myDiv = $('#name');
			//為解決這個問題，可以創建一個文檔碎片，把所有的新節點附加其上，
			//然後把文檔碎片的内容一次性添加到document中，這個就是createDocumentFragment()的用武之處。
			var docFragment = $(document.createDocumentFragment()); //javascript
			$.each(datas,function(idx,picture){
		//			console.log(picture.name);
		//			console.log(picture.uploaderId);
		//			var img = $('<img />').attr('src',park.Image).addClass('img-thumbnail thumb');
		//			var a = $('<a></a>').attr('href',park.Image).html(img); //點下去可連結到大圖
				var h = picture.name + ", " + picture.uploaderId;
				
		//		console.log(h);			
		 		docFragment.append(h);
			})
		 	myDiv.append(docFragment);
		})

 });

</script>

<style>


.main_picture{ 
 	margin: 0 auto; 
 	margin: 20px; 
 	text-align: center; 
 	width:70%; 
 } 
 

</style>

</head>
<body>

    <div id="show"></div>
    <div id="name"></div>

</body>
</html>