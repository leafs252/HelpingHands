$(document).ready(function() {
	
	loadJobs();
	
})

function loadJobs() {
	//$("#loading").show(); //TODO? and hide after load?
	
	$.get("http://" + window.location.host + "/INeedAHand", {
		//no parameters
	}, function(result) {
		
		var jsresult = JSON.parse(result);
		//TODO check and handle empty result
		for (var i=0; i < jsresult.length; i++) {
			$("tbody").append(
					"<tr id='" + jsresult[i]._id.$oid + "'>" +
						"<td class='text-center left-column'>"+jsresult[i].title+"</td>" +
						"<td class='text-center center-column info-column'>"+jsresult[i].details+"</td>" +
						"<td class='text-center center-column'>"+jsresult[i].date+"</td>" +
						"<td class='text-center right-column'>"+jsresult[i].name+"</td>" +
					"</tr>"
			);
			
			$("#" + jsresult[i]._id.$oid).click( function() {
				window.location = "http://" + window.location.host + "/volunteerdetail.jsp?id=" + (this).id;
			});
		}
		
		$("tbody tr").css("cursor", "pointer");
		
	});
}