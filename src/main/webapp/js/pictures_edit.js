$(function(){
		
	$("a[id='pictures_edit']").on(type="click",function(){
		
		var boxs_div=$("div[id='boxs']");
		$(boxs_div).empty();
			$.getJSON("/iwowwow/iwow/pictures/edit",function (pictures){								
				$.each(pictures,function(idx,picture){
					var temp=1;
					var tagtemp=true;
					var social_box_div=$("<div></div>")
					 .addClass("picture_box")
					 .attr("id","picture_box")
					 $("<img>")		
					 .addClass("picture_box_img")
					 .attr("src", picture.pictureAddress)
					 .appendTo(social_box_div).click(function(event) {
						 event.preventDefault();
							if(temp==1){
					$(event.target).nextAll().remove();
					var social_box_form=$("<form></form>")
					 .attr("action","/iwowwow/iwow/update")
					 .attr("method","get")
					 .appendTo(social_box_div)
					$("<input>")		
					.addClass("picture_box_id")
					.attr("type", "hidden")
					.attr("name", "id")
					.attr("value", picture.id)
					.appendTo(social_box_form).after("<div></div>");
										
					$("<input>")
					.addClass("picture_box_name")
					.attr("type", "text")
					.attr("name", "name")
					.attr("value", picture.name)
					.appendTo(social_box_form)
					.before("姓名:")
					.after("<div></div>");
					if(picture.assort=='RESTRICTED'){
						var cell1=$("<option></option>")
						.attr("name", "assort")
						.attr("value", "GENERAL")
						.text("全年齡");
						var cell2=$("<option></option>")
						.attr("name", "assort")
						.attr("value", "RESTRICTED")
						.attr("selected", "true")
						.text("18禁")
					$("<select></select>")
					.addClass("picture_box_assort")
					.attr("name", "assort")
					.appendTo(social_box_form)
					.append([cell1,cell2])
					.before("瀏覽限制：")
					.after("<div></div>");
					}else{
						var cell1=$("<option></option>")
						.attr("name", "assort")
						.attr("value", "GENERAL")
						.attr("selected", "true")
						.text("全年齡")
						var cell2=$("<option></option>")
						.attr("name", "assort")
						.attr("value", "RESTRICTED")
						.text("18禁")
					$("<select></select>")
					.addClass("picture_box_assort")
					.attr("name", "assort")
					.appendTo(social_box_form)
					.append([cell1,cell2])
					.before("瀏覽限制：")
					.after("<div></div>");
					}
					if(picture.visibility=='PRIVATE'){
						var cell1=$("<option></option>")
						.attr("value", "GENERAL")
						.text("公開");
						var cell2=$("<option></option>")
						.attr("value", "RESTRICTED")
						.attr("selected", "true")
						.text("私人")
					$("<select></select>")
					.addClass("picture_box_visibility")
					.attr("name", "visibility")
					.appendTo(social_box_form)
					.append([cell1,cell2])
					.before("權限：")
					.after("<div></div>");
					}else{
						var cell1=$("<option></option>")
						.attr("value", "GENERAL")
						.attr("selected", "true")
						.text("公開")
						var cell2=$("<option></option>")
						.attr("value", "RESTRICTED")
						.text("私人")
					$("<select></select>")
					.addClass("picture_box_visibility")
					.attr("name", "visibility")
					.appendTo(social_box_form)
					.append([cell1,cell2])
					.before("權限：")
					.after("<div></div>");
					}
					$("<div></div>")
					.addClass("picture_box_update")
					.attr("name", "update")
					.attr("value", picture.update)
					.appendTo(social_box_form);
					
					$("<button>")
					.addClass("picture_box_edit")
					.text("修改")
					.click(function(event) {
						event.preventDefault();
						var form = (event.target.form), 
							id = $(form.id).val(), 
							assort = $(form.assort).val(),
							picName = $(form.picName).val(),
							visibility = $(form.visibility).val()
						url = "/iwowwow/iwow/member/update";
						$.get(url, {
							"assort" : assort,
							"picName" : picName,
							"visibility" : visibility,
							"id" : id
						}, function(response) {
							if (response) {
								swal({
									type : 'success',
									text : '修改成功!',
									showConfirmButton : false,
									customClass : 'swal',
									timer : 1000,
								});
							}
						})
					})
					.appendTo(social_box_form);
					$("<button>")
					.addClass("picture_box_del")
					.text("刪除")
					.attr('data-picId',picture.id)
					.click(function(event) {
						var id = $(event.target).attr('data-picId');
						event.preventDefault();
						var test=$(id);
						url = "/iwowwow/iwow/member/delete";
						console.log(id)
						$.get(url, {
							"id" : id
						}, function() {
							$(event.target).parent().parent().remove();
						})
					})
					.appendTo(social_box_form);
					temp=2;
				}else if(temp==2){
					$(event.target).nextAll().remove();
//						$(event.target).parent().remove();
						var id =picture.id;
						event.preventDefault();
						var test=$(id);
						url = "/iwowwow/iwow/tags/get";
						console.log(id)
						$.getJSON(url, {
							"id" : id
						}, function(tags) {
							var tags_box_div=$("<lable></lable>")
							.addClass("tag_box")
							.attr("id","tag_box")
							.appendTo(social_box_div);
							
							$.each(tags,function(idx,tag){
								var tagid=tag.id
								var id=picture.id
								$("<input>")		
								.addClass("tag_box_id")
								.attr("type", "hidden")
								.attr("name", "name")
								.attr("value", tagid)
								.appendTo(tags_box_div);
								$("<button>")		
								.addClass("tag_box_name")
								.attr("tagId", tagid)
								.attr("name", id)
								.text(tag.name)
								.on('click',function(event){
									event.preventDefault();
									var url="/iwowwow/iwow/picture/tags/delete";
									console.log(tagid)
									console.log(id)
									$(event.target).remove();
									$.get(url,{"tagId":tagid,"id":id},function(response){
										if (response) {
											
										swal({
											type : 'success',
											text : '刪除成功!',
											showConfirmButton : false,
											customClass : 'swal',
											timer : 1000,
											
										});
									}})
									
								})
								.appendTo(tags_box_div);
							})
							$("<input>")
							.addClass("tag_new_name")
							.attr("type","text")
							.attr("name","tagname")
							.insertAfter(tags_box_div)
							$("<button>")
								.addClass("tag_insert")
								.text("新增")
								.insertAfter(tags_box_div)
								.click(function(event){
									event.preventDefault();
									var tagname=$("input[name=tagname]").val()
									var test=$(picture.id)[0];
									event.preventDefault();
									console.log(tagname) 
									console.log(test)
									url = "/iwowwow/iwow/tags/insert";
									$.getJSON(url, {
										"id" : test,
										"name":tagname
									}, function(result) {
												var id=test
												var tagid= result.id;
												$("<input>")		
												.addClass("tag_box_id")
												.attr("type", "hidden")
												.attr("name", "id")
												.attr("value", result.id)
												.appendTo(tags_box_div);
												$("<button>")		
												.addClass("tag_box_name")
												.attr("name", "name")
												.text(result.name)
												.on('click',function(event){
													var url="/iwowwow/iwow/picture/tags/delete";
													console.log(tagid)
													console.log(id)
													$(event.target).remove();
													$.get(url,{"tagId":tagid,"id":id},function(response){
														if (response) {
															swal({
																type : 'success',
																text : '刪除成功!',
																showConfirmButton : false,
																customClass : 'swal',
																timer : 1000,
															});
														}})
									
								})
												.appendTo(tags_box_div);
												$(".tag_new_name")
												.val('')
										})
								})
								.appendTo(social_box_div);
							tagtemp=false;
						})
					temp=1;
				}
//				else{
//					temp1
//				}
			})
					$(social_box_div).appendTo(boxs_div)
									
				})											
			});		
		});
	});

