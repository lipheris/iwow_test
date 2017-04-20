<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- css -->
<link rel="stylesheet" href="<c:url value="/css/menu_social.css"/>" />


<!-- 粉絲  fans -->
<div id="js-lightbox-bg" class="res-fans-popup-bg"></div>
	<div class="res-fans-popup" id="js-lightbox-main">
	    <div id="js-lightbox-close">
	        <span aria-hidden="true" class="glyphicon glyphicon-remove"></span>
	    </div>
	    <div class="res-fans js-lightbox-fans">
	        <!-- social -->
		<div class="social">

		<!-- search	-->
			<div id="search">
	            <input type="text" id="searchfield" value="Search contacts..." />
            </div>
            
        <!-- social box -->
			<div class="social_box">
			<img class="social_box_img" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/1_copy.jpg">
			<span class="social_box_name">粉絲</span>
			
			<button type="button" class="btn btn-danger social_box_btn">刪除</button>
			<button type="button" class="btn btn-info social_box_btn">加入</button>
			
			</div>    
            
        <!-- social box end -->
		</div> 
	</div>
</div>