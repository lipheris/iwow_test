var picture_painter_div = $("div[id='picture_painter']");

$(function() {
	$.when(load_picture).done(set_picture_uploader_info);
});

function set_picture_uploader_info() {
	var picture_painter_img = picture_painter_div.find("img").attr("src", "https://secure.gravatar.com/avatar/afb1c54ac11486de1a71f6e0cd3ccc16?s=100&r=g&d=https://pacdn.500px.org/userpic.png");
	var picture_painter_name = picture_painter_div.find("h4").css({"margin": "5px"}).text(picture_uploader.nickname);
	var follow_button = picture_painter_div.find("button").click(follow_painter);
}

function follow_painter(){
//	$.ajax({
//		type:"PUT",
//		url:""
//	}).done();
}