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
			.attr("id","create_btn")
			.attr("enctype","multipart/form-data")			
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
			.attr("id","create_btn")
			.attr("value","Create")
			.attr("name","submit")

//		var input_send=$("<a></a>")
//			.attr("href","javascript:formSubmit2()")
//			.attr("id","create")
//			.text("create")
			form_div.append(input);
			form_div.append(input_btn);
			form_div.append(input_send);			
		
			$('#create_btn').on('submit',(function(e) {
				e.preventDefault();
			   var serializeData = $(this).serialize();
			   
			   $(this).ajaxSubmit({
			        type:'POST',
			        url: "/iwowwow/iwow/group/create?"+param+"="+token,
			        dataType: 'json', 
			        data: serializeData,                   
			         
			        contentType: false,      
			        cache: false,             
			        processData:false,      
			          		      
			        success:function(response) {
						if (response) {
							swal({
								type : 'success',
								text : '新增成功!',
								showConfirmButton : false,
								customClass : 'swal',
								timer : 1000,
								
							});
							$(create_box_div).empty();
						} 
					}
			       
			    });
			}));
			   

			$("#photo").on("change", function() {
			    $(this).parent().submit();
			});
		
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

 
//function formSubmit2() {   		
//	
//		var frm=document.getElementById("create_btn");
//		
//	    frm.submit(function (ev) {
//		
//	        $.ajax({            
//	            url: frm.attr('action'),
//	            type: frm.attr('method'),
//	            data: frm.serialize(),
//	            dataType:'json',
//	            success: function (data) {
//	            	
//	                console.log(data)
//	            }
//	        });
//
//	        ev.preventDefault();
//	    });		
//	}   

  

