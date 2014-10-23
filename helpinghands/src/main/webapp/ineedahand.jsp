<%@ page import="objects.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>I Need A Hand!</title>
	
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
		
		
		<div class="container-fluid need-help">
      
	      <div class="row breadcrumb-row">
	        <div class="col-lg-12">
	          <ol class="breadcrumb">
	            <li><a href="home.jsp">Home</a></li>
	            <li class="active">I Need A Hand!</li>
	          </ol>
	        </div>  
	      </div> 
	      
		<!-- 	What do you need help with? <input id="title" type="text"><br> -->
		<!-- 	Tell us more <textarea id="details"></textarea><br> -->
		<!-- 	When do you want help? <input id="date" type="text" placeholder="Datepicker here"><br> -->
		<!-- 	Where do you want help? <input id="location" type="text"><br> -->
		<!-- 	How many volunteers do you need? <input id="volunteers" type="text"><br> -->
		<!-- 	<input id="submit" type="button" value="Submit!"> -->
		<!-- 	<img id="loading" alt="Loading" src="images/loading.gif" style="display: none;"> -->
		
	      <div class="row need-help-form">
	        <div class="col-lg-offset-1 col-lg-10">
	          <h1 class="text-center">I Need A Hand!</h1>
	          <div class="row">
	            <div class="col-lg-12 need-help-form-container">
	              <div class="form-horizontal" >
	                
	                <div class="form-group">
	                  <label for="title" class="col-sm-2 col-md-5 col-lg-4 control-label">Title</label>
	                  <div class="col-lg-offset-1 col-sm-10 col-md-7 col-lg-7">
	                    <input type="text" class="form-control" id="title">
	                  </div>
	                </div>
	                
	                <div class="form-group">
	                  <label for="details" class="col-sm-2 col-md-5 col-lg-4 control-label">More details</label>
	                  <div class="col-lg-offset-1 col-sm-10 col-md-7 col-lg-7">
	                    <textarea type="text" class="form-control" id="details" rows="3"></textarea>
	                  </div>
	                </div>
	                
	                <div class="form-group">
	                  <label for="location" class="col-sm-2 col-md-5 col-lg-4 control-label">Where?</label>
	                  <div class="col-lg-offset-1 col-sm-10 col-md-7 col-lg-7">
	                    <input type="text" class="form-control" id="location">
	                  </div>
	                </div>
	                
	                <div class="form-group">
	                  <label for="volunteers" class="col-sm-2 col-md-5 col-lg-4 control-label">How many volunteers will you need?</label>
	                  <div class="col-lg-offset-1 col-sm-10 col-md-7 col-lg-7">
	                    <input type="text" class="form-control" id="volunteers">
	                  </div>
	                </div>
	                
	                <div class="form-group">
	                  <label for="date" class="col-sm-2 col-md-5 col-lg-4 control-label">Date</label>
	                  <div class="col-lg-offset-1 col-sm-10 col-md-7 col-lg-7">
	                    <input type="date" class="form-control" id="date" rows="8">
	                  </div>
	                </div>
	                
	                <div class="form-group">
	                  <div class="col-lg-offset-2 col-sm-offset-0 col-sm-10 col-md-12 col-lg-8">
	                    <a id="submit" href="#" class="btn btn-block btn-lg btn-primary">Submit <span class="glyphicon glyphicon-check"></span></a>
	                  </div>
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	      
	      
	    </div> <!-- End Container -->
		
		<!-- JS -->
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
		<script src="js/ineedahand.js"></script>
	</body>
<%
	}
%>
</html>