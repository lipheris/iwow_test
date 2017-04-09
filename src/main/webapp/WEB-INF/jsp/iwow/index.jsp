<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>iwowwow</title>


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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value="/css/animate.css"/>">
<style>
#prodDiv {
	margin-top: 50px;
}

.portfolio-item {
	margin-bottom: 30px;
	padding: 0 5px 0 5px;
}

.prodContent {
	padding: 5px 5px 20px 10px;
	overflow: hidden;	
	height: 230px;
}


.prodImg img {
	width: 100%;
}





.imgbox {
	width: 1000px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}

img {
	width: 30%;
	margin: 5px;
	display: inline-block;
	vertical-align: top;
}

.imgBtn {
	width: 100%;
}

.imgForm {
	width: 30%;
	margin: 5px;
	display: inline-block;
	vertical-align: top;
}

.buttons {
	text-align: center;
	margin-top: 30px;
	margin-bottom: 80px;
}
</style>

</head>
<body>
	<!-- banner import -->
	<c:import url="banner.jsp" />


	<div class="container">
		<div class="imgbox">
			<h1>waterflow</h1>

			<div id="prodDiv" class="row">
				<c:forEach var="item" items="${picMsg}">
					<div class="col-md-4 portfolio-item hvr-float" dataId="${item.id}">
						<div class="prodContent">				
							<div class="prodImg">								
								<a href="<c:url value="/iwow/picture/${item.id}"/>"><img src='${item.pictureAddress}' /></a>
							</div>
						</div>
					</div>
					<!-- portfolio-item -->
				</c:forEach>
			</div>
			<!-- #prodDiv -->


		</div>
	</div>

	<div class="buttons">
		<button class="btn btn-success" type="submit">LOGIN</button>
		<button class="btn btn-info" type="submit">See More</button>
	</div>

	</div>
	<script>
		$(function() {
			var timelineBlocks = $('.portfolio-item'), offset = 1.0;

			hideBlocks(timelineBlocks, offset);

			$(window).on('scroll', function() {
				(!window.requestAnimationFrame) ? setTimeout(function() {
					showBlocks(timelineBlocks, offset);
				}, 100) : window.requestAnimationFrame(function() {
					showBlocks(timelineBlocks, offset);
				});
			});
			function hideBlocks(blocks, offset) {
				blocks.each(function() {
					($(this).offset().top > $(window).scrollTop()
							+ $(window).height() * offset)
							&& $(this).find('.prodContent').addClass(
									'is-hidden');
					console.log("hide");
				});
			}
			function showBlocks(blocks, offset) {
				blocks.each(function() {
					($(this).offset().top <= $(window).scrollTop()
							+ $(window).height() * offset && $(this).find(
							'.prodContent').hasClass('is-hidden'))
							&& $(this).find('.prodContent').removeClass(
									'is-hidden')
									.addClass('animated fadeInDown');
					console.log("show" + $(this));
				});
			}

		});
	</script>
</body>
</html>