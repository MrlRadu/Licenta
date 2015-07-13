<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<!DOCTYPE html>
<html lang="ro">
<head>
  <title>Bibliardar</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="resources/css/style.css">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  <script src="resources/javascript/main.js"></script>

</head>
<body>

  <c:url value="/logout" var="logoutUrl" />
  <form action="${logoutUrl}" method="post" id="logoutForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  </form>
	
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
        <%-- <c:if test="${pageContext.request.isUserInRole('ROLE_ADMIN')}">
          <li><a href="http://localhost:8080/bibliardar/adm/CreateVariants">Administrator</a></li>
        </c:if> --%>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<c:choose>
		  <c:when test="${pageContext.request.userPrincipal.name == null}">
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
		  </c:when>
			<c:otherwise>
			  <li><a href=""><span class="glyphicon glyphicon-user"></span> ${pageContext.request.userPrincipal.name}</a></li>
			  <li><a href="javascript:formLogOut()"><span class="glyphicon glyphicon-log-out"></span> Log Out </a></li>
			</c:otherwise>
		</c:choose>
	  </ul>
    </div>
  </div>
</nav>
<div class="container-fixed">
  <div class="div-btn-play">
	<div class="div-btn-play-centered">
	  <form name="playForm" action="<c:url value='/play' />" method="get"> 
		<button class="btn-play" name="Bibliardar" type="submit"><span class="glyphicon glyphicon-play-circle" style="vertical-align:middle"></span> <strong style="vertical-align:middle">Play</strong> </button>
	  </form>
	</div>
  </div>
</div>

  <div id="rights">&copy; Copyright 2015 Bibliardar. Toate drepturile rezervate.</div>

</body>
</html>
