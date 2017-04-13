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
	<form accept-charset="UTF-8" action="<c:url value="/iwow/group/create"/>" method="get">
		<div>
			<label for="groupName"> 社團名稱 </label>
			<div>
				<input id="groupName" name="name" placeholder="請輸入groupName" type="text" />
				<input type="submit" value="Send">
			</div>		
		</div>
	</form>
	
	<form class="navbar-form navbar-left" id="searchForm" action='<c:url value="/iwow/group/search" />' method="get">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search" id="searchCtx" name="ctx"/>
							<button type="button" class="btn btn-default glyphicon glyphicon-search" id="searchBtn"></button>
						</div>
				</form>
</aside>

<script>
$(function() {
	$("#searchBtn").click(doSearch);
})
function doSearch(ctx) {
	var ctx = document.getElementById("searchCtx").value;
	if (ctx != "") {
		document.getElementById("searchForm").submit();
	}
}

$(function() {
	$.getJSON("/iwowwow/iwow/pictures/" + pic_id, function (picture){
		this_picture = picture;
		if(this_picture != null){
			show_picture_article(this_picture);
			if (this_picture.stats != null) {
				insert_stats(this_picture.stats);
			}
			if( this_picture.tags != null ){
				insert_tags(this_picture.tags);
			}
		}
	});
</script>
</body>
</html>