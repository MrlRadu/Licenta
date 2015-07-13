<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<!DOCTYPE html>
<html lang="ro">
<head>
  <title>Bibliardar - Create Variants</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="../resources/css/style.css">
  <link rel="stylesheet" href="../resources/css/adm.css">
  <link rel="stylesheet" href="../resources/css/bootstrap-select.min.css">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  <script src="../resources/javascript/bootstrap-select.min.js"></script>
  <script src="../resources/javascript/main.js"></script>
  <script>
  function addVariant()
  {		 
		$.ajax({
				type: "GET",
				url:"/bibliardar/addVariant",
				data: 
				{ 
					'question': question.value,
					'answer1': answer1.innerHTML,
					'answer2': answer2.innerHTML,
					'answer3': answer3.innerHTML,
					'answer4': answer4.innerHTML,
					'answerc': answerc.options[answerc.selectedIndex].value,
			    },
			    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success:function(result)
				{
					alert("The variant was successfully added!")
	            },
                error: function(xhr,err)
                {
                	alert("You must complete all fields and select a correct answer!");
                }});
	 }
  </script>
</head>
<body>

  <c:url value="/logout" var="logoutUrl" />
  <form action="${logoutUrl}" method="post" id="logoutForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  </form>
	
  <img src="../resources/images/bg.png" id="full-screen-background-image" alt="BibliardarBackground" />

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
        <li><a href="http://localhost:8080/bibliardar/">Home</a></li>
        <li class="active"><a href="http://localhost:8080/bibliardar/adm/CreateVariants">Administrator</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
		<li><a href=""><span class="glyphicon glyphicon-user"></span> ${pageContext.request.userPrincipal.name}</a></li>
		<li><a href="javascript:formLogOut()"><span class="glyphicon glyphicon-log-out"></span> Log Out </a></li>
	  </ul>
    </div>
  </div>
</nav>

	<div class="center" id="gameForm"> 
	  <div class="container-fluid" id="game">
		
		<c:if test="${not empty error}">
			<div class="alert alert-danger alert-error">
			  <a href="#" class="close" data-dismiss="alert">&times;</a>
			  <strong>${error}</strong> 
			</div>
		  </c:if>
		  
		<div class="centerBtn">
			<h2> Create a new Variant </h2>
		</div>

		<form role="form">
		  <div class="form-group">
			<textarea id="question" class="form-control" rows="3" placeholder="write a question"></textarea>
		  </div>
		</form>
	
		<div class="pull-left" style="width: 50%">
			<textarea id="answer1" class="btn-playN" rows="3" placeholder="write the first choice"></textarea>
			<textarea id="answer3" class="btn-playN" rows="3" placeholder="write the second choice"></textarea>
		</div>

		<div class="pull-right text-right" style="width: 50%;">
			<textarea id="answer2" class="btn-playN" rows="3" placeholder="write the third choice"></textarea>
			<textarea id="answer4" class="btn-playN" rows="3" placeholder="write the fourth choice"></textarea>
		</div>
		<div style="clear: both"></div><br>

		<div class="centerBtn">
			<div class="form-group">
 				<select id="answerc" class="selectpicker" title="Which choice is the correct answer?" data-style="btn-success" data-width="270px">
					<option></option>
					<option value="1">first choice is the answer</option>
					<option value="2">second choice is the answer</option>
					<option value="3">third choice is the answer</option>
					<option value="4">fourth choice is the answer</option>
				</select>
 			</div>
			<button id="submitBtn" class="btn-Submit" name="BibliardarCreateNewVariant" onclick="addVariant();"> <strong style="vertical-align:middle">CREATE</strong></button>
		</div>
	  </div>
	  
	</div>
	
</body>
</html>
