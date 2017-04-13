var stats_div=$("div[id='pic_icons']");
var tags_div=$("div[id='pic_tags']");
var related_pictures_div = $("div[id='pic_related']");
var related_pictures;
var repeated_pictures_id = [picture_id];

$(function() {	
	$.when(load_picture).done(function(){
		set_picture_info();
		search_related_picture();
	});
});

function set_picture_info(){
	if (picture != null){
		show_picture_article(picture);
		if (picture.stats != null)
			insert_stats(picture.stats);
		if (picture.tags != null)
			insert_tags(picture.tags);
	}else{
	//		$("#pic_name").text("權限不足");
	//		location.href="../../403";
	}
}

function show_picture_article(picture) {
	$("#pic_name").text(picture.name);
	var picture_img = $("<img />").attr({"id":"picture_img", "src": picture.pictureAddress}).css({"width": "70%", "height": "70%"});
//	var picture_link= $("<a></a>").attr({"href":picture.pictureAddress,"data-lightbox":"picture",'data-title':picture.name})
//		.append(picture_img).appendTo("div[id='picture_img']");
	picture_img.appendTo("div[id='picture_img']");
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

function search_related_picture(){
	$.getJSON("/iwowwow/iwow/pictures/" + picture_id + "/related_pictures", function (data){
		related_pictures = data;
		$.each(related_pictures, function(related_picture_index, related_picture) {
			if(!repeated_pictures_id.some(function(id){
				return this == id;
			},related_picture.id)){
				print_related_picture(related_picture);
				if(related_picture_index == 2){
					$("<div></div>").addClass("relatedBtn").attr("id", "pic_related_button")
					.html('<button class="btn btn-success" type="button">See Related</button>')
					.click(show_related_pictures)
					.appendTo(related_pictures_div);
					return false;
				}
			}
		});
	});
}

function print_related_picture(related_picture){
	repeated_pictures_id.push(related_picture.id);
	var show_picture = $("<a></a>")
		.attr("href", "/iwowwow/iwow/picture/" + related_picture.id)
		.appendTo(related_pictures_div);
	$("<img />").addClass("related")
		.attr({"id":"pic_related", "name":"pic_related", "src":related_picture.pictureAddress})
		.appendTo(show_picture);
}

function show_related_pictures(){
	$(this).css("display", "none");
	$.each(related_pictures, function(related_picture_index, related_picture) {
		if(!repeated_pictures_id.some(function(id){
			return this == id;
		},related_picture.id)){
			print_related_picture(related_picture);
		}
	});
	location.href="#pic_related";
}