var ENTER = 13;

$(document).ready(function() {
	
	$("#input-username").mask("999-9999");
	
	$("#login-submit").click(function() {
		login();
	});
	
    $("#input-username").keyup(function(event) {
    	if (event.keyCode == ENTER) {
        	login();
        }
    });
    
});

function login() {
	$("#error").hide();
	$("#loading").show();
	
	var username = $("#input-username").val();

	$.post(getLoginUrl(), {
		username: username,
	},
		function(result) {
		if (result == "success") {
			$("#error").text("");
			window.location = "http://" + window.location.host + "/home.jsp";
		} else {
			$("#loading").hide();
			$("#error").show();
		}
	});
}
    
function getLoginUrl() {
	var url = "http://" + window.location.host;
	url += "/Login";
	return url;
}