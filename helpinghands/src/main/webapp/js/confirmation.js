$(document).ready(function() {
	
	$("#edit-this-submission").attr("href", "/ineedahand.jsp?id=" + getURLParameter("id"));
	
	getINeedAHandDetails();
	
})


function getINeedAHandDetails() {
	
	$.get("http://" + window.location.host + "/VolunteerDetails", {
		iNeedAHandId : getURLParameter("id")
	}, function(result) {
		var jsresult = JSON.parse(result);
		
		$("#title").html(jsresult.title);
		$("#details").html(jsresult.details);
		$("#date").html(jsresult.date);
		$("#location").html(jsresult.location);
	});
}

function getURLParameter(name) {
	return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20')) || null
}