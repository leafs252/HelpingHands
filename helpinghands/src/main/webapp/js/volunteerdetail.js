$(document).ready(function() {
	
	getVolunteerDetails();
	
	iWantToHelpClickHandler();
	
})


function getVolunteerDetails() {
	
	$.get("http://" + window.location.host + "/VolunteerDetails", {
		iNeedAHandId : getURLParameter("id")
	}, function(result) {
		var jsresult = JSON.parse(result);
		
		$("#title").html(jsresult.title);
		$("#details").html(jsresult.details);
		$("#date").html(jsresult.date);
		$("#location").html(jsresult.location);
		$(".nameToHelp").html(jsresult.name);
		
	});
}

function getURLParameter(name) {
	return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20')) || null
}

function iWantToHelpClickHandler() {
	$("#iWantToHelp").click(function() {
		$("#loading").show();
		
		$.post("http://" + window.location.host + "/LendAHand", {
			id : getURLParameter("id")
		}, function(result) {
			window.location = "http://" + window.location.host + "/profile.jsp?id=" + result + "&addedJob=true"; 
		});
	});
}