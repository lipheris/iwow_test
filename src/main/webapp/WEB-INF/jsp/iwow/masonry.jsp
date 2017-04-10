<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.imagesloaded/3.1.8/imagesloaded.pkgd.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-infinitescroll/2.1.0/jquery.infinitescroll.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/masonry/3.3.1/masonry.pkgd.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery-infinitescroll/2.0b2.120519/jquery.infinitescroll.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>masonry</title>

<style>
</style>

</head>
<body>
	<div id="masonry" class="container">
		<c:forEach var="p" items="${picMsg}">
			<div id="itemPic" class="portfolio-item hvr-float"
				dataId="${item.id}">
				<div class="prodContent">
					<div class="prodImg">
						<a href="<c:url value="/iwow/picture/${p.id}" />"><img
							src="${p.pictureAddress}" /></a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<a id="next" href="index2.html">next page</a>

	<script>
		$(document).ready(function() {
			var $container = $("#masonry");

			$container.imagesLoaded(function() {
				$container.masonry({
					itemSelector : '.prodImg',
					isAnimated : true,
				});
			});
		});
		
		$('#masonry').infinitescroll('binding','unbind');
		$('#masonry').data('infinitescroll', null);
		$(window).unbind('.infscr');
		
		$('#masonry').infinitescroll({
		navSelector : "#next:last",
		nextSelector : "a#next:last",
		itemSelector : "#masonry",
		dataType : 'html'
		});

		//網址切換
		$(function () {
		    var cont_h = $('.main').height();
		    var pathname = window.location.href;
		    var pathhost  = location.hostname;
	   
	    $(document).scroll(function () {
	          var top = window.pageYOffset;
	          	if(top<cont_h){
	          		window.history.pushState('', '', pathname);
	          		
	          	}else{
	          		var nexturl = $('#next').attr("href").replace("http://","").replace(pathhost,"");
	          		window.history.pushState('', '', nexturl);
	          	}
	    	});
		});
	</script>
</body>
</html>