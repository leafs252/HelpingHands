<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Sign Up</title>
  
  <!-- FONTS -->
  <link href='http://fonts.googleapis.com/css?family=Raleway:500,700,400,300' rel='stylesheet'>
  
  <!-- STYLESHEETS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="stylesheets/main.css">
</head>
	<body>
		
<!-- 		Name <input id="name" type="text"><br> -->
<!-- 		Phone number <input id="phoneNumber" type="text" placeholder="format text input like a number?"><br> -->
<!-- 		Email <input id="email" type="text"><br> -->
<!-- 		<input id="submit" type="button" value="Submit!"> -->
<!-- 		<img id="loading" alt="Loading" src="images/loading.gif" style="display: none;"> -->

		<div class="container-fluid sign-up">
	      <div class="row">
	        <div class="col-lg-4 left-container">
	          <h1 class="text-center">Fridgeway Baptist Church</h1>
	          <div class="row">
	            <div class="text-center col-lg-offset-1 col-lg-10 information">
	              <p>This is the Volunteering and Help community board for the Fridgeway Baptist Church. Everyone is welcome to join!</p>
	            </div>
	          </div>
	        </div>
	        <div class="col-lg-6 col-lg-offset-1 right-container">
	          <h2 class="text-center">Sign Up!</h2>
	          
	          <div class="form-horizontal" >
	            <div class="form-group">
	              <label for="name" class="text-center col-xs-4 col-xs-offset-4 col-md-offset-4 col-md-4 col-lg-offset-2 col-lg-3 control-label">Name</label>
	              <div class="col-lg-5">
	                <input type="text" class="form-control" id="input-name">
	                <span id="name-valid" style="display: none;">Please put in your name here so people know who you are!</span>
	              </div>
	            </div>
	            
	            <hr>
	            
	            <div class="form-group">
	              <label for="phoneNumber" class="text-center col-xs-offset-4 col-xs-4 col-lg-offset-1 col-lg-4 control-label">Phone Number</label>
	              <div class="col-lg-5">
	                <input type="text" class="form-control" id="input-phoneNumber">
	                <span id="phoneNumber-valid" style="display: none;">Please put in your phone number here so people can contact you to help!</span>
	              </div>
	            </div>
	            
	            <hr>
	            
	            <div class="form-group">
	              <label for="email" class="text-center col-xs-offset-4 col-xs-4 col-lg-offset-1 col-lg-4 control-label">Email (Optional)</label>
	              <div class="col-lg-5">
	                <input type="text" class="form-control" id="input-email">
	              </div>
	            </div>
	            
	            <hr>
	            
	            <div class="form-group">
	              <button type="submit" id="login-submit" class="col-xs-offset-2 col-xs-8 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-lg-offset-4 col-lg-4 btn btn-lg btn-primary">
	                Submit
	                <span class="glyphicon glyphicon-check"></span>
	              </button>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div> <!-- End Container -->
		
		<!-- JS -->
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>	
	    <script src="js/jquery.maskedinput.js" type="text/javascript"></script>
		<script src="js/signup.js"></script>
	</body>

</html>
