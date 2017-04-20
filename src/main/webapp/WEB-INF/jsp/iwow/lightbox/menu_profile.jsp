<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- 		修改個人資料  profile -->
<div id="js-lightbox-bg" class="res-profile-popup-bg"></div>
	<div class="res-profile-popup" id="js-lightbox-main">
	    <div id="js-lightbox-close">
	        <span aria-hidden="true" class="glyphicon glyphicon-remove"></span>
	    </div>
	    <div class="res-profile js-lightbox-profile">
	    
<!-- 	        profile import -->
		<c:import url="member/memberEdit.jsp" />
<!-- 	        profile import -->

	</div>
</div>