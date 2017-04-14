var picture_painter_div = $("div[id='picture_painter']")

$(function() {
	$.when(load_picture).done(set_picture_uploader_info);
});

function set_picture_uploader_info() {
	
}