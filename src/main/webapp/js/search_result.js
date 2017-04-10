$(function() {
	var rs=$("#search_result");
	$.each(result,function(index,picture){
		var link = $("<a></a>").attr("href","picture?id="+picture.id)
		.appendTo(rs);
		var pic = $("<img>").attr("src",picture.picture_address)
		.addClass("search_result_picture")
		.appendTo(link);
	});	
})