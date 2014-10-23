<%@ page import="objects.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Help</title>
	<!-- FONTS -->
    <link href='http://fonts.googleapis.com/css?family=Raleway:500,700,400,300' rel='stylesheet'>
    
    <!-- STYLESHEETS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="stylesheets/main.css">
</head>
<%
	User authenticated = (User) session.getAttribute("user");
	if (authenticated == null) {
%>
<script>
	window.location = "http://" + window.location.host;
</script>
<%
	} else {
%>
<body>

	<nav class="navbar navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-2 col-lg-1 height-100">
            <a class="navbar-brand" href="home.jsp">
              <img src="images/home.png" alt="Home" height="64px" width="64px">
            </a>
          </div>
          <div class="col-md-3 col-lg-3 text-center height-100">
            <span class="navbar-text">Fridgeway Baptist Church</span>
          </div>
          <div class="col-md-7 col-lg-7 text-center height-100 navbar-right">
            <div class="row">
              <div class="col-md-3 col-lg-3 height-100">
                <a class="selection-menu nav-leader height-100" href="leaderboard.jsp">Leaderboard</a>
              </div>
              <div class="col-md-3 col-lg-3 height-100">
                <a class="selection-menu nav-profile height-100" href="profile.jsp?id=${user.id}">Profile</a>
              </div>
              <div class="col-md-3 col-lg-3 height-100">
                <a class="selection-menu nav-help height-100" href="help.jsp">Help</a>
              </div>
              <div class="col-md-3 col-lg-3 height-100">
                <a class="selection-menu nav-logout height-100" href="index.jsp">Logout</a>
              </div>
            </div>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </nav>
    
    
    
<!--     HELLLPPPPP!!!!!!! -->
	<div class="container-fluid need-help">
      
      <div class="row breadcrumb-row">
        <div class="col-lg-12">
          <ol class="breadcrumb">
            <li><a href="home.jsp">Home</a></li>
            <li class="active">Help</li>
          </ol>
        </div>  
      </div> 
      
      <div class="row help">
        <div class="col-lg-offset-2 col-lg-8">
          <h1 class="text-center">Help</h1>
          <div class="row">
            <div class="col-lg-12">
              
              <h3 class="text-center">How To Post?</h3>
              <p>
              	If are looking for a hand, click on the "I Need A Hand!" button from the Home page to create a posting! You will need to fill out a few fields:
              </p>
              	<ul>
					<li> <b>Title</b>: short title for the posting (for example, "Need help mowing the lawn")</li>
					<li> <b>More details</b>: a few more details here (for example, "I am going away and will need my lawn mowed this Sunday.")</li>
					<li> <b>Where?</b>: location where you will need help</li>
					<li> <b>How many volunteers will you need?</b>: enter the number of helpers needed here</li>
					<li> <b>Date</b>: click the drop-down triangle to select a date from the calendar</li>
              	</ul>
              <p>
				Click the blue "Submit" button to submit your posting, and you can view the posting from your Profile page. You can also click the "Lend A Hand!" button on the Home page to see your posting within the list.
              </p>
              
              <h3 class="text-center">How To Volunteer?</h3>
              <p>If you are looking to help someone out, click on the "Lend A Hand!" button from the Home page! You will then be able to view the different postings around the community. Click any of them to view more details, and click the blue button below the details to sign up for a job! You can then view the jobs you have signed up for on your Profile page.
              </p>
              
              <h3 class="text-center">How To View Your Profile and Jobs</h3>
              <p>Click the "Profile" button on the menu to view your Profile page, including your name, phone number, and email (if provided). You can also view jobs you have created and signed up for here, as well as how many points you have accumulated from completing jobs.
              </p>
              
              <h3 class="text-center">How To Logout</h3>
              <p>Click the "Logout" button on the menu at the top of the screen to logout! Thanks for using the Helping Hands system!
              </p>
              
            </div>
          </div>
        </div>
      </div>
      
      
    </div> <!-- End Container -->

    
    <!-- JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
<%
	}
%>
</html>