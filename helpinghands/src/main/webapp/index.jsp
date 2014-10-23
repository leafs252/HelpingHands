<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Helping Hands</title>
	  
		<!-- FONTS -->
	    <link href='http://fonts.googleapis.com/css?family=Raleway:500,700,400,300' rel='stylesheet'>
	    
	    <!-- STYLESHEETS -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	    <link rel="stylesheet" href="stylesheets/main.css">
	</head>
	
	<body>
		
<!-- 		<a href="/signup.jsp">Sign up!</a> -->
<!-- 		<br><br> -->
<!-- 		<input id="username" type="text" placeholder="Phone number"> -->
<!-- 		<input id="loginButton" type="button" value="Log In"> -->
<!-- 		<img id="loading" alt="Loading" src="images/loading.gif" style="display: none;"> -->
<!-- 		<span id="error" style="display: none;">Username does not exist</span> -->

		<div class="container-fluid login">
	      <h1 class="text-center">Fridgeway Baptist Church</h1>
	      <h3 class="text-center">Help & Volunteering Community</h3>
	      
	      <div class="row account">
	        <div class="col-xs-12 col-xs-offset-0 col-sm-8 col-sm-offset-2 col-md-8 col-md-offset-2 col-lg-6 col-lg-offset-3">
	          <a href="signup.jsp" class="btn btn-primary btn-lg btn-block" id="need-account-btn" role="button">Don't Have An Account? - Sign Up!</a>
	        </div>
	      </div>
	      
	      <div class="row login-box-container">
	        <div class="col-xs-12 col-xs-offset-0 col-sm-8 col-sm-offset-2 col-md-8 col-md-offset-2 col-lg-6 col-lg-offset-3 login-box">
	          
	          <h2 class="text-center">Login</h2>
	          
	          <div role="form" class="form-horizontal" >
	            <div class="form-group">
	              <label for="input-username" class="text-center col-xs-4 col-xs-offset-4 col-md-offset-4 col-md-4 col-lg-offset-0 col-lg-5 control-label">Phone Number</label>
	              <div class="col-lg-7">
	                <input type="text" class="form-control" id="input-username">
	              </div>
	            </div>
	            <div class="form-group">
	              <button type="submit" id="login-submit" class="col-xs-offset-2 col-xs-8 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-lg-offset-4 col-lg-4 btn btn-lg btn-primary">
	                Submit
	                <span class="glyphicon glyphicon-check"></span>
	              </button>
	              <img id="loading" alt="Loading" src="images/loading.gif" style="display: none;">
	              <span id="error" style="display: none;">That phone number is not yet in our system. Please sign up by clicking the button above!</span>
	            </div>
	          </div>
	        </div>
	      </div>
	      
	    </div> <!-- End Container -->
		
		<!-- JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    	<script src="js/jquery.maskedinput.js" type="text/javascript"></script>
		<script src="js/index.js"></script>
	</body>
</html>
