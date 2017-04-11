$(function() {
	$.getJSON("/iwowwow/iwow/pictures/" + pic_id, function (picture){
		this_picture = picture;
		if(this_picture != null){
			show_picture_article(this_picture);
			if (this_picture.stats != null) {
				insert_stats(this_picture.stats);
			}
			if( this_picture.tags != null ){
				insert_tags(this_picture.tags);
				show_related_picture(this_picture.tags);
			}
		}
	});
});
var this_picture;
function show_picture_article(picture) {
	var uploader_id = picture.uploaderId;
	$("#pic_info > #pic_name").text(picture.name);
	$("img[id='pic_show']").attr("src", picture.pictureAddress);
}
function insert_tags(tags) {
	var tags_div=$("div[id='pic_tags']");
	$.each(tags, function(tag_index, tag) {
		$("<button></button>").addClass("btn")
			.addClass("btn-default btn-sm")
			.attr("name", "pic_tags")
			.attr("id", "pic_tags")
			.text(tag.name)
			.click(function() {
				location.href = "/iwowwow/iwow/search?ctx=" + tag.name;
			})
			.appendTo(tags_div);
	})
}
function insert_stats(stats) {
	var stats_div=$("div[id='pic_icons']");
	stats_div.children("#views").text(stats.views);
	stats_div.children("#likes").text(stats.likes);
}
function show_related_picture(tags){
	var related_pictures_div = $("div[id='pic_related']");
	var repeated_picture_id = [this_picture.id];
	$.each(tags, function(tag_index, tag){
		$.getJSON("/iwowwow/iwow/tags/" + tag.id, function (tag){
			$.each(tag.pictures, function(tag_picture_index, tag_picture){
				if(!repeated_picture_id.some(function(id){
					return this == id;
				},tag_picture.id)){
					repeated_picture_id.push(tag_picture.id);
					var related_picture = $("<a></a>")
						.attr("href", "/iwowwow/iwow/picture?id=" + tag_picture.id)
						.prependTo(related_pictures_div);
					$("<img>").addClass("related")
						.attr("id", "pic_related")
						.attr("name", "pic_related")
						.attr("src", tag_picture.pictureAddress)
						.prependTo(related_picture);
				}
			});		
		});
	});
}