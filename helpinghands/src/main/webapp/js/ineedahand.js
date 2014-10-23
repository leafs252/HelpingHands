$(document).ready(function() {
	
	$("#submit").click(function() {
		saveINeedAHand();
	});
	
})

function saveINeedAHand() {
	$("#loading").show();
	
	$.post("http://" + window.location.host + "/INeedAHand", {
		title : $("#title").val(),
		details : $("#details").val(),
		date : $("#date").val(),
		location : $("#location").val(),
		volunteers : $("#volunteers").val()
	}, function(result) {
		window.location = "http://" + window.location.host + "/confirmation.jsp?id=" + result; 
	});
}