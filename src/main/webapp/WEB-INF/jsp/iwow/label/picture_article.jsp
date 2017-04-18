<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

 <!-- sweetAlert --> 
<link rel="stylesheet" href="<c:url value="/css/sweetalert.min.css"/>" />
<script src='<c:url value="/js/sweetalert.min.js"/>'></script>

<style>
.icons {
	margin-top: 50px;
}
</style>

<script type="text/javascript">
	function reportDetail() {
		window.location.href = "/iwowwow/iwow/sendEport?reportId=${picId}";
	}
	console.log(picture_id)
	function get_picture_value(picture) {
		// 	$("#cart-val").text(picture.name);
		// 	var picture_img = $("img[id='picture_img']").attr({ "src": picture.pictureAddress}).css({"width": "70%", "height": "70%"});
		//	var picture_link= picture_img.parent().attr({"href":picture.pictureAddress,"data-lightbox":"picture",'data-title':picture.name});
	}
</script>
<div id="pic_info">
	<h1 id="pic_name"></h1>
	<h1 id="pic_author_name"></h1>
</div>

<div class="icons" id="pic_icons">
	<span class="glyphicon glyphicon-eye-open icon" aria-hidden="true"
		id="views"></span> <span class="glyphicon glyphicon-star-empty icon"
		aria-hidden="true" id="likes"></span>
	<p align="right">
		$<span>100</span>
	</p>
	<div id="cart-val">

		<img src="${picture.pictureAddress}" width="180" height="180"
			name="picId" value="${picture.id}" style="display: none"> <input
			type="hidden" name="id" value="${picture.id}"> <input
			type="hidden" name="name" value="${picture.name}"> <input
			type="hidden" name="pictureAddress" value="${picture.pictureAddress}">
		<a href="javascript: void(0)" money='100' class="addcar"> <span
			class="glyphicon glyphicon-shopping-cart icon" aria-hidden="true"
			id="shopping_cart"></span>
		</a>
	</div>
</div>


<div class="mainPicture" id="picture_img">
	<a><img id="picture_img" /></a>
</div>

<div class="bottons" id="pic_buttons">
	<button class="btn btn-primary" type="submit" id="pic_buttons">FB</button>
	<button class="btn btn-success" type="button" id="pic_buttons" data-toggle="modal" data-target="#donateModal">DONATE</button>
	<button class="btn btn-danger"  type="submit" onclick="reportDetail()">檢舉</button>
</div>

<!-- donation text -->

  <!-- Modal -->
  <div class="modal fade" id="donateModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
    
<!--       Modal content -->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title"  id="myModalLabel">Donate</h4>
        </div>
        <div class="modal-body">
        
<!--          donation form -->
<!--           <form action="/iwowwow/iwow/donation/insert" method="post"> -->
	
	<!-- REC_ID  -->
	<div>
<!-- 		<label for="receiver">REC_ID：</label> -->
		<input type="hidden" id="receiver" name="receiver" value="">
		<h3>收款人</h3>
		<h3 class="receiver_nickname"></h3>
	</div>	
	
	<!-- AMOUNT  -->
	<div>
		<label for="amount">DONATE金額：</label>
		<input type="text" id="amount" name="amount" value="">
	</div>	

<!--          donation form -->          

        </div>
        <div class="modal-footer">
<!--         送出/清除 -->
          <button id="test_btn" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button id="confirm" type="submit" class="btn btn-primary" data-dismiss="modal">Confirm</button>
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </div>
<!--          </form> -->
      </div>
      
    </div>
  </div>
<!-- donation text -->


<!-- tag -->
<div id="pic_tags"></div>

<!-- related pic -->
<div style="margin: 10px;" id="pic_related"></div>

<script>
$(function() {
	$.when(load_picture).done(set_donor_name);

 	$("button[id='confirm']").click (function(){
 		 $('#donateModal').modal('hide');
	    
 		$.get("/iwowwow/iwow/donation/insert",{"receiver":picture_uploader.id,"amount":$("#amount").val()},
 				function(data){
 					if(data == "true"){
 						swal("DONATE成功！", "感謝您，您的支持是繪師進步的動力！", "success");
 					}
 			});
 	})
});

function set_donor_name() {
	var receiver_id = picture_uploader.id;
	var receiver_nickname = picture_uploader.nickname;
	
	$("#receiver").val(receiver_id);
    $(".receiver_nickname").text(receiver_nickname);
}

</script>
