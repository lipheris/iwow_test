$(function(){
			

	
	
	$("button[id='createBtn']").click(function(){
		var createBtn_div=$("div[id='createBtn']");
		var create_box_div=$("div[id='createbox']")
		
		var token = $("meta[name='_csrf']").attr("content");
		var param = $("meta[name='_csrf_parametername']").attr("content");
		$(create_box_div).empty();
		var	form_div=$("<form></form>")
			.addClass("form-inline")
			.attr("action","/iwowwow/iwow/group/create?"+param+"="+token )			
			.attr("method","post")
			.attr("enctype","multipart/form-data")
			.attr("id","create_btn")
			.appendTo(create_box_div);
			
		var	input=$("<input>")
			.addClass("form-control")
			.attr("id","groupName")
			.attr("name","name")
			.attr("type","text");
		
		var input_btn=$("<input>")
			.attr("type","file")
			.attr("name","photo")
			.attr("id","photo")	
		
		var input_send=$("<input>")
			.attr("type","submit")
			.attr("value","Create")
			.attr("name","submit")
			form_div.append(input);
			form_div.append(input_btn);
			form_div.append(input_send);			
					
	})
	
	
	/*Search*/
	$("button[id='searchBtn']").click(function(){		
		var boxs_div=$("div[id='boxs']");
		var ctx = document.getElementById("searchCtx").value;
		$(boxs_div).empty();
			$.getJSON("/iwowwow/iwow/group/search?ctx="+ctx,function (groups){
				$.each(groups,function(idx,group){
									
					var social_box_div=$("<div></div>")
					 .addClass("social_box")
					 .attr("id","social_box")
					
					$("<img>")		
					.addClass("social_box_img")
					.attr("src", group.photoAd)
					.appendTo(social_box_div);
										
					$("<span>")
					.addClass("social_box_name")
					.text(group.name)
					.appendTo(social_box_div);
					
					$("<button>")
					.addClass("btn btn-info social_box_btn")
					.text("加入")
					.click(function() {										
							$.get("/iwowwow/iwow/group/update",{"name":group.name},
									function(data){																												
											if(data=true)
												$(social_box_div).remove();	
									}
							   );
							})
					
					.appendTo(social_box_div);
					
					$(social_box_div).appendTo(boxs_div);								
				})														
		});
				
	});

	/*FindAll*/
	$("button[id='findAllBtn']").click(function(){
		var boxs_div=$("div[id='boxs']");
		$(boxs_div).empty();
			$.getJSON("/iwowwow/iwow/group/find_groups",function (groups){								
				$.each(groups,function(idx,group){
									
					var social_box_div=$("<div></div>")
					 .addClass("social_box")
					 .attr("id","social_box")
					
					$("<img>")		
					.addClass("social_box_img")
					.attr("src", group.photoAd)
					.appendTo(social_box_div);
										
					$("<span>")
					.addClass("social_box_name")
					.text(group.name)
					.appendTo(social_box_div);
					
					$("<button>")
					.addClass("btn btn-danger social_box_btn")
					.text("退出")
					.click(function() {										
							$.get("/iwowwow/iwow/group/exit",{"name":group.name},
									function(data){																												
											if(data=="true")
												$(social_box_div).remove();	
									}
							   );
							})
						//location.href = "/iwowwow/iwow/group/exit?name=" + group.name;
					
					.appendTo(social_box_div);
					
					$(social_box_div).appendTo(boxs_div)
									
				})											
			});		
		});
	});


function show_group(group) {
	$("#group_info > #group_name").text(group.name);
	$("#group_info > #group_create_name").text(group.memid);
	$("img[id='group_img']").attr("src", group.photoAd);
}

