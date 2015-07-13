<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
</head>

<body>

  <img src="resources/images/bg.png" id="full-screen-background-image" alt="BibliardarBackground" />

<div class="div-btn-403">
  <div class="div-btn-403-centered">
  <h1>HTTP Status 403 - Access is denied</h1>

  <c:choose>
	<c:when test="${empty username}">
	  <h2>You do not have permission to access this page!</h2>
	</c:when>
	<c:otherwise>
	  <h2>Username : ${username} <br/>You do not have permission to access this page!</h2>
	</c:otherwise>
  </c:choose>
  </div>
  </div>

</body>
</html>