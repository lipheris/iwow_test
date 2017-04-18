<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><sec:authentication property="principal.username" />
	List</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"
	integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<style>

aside {
	margin-top:100px;
	margin-left: 50px;
	width: 15%;
	float: left;
	/*  background-color:pink;  */
}

</style>
</head>
<body>
	<c:import url="../label/banner.jsp" />
<aside>
	<form accept-charset="UTF-8" action="<c:url value="/iwow/group/create"/>?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		<div>
			<label for="groupName"> 社團名稱 </label>
			<div>
				<input id="groupName" name="name" placeholder="請輸入groupName" type="text" />
				<input class="upload_file_btn" type="file" name="photo" id="photo"
						accept="image/*">
				<input type="submit" value="Send">
			</div>		
		</div>
	</form>
	
<%-- 	<form class="navbar-form navbar-left" id="searchForm" action='<c:url value="/iwow/group" />' method="get"> --%>
				<div class="form-group" id="search">
					<button type="button" class="btn btn-default glyphicon glyphicon-search" id="searchBtn"></button>
				</div>				
				
				<div id="group_info">
					<h1 id="group_name"></h1>
					<h1 id="group_create_name"></h1>
					<img id="group_img">
				</div>
				
			
<!-- </form> -->
</aside>

<script>
var group_info_div = $("div[id='group_info']");

$(function() {
	$("div[id='search']").click(function(){
		$.getJSON("/iwowwow/iwow/group",function (groups){
			console.log(groups);
			group_info_div.empty();
			$.each(groups,function(idx,group){	
				console.log(show_group(group))								
				
// 				$("<button></button>")
// 				.text(group.name)
// 				.click(function() {
// 				location.href = "/iwowwow/iwow/group/update?name=" + group.name;								
// 			})					
// 				.appendTo(group_info_div);

// 				$("<img>")
// 				.attr("src", group.photoAd)
// 				.appendTo(group_info_div);
// 				$("<p></p>")
// 				.text(group.members[0].name)
// 				.appendTo(group_info_div);
				
				
// 				$("</br>")
// 				.appendTo(group_info_div);								
			})											
		});		
	});
});

function show_group(group) {
	$("#group_info > #group_name").text(group.name);
// 	$("#group_info > #group_create_name").text(group.memid);
// 	$("img[id='group_img']").attr("src", group.photoAd);
}
	

</script>
</body>
</html>