<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

  <script>
$(function() {
	$.when(load_picture).done(set_donor_name);

 	$("button[id='confirm']").click (function(){
 		 $('#donateModal').modal('hide');
	    
 		$.get("/iwowwow/iwow/donation/insert",{"receiver":picture_uploader.id,"amount":$("#amount").val()},
 				function(data){
 					if(data){
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