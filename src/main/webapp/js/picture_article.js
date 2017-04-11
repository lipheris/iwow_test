$(function() {
	$.getJSON("/iwowwow/iwow/pictures/" + pic_id, function (picture){
		if(picture!=null)
			show_picture_article(picture);
		
		});
});
function show_picture_article(picture) {
	var uploader_id = picture.uploaderId;
	$("#pic_info > #pic_name").text(picture.name);
	$("img[id='pic_show']").attr("src", picture.pictureAddress);
	if (picture.stats != null) {
		insert_stats(picture.stats);
	}
	if( picture.tags != null ){
		insert_tags(picture.tags);	
	}

}
function insert_tags(tags) {
	var tags_div=$("div[id='pic_tags']");
	$.each(tags, function(index, tag) {
		$("<button></button>").addClass("btn")
			.addClass("btn-default btn-sm")
			.attr("name", "tagmark")
			.attr("id", "pic_tags")
			.text(tag.name)
			.click(function() {
				location.href = "/iwowwow/iwow/search?ctx=" + tag.name;
		}).appendTo(tags_div);
	})
}function insert_stats(stats) {
	var stats_div=$("#pic_icons");
	stats_div.children("#views").text(stats.views);
	stats_div.children("#likes").text(stats.likes);
}