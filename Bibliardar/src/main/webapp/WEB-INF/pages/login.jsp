<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<!DOCTYPE html>
<html lang="ro">
<head>
  <title>Bootstrap Case</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="resources/css/style.css">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head>

<body>

  <img src="resources/images/bg.png" id="full-screen-background-image" alt="BibliardarBackground" />

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="http://localhost:8080/bibliardar/">Bibliardar</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="http://localhost:8080/bibliardar/">Home</a></li>
        <li><a href="http://localhost:8080/bibliardar/play/">Play</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <!-- <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li> -->
		<li class="divider-vertical"></li>
		<li class="dropdown">
			<a class="dropdown-toggle" href="#" data-toggle="dropdown"><span class="glyphicon glyphicon-log-in"></span> Log In <strong class="caret"></strong></a>
			<div class="dropdown-menu" style="padding: 20px; padding-bottom: 20px;">
				<form name="loginForm" action="<c:url value='/login' />" method="post"> 
					Username:<br> 
					<input type="text" name="username" value="" /><br><br> 
					Password:<br> 
					<input type="password" name="password" value="" /><br><br> 
					<input type="submit" class="btn btn-info" value="Log In" /> 
				
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form> 
			</div>
		</li>
	  </ul>
    </div>
  </div>
</nav>

  <div class="container" style="margin-top:30px">
	<div class="col-md-4 col-md-offset-4">
      <div class="panel panel-default">
		<div class="panel-heading"><h3 class="panel-title"><strong>Log In </strong></h3></div>
		
		  <c:if test="${not empty error}">
			<div class="alert alert-danger alert-error">
			  <a href="#" class="close" data-dismiss="alert">&times;</a>
			  <strong>${error}</strong> 
			</div>
		  </c:if>
		  <c:if test="${not empty msg}">
			<div class="alert alert-warning alert-dismissable">
			  <a href="#" class="close" data-dismiss="alert">&times;</a>
			  <strong>${msg}</strong> 
			</div>
		  </c:if>
		 
		<div class="panel-body">
		  <form role="form" name="loginForm" action="<c:url value='/login' />" method="post"> 
			<div class="form-group">
			  <label for="exampleInputEmail1">Username</label>
			  <input type="text" name="username" class="form-control" id="exampleInputUsername1" placeholder="Username">
			</div>
			<div class="form-group">
			  <label for="exampleInputPassword1">Password <!-- <a href="/sessions/forgot_password">(forgot password)</a>  --></label>
			  <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
			</div>
			<button type="submit" class="btn btn-sm btn-default">Log in</button>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		  </form>
		</div>
	  </div>
	</div>
  </div>

  <div id="rights">&copy; Copyright 2015 Bibliardar. Toate drepturile rezervate.</div>

</body>
</html>
