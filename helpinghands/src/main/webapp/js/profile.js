$(document).ready(function() {
	
	//TODO show "job sign up success V" when "jobAdded=true"
	
	loadProfile();
	
})

function loadProfile() {
	//$("#loading").show(); //TODO? and hide after load?
	
	$.get("http://" + window.location.host + "/Profile", {
		userId : getURLParameter("id")
	}, function(result) {
		
		var jsresult = JSON.parse(result);
		var user = jsresult.user;
		var upcomingJobs = jsresult.upcomingJobs;
		var yourPostings = jsresult.yourPostings;
		
		//Show user information
		$("#profile-name").html(user.name);
		$("#profile-points").html(user.points);
		$("#profile-phoneNumber").html(user.phoneNumber);
		$("#profile-email").html(user.email);
		
		//Show upcoming jobs
		if (upcomingJobs.length > 0) {
			for (var i=0; i < upcomingJobs.length; i++) {
				$("#upcomingJobList tbody").append(
						"<tr id='" + upcomingJobs[i]._id.$oid + "'>" +
							"<td class='text-center left-column'>"+upcomingJobs[i].title+"</td>" +
							"<td class='text-center center-column info-column'>"+upcomingJobs[i].details+"</td>" +
							"<td class='text-center center-column'>"+upcomingJobs[i].date+"</td>" +
							"<td class='text-center center-column'>"+upcomingJobs[i].name+"</td>" +
//							"<td class='right-column'>Cancel<td>" +
						"</tr>"
				);
				
				//TODO click handler for these?
	//			$("#" + jsresult[i]._id.$oid).click( function() {
	//				window.location = "http://" + window.location.host + "/volunteerdetail.jsp?id=" + (this).id;
	//			});
			}
			
			$("#upcomingJobs").show();
		
		} else {
			//TODO show none there?
		}
		
		//Show user's postings
		if (yourPostings.length > 0) {
			for (var i=0; i < yourPostings.length; i++) {
				$("#postingList tbody").append(
						"<tr id='" + yourPostings[i]._id.$oid + "'>" +
							"<td class='text-center left-column'>"+yourPostings[i].title+"</td>" +
							"<td class='text-center center-column info-column'>"+yourPostings[i].details+"</td>" +
							"<td class='text-center center-column'>"+yourPostings[i].date+"</td>" +
							"<td class='text-center center-column'>"+yourPostings[i].name+"</td>" +
//							"<td class='right-column'>Cancel<td>" +
						"</tr>"
				);
				
				//Don't need click handler here
			}
			
			$("#postings").show();
		
		} else {
			//TODO show none there?
		}
		
	});
}

function getURLParameter(name) {
	return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20')) || null
}