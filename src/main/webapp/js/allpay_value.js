$(function(){
		
	$("a[id='member_upgrade']").on(type="click",function(){
		
			$.getJSON("/iwowwow/iwow/allpay",function (model){
				console.log(model)
				$("input[name=MerchantTradeNo]").val('DX'+model[0]+'0c16')
				$("input[name=MerchantTradeDate]").val(model[1])
				$("input[name=CheckMacValue]").val(model[2])
				})											
		});
	});

