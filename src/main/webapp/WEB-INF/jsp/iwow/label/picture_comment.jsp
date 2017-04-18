<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!--     Bootstrap Core CSS -->
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<style>
.message{
    display:inline-block;width:300px;position: absolute;top:410px;border-radius: 5px 5px 5px 5px; 
    left: 20px;height:400px;border:1px solid #ddd;overflow:scroll;
}
.remove_type{float:right;}
</style>
<div class="message">
	<div style="width: 90%; margin-left: 0px;margin-left:20px;display:inline-block;" class="row">
		<div class="input-group" style="margin-top:10px;">
			<input type="text" id="getContext" name="typein" class="form-control"  placeholder="Add a comment">
			<span class="input-group-btn">
				<button class="btn btn-default glyphicon glyphicon-comment"  onclick="toInsertDescription()"
					type="button"></button>
			</span>
		</div>
		<!-- /input-group -->
	</div>
	
	<!-- 	取出description -->
	<div class="display" style="margin-top:5px;">
	<c:if test='${not empty "${pictexts}"}'>
		<c:forEach var="px" items="${pictexts}">
		<div class="w3-container">
			<div style="margin-bottom:0px"><i class="glyphicon glyphicon-remove remove_type" id="${px.id}" onclick="remove_comment(this)"></i></div>
			<img class="w3-circle" style="float: left; margin: 3px; margin-top: 10px;" src="http://www.rd.com/wp-content/uploads/sites/2/2016/02/12-13-things-you-didnt-know-about-cats-no-chocolate.jpg">
			<h4 style="display: inline-block; margin-bottom: 0px;">${px.username}</h4>
			<p style="display: inline-block; margin-bottom: 0px; margin-left: 5px;">${px.noteUpdate}</p>
			<p>${px.note}</p>
			<p>${tx}</p>
<!-- 			<input type="hidden" > -->
		</div>
		</c:forEach>
	</c:if>
	<!-- /.row --> 
	</div>
</div>	

<script type="text/javascript">
function toInsertDescription(){
var txt = document.getElementById("getContext").value;
window.location.href="/iwowwow/iwow/insertDescription?getId=${picId}&typein="+txt;
}
function remove_comment(e){
	var commentId=e.id;
window.location.href="/iwowwow/iwow/admin/deleteComment?getId=${picId}&commentId="+commentId;
}
</script>
</html>
	



