<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>photo</title>

<script  src="https://code.jquery.com/jquery-1.12.4.js"  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="  crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<style type="text/css">
.searchicon{
	margin-left:100px;
	margin-top:7px;
}

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

.mainPhoto{
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
      <ul class="nav navbar-nav" style="font-size:35px">     
      <li class="active"><span class="glyphicon glyphicon-search searchicon" aria-hidden="true"></span></li>           
      </ul>
      
      <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">Log in</a></li>
      </ul> 
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">Sign Up</a></li>
      </ul>       
    </div><!-- /.navbar-collapse -->
    
  </div><!-- /.container-fluid -->
</nav>

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
	<h2>small bird withpale belly and breast and patterned wing and head stands on concrete</h2>
	</div>
	
	<div class="icons">
	<span class="glyphicon glyphicon-eye-open icon" aria-hidden="true">4315</span>
	<span class="glyphicon glyphicon-star-empty icon" aria-hidden="true">92</span>
	<span class="glyphicon glyphicon-heart-empty icon" aria-hidden="true">13</span>
	<span class="glyphicon glyphicon-shopping-cart icon" aria-hidden="true">2</span>
	</div>
	
	<div class="mainPhoto">
	<img style="width:70%;height:70%;" src="https://upload.wikimedia.org/wikipedia/commons/3/32/House_sparrow04.jpg">
	</div>
	
	<div class="bottons">
	<button class="btn btn-primary" type="submit">FB</button>
	<button class="btn btn-success" type="submit">DONATE</button>
	</div>
	
	<div>
	<button class="btn btn-default btn-sm" type=submit">bird</button>
	<button class="btn btn-default btn-sm" type="submit">cute</button>
	<button class="btn btn-default btn-sm" submit">wild</button>
	<button class="btn btn-default btn-sm" submit">animal</button>
	<button class="btn btn-default btn-sm" submit">fly</button>
	<button class="btn btn-default btn-sm" submit">lovely</button>
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