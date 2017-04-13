var this_picture;
var stats_div=$("div[id='pic_icons']");
var tags_div=$("div[id='pic_tags']");
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
					
					$("<div></div>").addClass("relatedBtn").attr("id", "pic_related_button")
					.append('<button class="btn btn-success" type="button">See Related</button>')
					.appendTo(related_pictures_div);
					return false;
				}
			}
		});
	});
	
	$("div[id='pic_related_button']").click(function(){
		$(this).css("display", "none");
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
	$("#pic_name").text(picture.name);
	var picture_img = $("<img />").attr({"id":"picture_img", "src": picture.pictureAddress}).css({"width": "70%", "height": "70%"});
	var picture_link= $("<a></a>").attr({"href":picture.pictureAddress,"data-lightbox":"picture",'data-title':picture.name})
		.append(picture_img).appendTo("div[id='picture_img']");
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
		.appendTo(related_pictures_div);
	$("<img />").addClass("related")
		.attr({"id":"pic_related", "name":"pic_related", "src":related_picture.pictureAddress})
		.appendTo(show_picture);
}