var this_picture;
var tags_div=$("div[id='pic_tags']");
var stats_div=$("div[id='pic_icons']");
var related_pictures_div = $("div[id='pic_related']");
var related_pictures;
var repeated_pictures_id = [pic_id];

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
			}
		}
	});
	
	$.getJSON("/iwowwow/iwow/pictures/" + pic_id + "/related_pictures", function (data){
		related_pictures = data;
		$.each(related_pictures, function(related_picture_index, related_picture) {
			if(!repeated_pictures_id.some(function(id){
				return this == id;
			},related_picture.id)){
				show_repeated_picture(related_picture);
				if(related_picture_index == 2){
					return false;
				}
			}
		});
	});
	
	$("div[id='pic_related_button']").click(function(){
		$(this).css("visibility", "hidden");
		$.each(related_pictures, function(related_picture_index, related_picture) {
			if(!repeated_pictures_id.some(function(id){
				return this == id;
			},related_picture.id)){
				show_repeated_picture(related_picture);
			}
		});
	});
});

function show_picture_article(picture) {
	$("#pic_info > #pic_name").text(picture.name);
	$("img[id='pic_show']").attr("src", picture.pictureAddress);
}

function insert_tags(tags) {
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
	stats_div.children("#views").text(stats.views);
	stats_div.children("#likes").text(stats.likes);
}

function show_repeated_picture(related_picture){
	repeated_pictures_id.push(related_picture.id);
	var show_picture = $("<a></a>")
		.attr("href", "/iwowwow/iwow/picture?id=" + related_picture.id)
		.prependTo(related_pictures_div);
	$("<img>").addClass("related")
		.attr("id", "pic_related")
		.attr("name", "pic_related")
		.attr("src", related_picture.pictureAddress)
		.prependTo(show_picture);
}