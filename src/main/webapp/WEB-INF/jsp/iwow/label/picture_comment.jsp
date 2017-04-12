<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<script type="text/javascript">
function toInsertDescription(){
var txt = document.getElementById("getContext").value;
alert(txt);
window.location.href="/iwowwow/iwow/insertDescription?getId=${picId}&typein="+txt;
}
</script>
<style>

</style>

	<div style="width: 100%; margin-left: 0px;" class="row">
		<div class="input-group">
			<input type="text" id="getContext" name="typein" class="form-control" placeholder="Add a comment">
			<span class="input-group-btn">
				<button class="btn btn-default glyphicon glyphicon-comment" onclick="toInsertDescription()"
					type="button"></button>
			</span>
		</div>
		<!-- /input-group -->
	</div>
	
	<!-- 	取出description -->
	<c:if test='${not empty "${pictexts}"}'>
		<c:forEach var="px" items="${pictexts}">
		<img style="float: left; margin: 3px; margin-top: 10px;" src="http://www.rd.com/wp-content/uploads/sites/2/2016/02/12-13-things-you-didnt-know-about-cats-no-chocolate.jpg">
		<h4 style="display: inline-block; margin-bottom: 0px;">${px.memId}</h4>
		<p style="display: inline-block; margin-bottom: 0px; margin-left: 10px;">Aprl 14</p>
		<p>${px.note}</p>
		</c:forEach>
	</c:if>
	
	<!-- /.row --> <img style="float: left; margin: 3px; margin-top: 10px;"
		src="http://www.rd.com/wp-content/uploads/sites/2/2016/02/12-13-things-you-didnt-know-about-cats-no-chocolate.jpg">
	<h4 style="display: inline-block; margin-bottom: 0px;">cat01</h4>
	<p
		style="display: inline-block; margin-bottom: 0px; margin-left: 10px;">Aprl
		14</p>
	<p>How delicious it look!</p>

	<img style="float: left; margin: 3px; margin-top: 10px;"
		src="http://www.rd.com/wp-content/uploads/sites/2/2016/02/12-13-things-you-didnt-know-about-cats-no-chocolate.jpg">
	<h4 style="display: inline-block; margin-bottom: 0px;">cat01</h4>
	<p
		style="display: inline-block; margin-bottom: 0px; margin-left: 10px;">Aprl
		05</p>
	<p>yummy</p>

	<img style="float: left; margin: 3px; margin-top: 10px;"
		src="http://www.rd.com/wp-content/uploads/sites/2/2016/02/12-13-things-you-didnt-know-about-cats-no-chocolate.jpg">
	<h4 style="display: inline-block; margin-bottom: 0px;">cat01</h4>
	<p
		style="display: inline-block; margin-bottom: 0px; margin-left: 10px;">Mar
		28</p>
	<p>So Cute</p>

	<img style="float: left; margin: 3px; margin-top: 10px;"
		src="http://www.rd.com/wp-content/uploads/sites/2/2016/02/12-13-things-you-didnt-know-about-cats-no-chocolate.jpg">
	<h4 style="display: inline-block; margin-bottom: 0px;">cat01</h4>
	<p
		style="display: inline-block; margin-bottom: 0px; margin-left: 10px;">Mar
		05</p>
	<p>WOW</p>

