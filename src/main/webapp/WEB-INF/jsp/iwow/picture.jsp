<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>picture</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="  crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<style>

img{
	width:30%;
}

aside{
	margin-left:50px;
	width:15%;
	float:left;
/*  background-color:pink;  */
}

article{
	margin-left:25%;
	width:70%;
}

.userPro, .shopPro{
	margin-left:auto;
	margin-right:auto;
	text-align:center;
}

.icons, .bottons{
	text-align:right;
	margin-top:30px;
}

.icon{
	font-size:20px;
	margin-right:10px;
}

.mainPicture{
	margin-left:auto;
	margin-right:auto;
	margin:20px;
	text-align:center;
}

.btn-sm{
	border-radius:10px;
	margin-left:15px;
	margin-top:10px;
	margin-bottom:10px;
}

.related{
	margin:5px;
	vertical-align:top;
}

.relatedBtn{
	margin-top:30px;
	margin-bottom:80px;
	text-align:center;
}

</style>
</head>
<body onload='document.logoutForm.username.focus();'>
<!-- banner import -->
	<c:import url="banner.jsp" /> 


<!-- aside -->
<aside>
	<div class="userPro" style="margin-bottom:30px;">
	<img src="https://secure.gravatar.com/avatar/afb1c54ac11486de1a71f6e0cd3ccc16?s=100&r=g&d=https://pacdn.500px.org/userpic.png">
	<h4 style="margin:5px;">Tom</h4>
	<button class="btn btn-info" type="submit">Follow</button>
	</div>
	
	<div class="shopPro" style="margin-bottom:30px;">
	<h3 style="margin-bottom:0px;">Shopping</h3>
	<h4 style="display:inline-block;">7.00$</h4>
	<span style="display:inline-block;margin-left:7px;" class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
	</div>
	
		<div style="width:100%; margin-left:0px;" class="row">
		    <div class="input-group">
		      <input type="text" class="form-control" placeholder="Add a comment">
		      <span class="input-group-btn">
		        <button class="btn btn-default glyphicon glyphicon-comment" type="button"></button>
		      </span>
		    </div><!-- /input-group -->
		</div><!-- /.row -->
		
		
		<img style="float:left; margin:3px; margin-top:10px;" src="http://www.rd.com/wp-content/uploads/sites/2/2016/02/12-13-things-you-didnt-know-about-cats-no-chocolate.jpg">
		<h4 style="display:inline-block;margin-bottom:0px;">cat01</h4>
		<p style="display:inline-block;margin-bottom:0px;margin-left:10px;">Aprl 14</p>
		<p>How delicious it look!</p>	
		
		<img style="float:left; margin:3px; margin-top:10px;" src="http://www.rd.com/wp-content/uploads/sites/2/2016/02/12-13-things-you-didnt-know-about-cats-no-chocolate.jpg">
		<h4 style="display:inline-block;margin-bottom:0px;">cat01</h4>
		<p style="display:inline-block;margin-bottom:0px;margin-left:10px;">Aprl 05</p>
		<p>yummy</p>	
		
		<img style="float:left; margin:3px; margin-top:10px;" src="http://www.rd.com/wp-content/uploads/sites/2/2016/02/12-13-things-you-didnt-know-about-cats-no-chocolate.jpg">
		<h4 style="display:inline-block;margin-bottom:0px;">cat01</h4>
		<p style="display:inline-block;margin-bottom:0px;margin-left:10px;">Mar 28</p>
		<p>So Cute</p>	
		
		<img style="float:left; margin:3px; margin-top:10px;" src="http://www.rd.com/wp-content/uploads/sites/2/2016/02/12-13-things-you-didnt-know-about-cats-no-chocolate.jpg">
		<h4 style="display:inline-block;margin-bottom:0px;">cat01</h4>
		<p style="display:inline-block;margin-bottom:0px;margin-left:10px;">Mar 05</p>
		<p>WOW</p>	
		
					
</aside>

<article>
	<div>
	<h1>Bird</h1>
<!-- 	取圖片id對應description -->
<%-- 	<c:set var="key" name="key" value="${param.jId}" ></c:set>   --%>
<%--         <h1><c:out value="${picMsg[key]}" /></h1> --%>
	<h1><c:out value="${picMsgs}" /></h1>

	</div>
	
	<div class="icons">
	<span class="glyphicon glyphicon-eye-open icon" aria-hidden="true">4315</span>
	<span class="glyphicon glyphicon-star-empty icon" aria-hidden="true">92</span>
	<span class="glyphicon glyphicon-heart-empty icon" aria-hidden="true">13</span>
	<span class="glyphicon glyphicon-shopping-cart icon" aria-hidden="true">2</span>
	</div>
	
	<div class="mainPicture">
	<img style="width:70%;height:70%;" src="${param.data}">
	</div>
	
	<div class="bottons">
	<button class="btn btn-primary" type="submit">FB</button>
	<button class="btn btn-success" type="submit">DONATE</button>
	</div>
	
	<div>
	<form action="/iwowwow/iwow/selectTags" method="get">
	<button class="btn btn-default btn-sm" type="submit" name="tagmark" value="bird">bird</button>
	<button class="btn btn-default btn-sm" type="submit" name="tagmark" value="cute">cute</button>
	<button class="btn btn-default btn-sm" type="submit" name="tagmark" value="wild">wild</button>
	<button class="btn btn-default btn-sm" type="submit" name="tagmark" value="animal">animal</button>
	<button class="btn btn-default btn-sm" type="submit" name="tagmark" value="fly">fly</button>
	<button class="btn btn-default btn-sm" type="submit" name="tagmark" value="lovely">lovely</button>
	</form>
	</div>
	
	<div style="margin:10px;">
	<img class="related" src="http://d2fbmjy3x0sdua.cloudfront.net/sites/default/files/styles/engagement_card/public/sfw_apa_2013_28342_232388_briankushner_blue_jay_kk_high.jpg?itok=ttMfUhUu">
	<img class="related" src="http://s7d2.scene7.com/is/image/PetSmart/ARFEAT-CaringForYourBird-20160818?$CL0601$">
	<img class="related" src="https://s-media-cache-ak0.pinimg.com/originals/28/ca/6d/28ca6dc83ab41cfb2f90c867ebb31383.jpg">
	</div>
	
	<div class="relatedBtn">
	<button class="btn btn-success" type="submit">See Related</button>
	</div>
</article>

</body>
</html>