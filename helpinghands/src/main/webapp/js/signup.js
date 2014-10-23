$(document).ready(function() {
	
	$("#input-phoneNumber").mask("999-9999");
	
	$("#login-submit").click(function() {
		saveINeedAHand();
	});
	
})

function saveINeedAHand() {
	
	var valid = true;
	
	if ($("#input-name").val() == "") {
		valid = false;
		$("#name-valid").show();
	} else {
		$("#name-valid").hide();
	}
	
	if ($("#input-phoneNumber").val() == "") {
		valid = false;
		$("#phoneNumber-valid").show();
	} else {
		$("#phoneNumber-valid").hide();
	}
	
	if (valid) {
		$("#loading").show();
		
		$.post("http://" + window.location.host + "/SignUp", {
			name : $("#input-name").val(),
			phoneNumber : $("#input-phoneNumber").val(),
			email : $("#input-email").val(),
		}, function(result) {
			window.location = "http://" + window.location.host + "/home.jsp"; 
		});
	}
}