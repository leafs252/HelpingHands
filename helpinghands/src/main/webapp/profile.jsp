<%@ page import="objects.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Profile</title>
	
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
	
<!-- 	My Profile<br><br> -->
<!-- 	<div id="name"></div> -->
<!-- 	<div id="points"></div> -->
<!-- 	<div id="phoneNumber"></div> -->
<!-- 	<div id="email"></div> -->

<!-- 	<div id="upcomingJobs"> -->
<!-- 		<hr> -->
<!-- 		Your upcoming jobs<br> -->
<!-- 		<table id="upcomingJobList"> -->
<!-- 			<thead> -->
<!-- 				<tr> -->
<!-- 					<td>I want help with...</td> -->
<!-- 					<td>More information</td> -->
<!-- 					<td>I want help on...</td> -->
<!-- 					<td>I am</td> -->
<!-- 				</tr> -->
<!-- 			</thead> -->
<!-- 			<tbody> -->
<!-- 			</tbody> -->
<!-- 		</table> -->
<!-- 	</div> -->
<!-- 	<div id="postings"> -->
<!-- 		<hr> -->
<!-- 		Your postings<br> -->
<!-- 		<table id="postingList"> -->
<!-- 			<thead> -->
<!-- 				<tr> -->
<!-- 					<td>I want help with...</td> -->
<!-- 					<td>More information</td> -->
<!-- 					<td>I want help on...</td> -->
<!-- 					<td>I am</td> -->
<!-- 				</tr> -->
<!-- 			</thead> -->
<!-- 			<tbody> -->
<!-- 			</tbody> -->
<!-- 		</table> -->
<!-- 	</div> -->
	
	<div class="container-fluid need-help">
      
      <div class="row breadcrumb-row display-ib">
        <div class="col-lg-12">
          <ol class="breadcrumb">
            <li><a href="home.jsp">Home</a></li>
            <li class="active">My Profile</li>
          </ol>
        </div>  
      </div> 
      
      <div class="row profile">
        <div class="col-lg-offset-1 col-lg-10">
          <h1 class="text-center">My Profile</h1>
        </div>
        <div class="col-lg-offset-0 col-lg-1">
          <h1 class="text-center star" style="text-align: left;"><span id="profile-points"></span></h1>
        </div>
      </div>
      <div class="row profile">
        <div class="form-inline">
          
          <div class="form-group text-center" style="height: 70px;">
            <label for="title" class="col-sm-2 col-md-5 col-lg-4 control-label" style="height: 70px;padding-top: 20px;">Name</label>
            <span class="form-control" id="profile-name" style="height: 40px; margin-top: 17px;"></span>
          </div>
          
          <div class="form-group text-center" style="height: 70px;">
            <label for="title" class="col-sm-2 col-md-5 col-lg-4 control-label" style="height: 70px;padding-top: 0px;">Phone Number</label>
            <span class="form-control" id="profile-phoneNumber" style="height: 40px; margin-top: 17px;"></span>
          </div>
          
          <div class="form-group text-center" style="height: 70px;">
            <label for="title" class="col-sm-2 col-md-5 col-lg-4 control-label" style="height: 70px;padding-top: 20px;">Email</label>
            <span class="form-control" id="profile-email" style="height: 40px; margin-top: 17px;"></span>
          </div>
        </div>
      </div>
      
      <hr>
      
      <div id="upcomingJobs">
	      <div class="row profile">
	        <div class="col-lg-12">
	          <h1 class="text-center">Your Upcoming Jobs</h1>
	        </div>
	      </div>
	      
	      <div class="row upcoming-job-table">
	        <div class="col-lg-12">
	          <div class="table-responsive">
	            <table id="upcomingJobList" class="table table-hover table-striped">
	              <thead>
	                <tr>
	                  <th class="text-center">Title</th>
	                  <th class="text-center info-column">More details</th>
	                  <th class="text-center">Date</th>
	                  <th class="text-center">Posted by</th>
<!-- 	                  <th> </th> -->
	                </tr>
	              </thead>
	              <tbody>
						                
	              </tbody>
	            </table>
	          </div>
	        </div>
	      </div>
	  </div>
      
      <div id="postings">
	      <div class="row profile">
	        <div class="col-lg-12">
	          <h1 class="text-center">Your Postings</h1>
	        </div>
	      </div>
	      
	      <div class="row upcoming-job-table">
	        <div class="col-lg-12">
	          <div class="table-responsive">
	            <table id="postingList" class="table table-hover table-striped">
	              <thead>
	                <tr>
	                  <th class="text-center">Title</th>
	                  <th class="text-center info-column">More details</th>
	                  <th class="text-center">Date</th>
	                  <th class="text-center">Posted by</th>
<!-- 	                  <th> </th> -->
	                </tr>
	              </thead>
	              <tbody>
	              
	              </tbody>
	            </table>
	          </div>
	        </div>
	      </div>
      </div>
      
    </div> <!-- End Container -->
	
	<!-- JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="js/profile.js"></script>
</body>
<%
	}
%>
</html>