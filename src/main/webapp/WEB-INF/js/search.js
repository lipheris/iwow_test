/**
 * search banner
 */
var form=document.getElementById("search");
var button=document.getElementById("searchButton");
$(function(){
	$(button).click(search)
})
function search() {
	form.action="search"
		.method="GET"
		.submit();
}