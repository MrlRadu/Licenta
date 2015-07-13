<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<!DOCTYPE html>
<html lang="ro">
<head>
  <title>Bibliardar - Practice Game</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="../resources/css/style.css">
  <link rel="stylesheet" href="../resources/css/game.css">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

  <script src="../resources/javascript/sockjs-0.3.4.js"></script>
  <script src="../resources/javascript/stomp.js"></script>
  
<script type="text/javascript">

var stompClient = null;

function setConnected(connected) 
{
	document.getElementById('connect').disabled = connected;
	document.getElementById('connect').style.visibility = !connected ? 'visible' : 'hidden';
	document.getElementById('gameForm').style.position = !connected ? 'absolute' : 'relative';
	document.getElementById('gameForm').style.visibility = connected ? 'visible' : 'hidden';
	document.getElementById('navPracticeGame').style.visibility = connected ? 'visible' : 'hidden';
	
	corectAnswers.innerHTML = 0;
	noQuestions.innerHTML = 0;
}

function connect() 
{
	var socket = new SockJS('/bibliardar/startPracticeGame');
	stompClient = Stomp.over(socket);
	stompClient.connect({}, function(frame) 
	{
		setConnected(true);
		console.log('Connected: ' + frame);
		
		getVariant(0);
		
		stompClient.subscribe('/topic/showVariant', function(calResult)
		{
			showVariant(JSON.parse(calResult.body));
		});
		
		stompClient.subscribe('/topic/showAnswer', function(calResult)
		{
			showAnswer(JSON.parse(calResult.body));
		});
	});
}

function disconnect() 
{
	if (stompClient != null) 
	{
		stompClient.disconnect();
		setConnected(false);
		console.log('Disconnected');
	}
}

function getVariant(wait)
{
	stompClient.send("/game/getVariant", {}, wait);
}
        
function showVariant(variant) 
{
	question.value = variant.question;
	answer1.innerHTML = variant.answer1;
	answer2.innerHTML = variant.answer2;
	answer3.innerHTML = variant.answer3;
	answer4.innerHTML = variant.answer4;
	
	document.getElementById('nextBtn').style.visibility = 'hidden';
	showNormal();
	btnEnable();
}
        
function verifyAnswer(no)
{	
	stompClient.send("/game/verifyAnswer", {}, no);
}

function showAnswer(ok)
{
	btnDisable();
	if(ok[0] == 1)
	{
		// user answered correctly
		showCorectAnswer(ok[1]);
		corectAnswers.innerHTML = parseInt(corectAnswers.innerHTML) + 1;
	}
	else
	{
		// user answered incorrectly
		showWrongAnswer(ok[1]);
		showCorectAnswer(ok[2]);
	}
	
	document.getElementById('nextBtn').style.visibility = 'visible';
	noQuestions.innerHTML = parseInt(noQuestions.innerHTML) + 1;
}

function showCorectAnswer(no)
{
	if(no == 1)
		document.getElementById("answer1").setAttribute('class', 'btn-playC');
	else if(no == 2)
		document.getElementById("answer2").setAttribute('class', 'btn-playC');
	else if(no == 3)
		document.getElementById("answer3").setAttribute('class', 'btn-playC');
	else if(no == 4)
		document.getElementById("answer4").setAttribute('class', 'btn-playC');	
}

function showWrongAnswer(no)
{
	if(no == 1)
		document.getElementById("answer1").setAttribute('class', 'btn-playW');
	else if(no == 2)
		document.getElementById("answer2").setAttribute('class', 'btn-playW');
	else if(no == 3)
		document.getElementById("answer3").setAttribute('class', 'btn-playW');
	else if(no == 4)
		document.getElementById("answer4").setAttribute('class', 'btn-playW');	
}

function showNormal()
{
	document.getElementById("answer1").setAttribute('class', 'btn-playN');
	document.getElementById("answer2").setAttribute('class', 'btn-playN');
	document.getElementById("answer3").setAttribute('class', 'btn-playN');
	document.getElementById("answer4").setAttribute('class', 'btn-playN');	
}

function btnEnable()
{
	document.getElementById('answer1').removeAttribute('disabled');
	document.getElementById('answer2').removeAttribute('disabled');
	document.getElementById('answer3').removeAttribute('disabled');
	document.getElementById('answer4').removeAttribute('disabled');
}
function btnDisable()
{
	document.getElementById('answer1').disabled = 'true';
	document.getElementById('answer2').disabled = 'true';
	document.getElementById('answer3').disabled = 'true';
	document.getElementById('answer4').disabled = 'true';
}


window.onbeforeunload = function()
{
	if(stompClient != null)
	{
		
		disconnect();
	}
}

</script>

</head>
<body>

  <img src="../resources/images/bg.png" id="full-screen-background-image" alt="BibliardarBackground" />

  <nav class="navbar navbar-inverse">
	<div class="container-fluid">
	  <div class="navbar-header">
		<a class="navbar-brand" href="http://localhost:8080/bibliardar/">Bibliardar</a>
	  </div>
	  
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
		<li class="active"><a style="cursor: pointer;"><span class="glyphicon glyphicon-user"></span> ${pageContext.request.userPrincipal.name}</a></li>
      </ul>
      
      <ul id="navPracticeGame" class="nav navbar-nav navbar-right">
		<li><a style="cursor: pointer;"> Corect answers: <span id="corectAnswers"></span>/<span id="noQuestions"></span></a></li>
		<li><a href="javascript:disconnect()"><span class="glyphicon glyphicon-remove"></span></a></li>
	  </ul>
    </div>
  </div>
</nav>

	<div class="div-btn-play">
	  <div class="div-btn-play-centered">
		<button id="connect" class="btn-play" onclick="connect();">START</button>
	  </div>
	</div>

    
	<div class="center" id="gameForm"> 
	  <div class="container-fluid" id="game">

		<form role="form">
		  <div class="form-group">
			<textarea id="question" class="form-control" readonly="readonly" rows="3"></textarea>
		  </div>
		</form>
	
		<div class="pull-left" style="width: 50%">
			<button id="answer1" class="btn-playN" name="BibliardarV1" onclick="verifyAnswer(1);"> <strong style="vertical-align:middle"></strong> </button>
			<button id="answer3" class="btn-playN" name="BibliardarV3" onclick="verifyAnswer(3);"> <strong style="vertical-align:middle"></strong> </button>
		</div>

		<div class="pull-right text-right" style="width: 50%;">
			<button id="answer2" class="btn-playN" name="BibliardarV2" onclick="verifyAnswer(2);"> <strong style="vertical-align:middle"></strong> </button>
			<button id="answer4" class="btn-playN" name="BibliardarV4" onclick="verifyAnswer(4);"> <strong style="vertical-align:middle"></strong> </button>
		</div>
		<div style="clear: both"></div><br>

		<div class="centerBtn">
			<button id="nextBtn" class="btn-Next" name="BibliardarNext" onclick="getVariant(1000);"> <strong style="vertical-align:middle">NEXT</strong> </button>
		</div>
	  </div>
	  
	</div>
	
</body>
</html>
