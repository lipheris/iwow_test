var this_group;
var groups;
var all_groups_div = $("div[id='pic_related']");
var all_groups;
var member_id = [mem_id];


$(function(){
		
	$("div[id='group_button']").click(function(){
			$.getJSON("/iwowwow/iwow/group",function (groups){
				group_info_div.empty();
				$.each(groups,function(idx,group){				
					$("<p></p>")
					.text(group.name)				
					.appendTo(group_show);
					
					$("<p></p>")
					.text(group.members[0].name)
					.appendTo(group_show);
					
					$("</br>")
					.appendTo(group_show);								
				})											
			});		
		});
	});



function show_group(group) {
	$("#group_info > #group.name").text(group.name);
	$("img[id='group_show']").attr("src", group.photoAd);
}


$("div[id='group_button']").click(function(){
	$.each(groups,function(){
		
	});
});

