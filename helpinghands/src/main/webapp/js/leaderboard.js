$(document).ready(function() {
	
	loadUsers();
	
})

function loadUsers() {
	//$("#loading").show(); //TODO? and hide after load?
	
	$.get("http://" + window.location.host + "/Leaderboard", {
		//no parameters
	}, function(result) {
		
		var jsresult = JSON.parse(result);
		//TODO check and handle empty result
		for (var i=0; i < jsresult.length; i++) {
			$("tbody").append(
					"<tr id='" + jsresult[i]._id.$oid + "'>" +
						"<td class='text-center left-column'>"+ (i+1) +"</td>" +
						"<td class='text-center center-column'>"+jsresult[i].name+"</td>" +
						"<td class='text-center points right-column'>"+jsresult[i].points+"</td>" +
					"</tr>"
			);
			
			$("#" + jsresult[i]._id.$oid).click( function() {
				window.location = "http://" + window.location.host + "/profile.jsp?id=" + (this).id;
			});
		}
		
		$("tbody tr").css("cursor", "pointer");
		
	});
}