/**
 * search banner
 */
$(function() {
//	var ctx = document.getElementById("searchCtx").value;
	$("#searchBtn").click(doSearch);
})
//document.getElementById("searchBtn").onclick = doSearch;
function doSearch(ctx) {
	var ctx = document.getElementById("searchCtx").value;
	if (ctx != "") {
		document.getElementById("searchForm").submit();
	}
}
