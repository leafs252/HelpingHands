<%@ page import="objects.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Home</title>
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
<!-- 	<a href="/ineedahand.jsp"><input id="iNeedAHand" type="button" value="I need a hand!"></a> -->
<!-- 	<a href="/lendahand.jsp"><input id="lendAHand" type="button" value="Lend a hand!"></a> -->

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
    
    
    <div class="container-fluid landing">
      <div class="row">
        <div class="col-md-offset-0 col-lg-offset-1 col-md-6 col-lg-4">
          <div class="selections">
            <a href="ineedahand.jsp" class="hand-up">
              <h3>I Need A Hand!</h3>
            </a>
          </div>
        </div>
        <div class="col-md-offset-0 col-lg-offset-2 col-md-6 col-lg-4">
          <div class="selections">
            <a class="hand-down" href="lendahand.jsp">
              <h3>Lend A Hand!</h3>
            </a>
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