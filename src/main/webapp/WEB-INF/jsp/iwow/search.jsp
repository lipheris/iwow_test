<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>search</title>

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

/* �j�M���G����  search_all*/
.search_all{
	width:1200px;
	margin:0 auto;
}
/* �j�M���G���X�i�Ӥ����έp�ƾ� */
.search_picture{
	float:left;
}
.search_picture_stats{
	font-size:25px;
	padding:5px;
	padding-right:10px;
}

/* �����j�M(TAG) */
.search_related{
	float:right;
}
.search_related_name, .search_related_tag{
	font-size:25px;
}

/* search_bottom */
.search_bottom{
	padding-top:80px;
}

/* Image�BAuther */
.search_nav{
	clear: both;
	float:left;
	margin:10px;
}
.search_nav_active, .search_nav_slash{
	display:inline-block;
	font-size:30px;
}

/* ���i���j�M�� */
.search_advanced{
	padding:20px;
}
.search_advanced_stats{
	font-size:25px;
	float:right;
	padding:5px;
	padding-right:10px;
}

/* Search���G */
.search_result{
	clear:left;
}
.search_result_picture{
	width:30%;
	margin:5px;
	display:inline-block;
	vertical-align:top;
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
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav" style="font-size: 35px">
				<li class="active"><span
					class="glyphicon glyphicon-search banner_searchicon" aria-hidden="true"></span></li>
			</ul>

			<form class="navbar-form navbar-left">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>

			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">Sign Up</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->

	</div>
	<!-- /.container-fluid --> </nav>
	
		
	<!-- �j�M���G����  -->
	<div class="search_all">
	
	<div class="search_top">
	<!-- �j�M���G���X�i�Ӥ����έp�ƾ� -->
	<div class="search_picture">
	<span class="search_picture_stats">1,163,241</span>
	<span class="search_picture_stats">Bird</span>
	<span class="search_picture_stats">Picture</span>
	</div>
	
	<!-- �����j�M(TAG) -->
	<div class="search_related">
	<span class="search_related_name">Related Searches�G</span>
	<a href="#" class="search_related_tag">nature,</a>
	<a href="#" class="search_related_tag">wings,</a>
	<a href="#" class="search_related_tag">animal</a>
	</div>
	</div>
	
	<!-- search_bottom -->
	<div class="search_bottom">
	<!-- Image�BAuther -->
	<div class="search_nav">
		<a href="#" class="search_nav_active">Image</a>
		<p class="search_nav_slash">/</p>
		<a href="#" class="search_nav_active">Auther</a>
	</div>
	
	<!-- ���i���j�M�� -->
	<div class="search_advanced">
	<a href="#" class="glyphicon glyphicon-star-empty search_advanced_stats" aria-hidden="true">500</a>
	<a href="#" class="glyphicon glyphicon-star-empty search_advanced_stats" aria-hidden="true">100</a>
	<a href="#" class="glyphicon glyphicon-star-empty search_advanced_stats" aria-hidden="true">50</a>
	</div>

	<!-- Search���G -->
	<div class="search_result">
		<img class="search_result_picture" src="http://d2fbmjy3x0sdua.cloudfront.net/sites/default/files/styles/engagement_card/public/sfw_apa_2013_28342_232388_briankushner_blue_jay_kk_high.jpg?itok=ttMfUhUu">
		<img class="search_result_picture" src="http://s7d2.scene7.com/is/image/PetSmart/ARFEAT-CaringForYourBird-20160818?$CL0601$">
		<img class="search_result_picture" src="https://s-media-cache-ak0.pinimg.com/originals/28/ca/6d/28ca6dc83ab41cfb2f90c867ebb31383.jpg">
		<img class="search_result_picture" src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTxWjwdli7SzC13-nd9JnsNFcBPPOL8QCI8fsWcA5Vo3RUCQQ5y">
		<img class="search_result_picture" src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRpLzfMG2-bYjQhJ-Yz6KNBKE3H0NkYnWGJOJF3cE1Z0nzFKTP6">
		<img class="search_result_picture" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQjXvYGODrgdGssCS2enKxCuhpU-xWC_aNwDX8q36OtmEUcV24FeA">	
	</div>
	</div>
	</div>
</body>
</html>