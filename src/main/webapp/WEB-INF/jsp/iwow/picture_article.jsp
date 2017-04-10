<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">var pic_id = ${picId}</script>
<script type="text/javascript" src='<c:url value="/js/picture_article.js" />'></script>
<article>
		<div id="pic_info">
			<h1 id="pic_name"></h1>
			<h1 id="pic_author_name"></h1>
		</div>

	<div class="icons" id="pic_icons">
		<span 	class="glyphicon glyphicon-eye-open icon" 
				aria-hidden="true" id="views"></span> 
		<span 	class="glyphicon glyphicon-star-empty icon"
				aria-hidden="true" id="likes"></span> 
		<span 	class="glyphicon glyphicon-shopping-cart icon" 
				aria-hidden="true" id="shopping_cart"></span>
	</div>

	<div class="mainPicture" id="pic_show">
		<img style="width: 70%; height: 70%;" id="pic_show" src="">
	</div>

	<div class="bottons" id="pic_buttons">
		<button class="btn btn-primary" type="submit" id="pic_buttons">FB</button>
		<button class="btn btn-success" type="submit" id="pic_buttons">DONATE</button>
	</div>

	<!-- tag -->
	<div id="pic_tags">
		<form action="/iwowwow/iwow/selectTags" method="get">
			<button class="btn btn-default btn-sm" type="submit" name="tagmark" id="pic_tags"
				value="bird">bird</button>
			<button class="btn btn-default btn-sm" type="submit" name="tagmark" id="pic_tags"
				value="cute">cute</button>
			<button class="btn btn-default btn-sm" type="submit" name="tagmark" id="pic_tags"
				value="wild">wild</button>
			<button class="btn btn-default btn-sm" type="submit" name="tagmark" id="pic_tags"
				value="animal">animal</button>
			<button class="btn btn-default btn-sm" type="submit" name="tagmark" id="pic_tags"
				value="fly">fly</button>
			<button class="btn btn-default btn-sm" type="submit" name="tagmark" id="pic_tags"
				value="lovely">lovely</button>
		</form>
	</div>

	<!-- related pic -->
	<div style="margin: 10px;" id="pic_related">
		<img class="related" id="pic_tags"
			src="http://d2fbmjy3x0sdua.cloudfront.net/sites/default/files/styles/engagement_card/public/sfw_apa_2013_28342_232388_briankushner_blue_jay_kk_high.jpg?itok=ttMfUhUu">
		<img class="related" id="pic_tags"
			src="http://s7d2.scene7.com/is/image/PetSmart/ARFEAT-CaringForYourBird-20160818?$CL0601$">
		<img class="related" id="pic_tags"
			src="https://s-media-cache-ak0.pinimg.com/originals/28/ca/6d/28ca6dc83ab41cfb2f90c867ebb31383.jpg">
	</div>

	<div class="relatedBtn">
		<button class="btn btn-success" type="submit">See Related</button>
	</div>
</article>