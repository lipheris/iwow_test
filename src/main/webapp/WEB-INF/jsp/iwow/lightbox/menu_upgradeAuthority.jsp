<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<<style>
/* form{ */
/* float:left */
/* } */
/* input{ */
/* float:left */
/* } */
</style>
<script src='<c:url value="/js/allpay_value.js"/>'></script>
<!--    -->
<div id="js-lightbox-bg" class="res-friends-popup-bg"></div>
	<div class="res-upgradeAuthority-popup" id="js-lightbox-main">
	    <div id="js-lightbox-close">
	        <span aria-hidden="true" class="glyphicon glyphicon-remove"></span>
	    </div>
	    <div class="res-upgradeAuthority js-lightbox-friends">
	    <form id="formCreditCard" method="post" accept-charset="UTF-8"
 action="https://payment-stage.allpay.com.tw/Cashier/AioCheckOut/V2"style="float:left">

<input type="hidden" name="MerchantID" value="2000132" />
<input type="hidden" name="MerchantTradeNo" value="" />
下單日期:
<input type="text" name="MerchantTradeDate" value="" readonly="readonly"/><br />
<input type="hidden" name="PaymentType" value="aio" />
價格:
<input type="text" name="TotalAmount" value="100"readonly="readonly" /><br />
升級會員:
<input type="text" name="ItemName" value="黃金會員"readonly="readonly" /><br />
<input type="hidden" name="TradeDesc" value="升級會員" readonly="readonly"/>
<input type="hidden" name="ReturnURL" value="http://192.168.21.117:8080/iwowwow/iwow/trade/get" />
付款方式
<input type="radio" name="ChoosePayment" value="Credit" checked="checked" />Credit<br />
<input type="hidden" name="ClientBackURL" value="http://192.168.21.117:8080/iwowwow/iwow/trade/buy" />
<input type="hidden" name="CreditInstallment" value="" /><br />
<input type="hidden" name="InstallmentAmount" value="" /><br />
<input type="hidden" name="Redeem" value="" /><br />
<input type="hidden" name="EncryptType" value="1" /><br />
<input type="hidden" name="CheckMacValue" value="" /><br />
<input type="submit" value="我要成為黃金會員" />

</form>
                                                                        
                  
	</div>
</div>