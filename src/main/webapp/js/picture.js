var picture_id = location.pathname.split("/").pop();
var picture;
var picture_uploader;
var load_picture = $.getJSON("/iwowwow/iwow/pictures/" + picture_id, function (_picture){
	if(_picture != null){
		picture = _picture;
		picture_uploader = _picture.uploader;
	}
	return _picture;
});