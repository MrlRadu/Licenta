<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html xmlns:th>
<head>
  <title>Bibliardar Play</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="resources/css/style.css">
  <link rel="stylesheet" href="resources/css/play.css">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  <script src="resources/javascript/sockjs-0.3.4.js"></script>
  <script src="resources/javascript/stomp.js"></script>
  <script src="resources/javascript/main.js"></script>
  
  <script>

  var stompClient = null;
   
  connect();

  function connect() 
  {
	var socket = new SockJS('/bibliardar/startChat');
  	stompClient = Stomp.over(socket);
  	stompClient.connect({}, function(frame) 
  	{
  		//addUser();
  		console.log('Connected: ' + frame);
  		
  		stompClient.subscribe('/topic/showMessage', function(calResult)
		{
			showMessage(calResult.body);
		});
  		
  		/* stompClient.subscribe('/topic/showUsersInBookOfLife', function(calResult)
  		{
  			showUsersInBookOfLife(calResult.body);
  		}); */
  		
  	});
  }

  /* function addUser()
  {
  	stompClient.send("/play/addUserInBookOfLife", {}, {});
  }
          
  function showUsersInBookOfLife(username) 
  {
	alert("ceva: " + username);
  } */
  
  function sendMessage()
  {
	  stompClient.send("/play/sendMessage", {}, messageText.value);
	  messageText.value = "";
  }
  
  function showMessage(message)
  {
	  messagesTextArea.value += message + "\n";
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
  </script>
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
        <li><a href="http://localhost:8080/bibliardar/">Home</a></li>
        <li class="active"><a href="http://localhost:8080/bibliardar/play/">Play</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	 <li id="username"><a href=""><span class="glyphicon glyphicon-user"></span> ${pageContext.request.userPrincipal.name}</a></li>
		 <li><a href="javascript:formLogOut()"><span class="glyphicon glyphicon-log-out"></span> Log Out </a></li>
	  </ul>
    </div>
  </div>
</nav>

<!-- <textarea id="messagesTextArea" readonly="readonly" rows="10" cols="45"></textarea>
		<textarea id="usersTextArea" readonly="readonly" rows="10" cols="10"></textarea><br/>
		<input type="text" id="messageText" size="50" />
		<input type="button" value="Send" onclick="sendMessage();" /> -->

<div class="container" style="width:100%;">
        <div class="col-md-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-comment"></span> Bibliardar Chat
                    <div class="btn-group pull-right">
                        <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                            <span class="glyphicon glyphicon-chevron-down"></span>
                        </button>
                        <ul class="dropdown-menu slidedown">
 
                            <li><a href=""><span class="glyphicon glyphicon-ok-sign">
                            </span>Available</a></li>
                            <li class="divider"></li>
                            <li><a href=""><span class="glyphicon glyphicon-off"></span>
                                Sign Out</a></li>
                        </ul>
                    </div>
				</div>
                <div class="panel-body">
                    <ul class="chat">
                        <%-- <li>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <strong class="pull-left primary-font">Mihai Cuciureanu:</strong>
                                </div>
                                <p>
                                    &nbsp;Salut, ai terminat cu licenta?
                                </p>
                            </div>
                        </li>
                        <li>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <strong class="pull-left primary-font">Radu Muntean:</strong>
                                </div>
                                <p>
                                    &nbsp;Salut, inca nu, acum imi scriu documentatia si mai fac ultimele retusuri.
                                </p>
                            </div>
                        </li>
                       <li th:each="message : ${messages}">
                        	<div class="chat-body clearfix">
								<div class="header">
									<strong class="pull-left primary-font"></strong>
								</div>
								<p th:text="${message.text}"></p>
							</div>
						</li> --%>
           <!--  <form th:action="@{/users/doDelete/}" th:object="${customer}" method="post">
                <button type="submit">Delete</button>
            </form>	 -->		
                    </ul>
                </div>
                
				<div class="panel-footer">
                    <div class="input-group"> <!-- <input id="btn-input" -->
                        <input id="messageText" type="text" class="form-control input-sm" placeholder="Type your message here..." />
                        <span class="input-group-btn">
                            <button class="btn btn-warning btn-sm" id="btn-chat" onclick="sendMessage();">Send</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        
		<div class="col-md-4" id="col-table">
			<div class="panel panel-primary">
                <div class="panel-heading text-center">
                    <span class="glyphicon glyphicon-book"></span> 
                    The Book of Life
                    <span class="glyphicon glyphicon-book gly-flip-horizontal"></span> 
                </div>
                <div class="panel-body" id="panel-table">
              

<!-- <div class="div-table-content">
    <table class="table table-condensed">
            <tr>
            	<td>Catalin Cimpean</td>
            	<td>Matei Andreica</td>
            </tr>
            <tr>
                <td>Mihai Cuciureanu</td>
                <td>Radu Muntean</td>
            </tr>
    </table>
</div> -->
                </div>
            </div>
        </div>
	
		
		<div class="col-md-4">
			<div class="btn-group-vertical" role="group" aria-label="...">
				<form name="playForm" action="<c:url value='/play/PracticeRoom' />" method="get"> 
					<button class="btn-playS" name="Bibliardar" type="submit"> <strong style="vertical-align:middle">Play for Practice</strong> </button>
	  			</form>
	  			
	  			<form name="playForm" action="<c:url value='/play/GameRoom' />" method="get"> 
					<button class="btn-playS" name="Bibliardar" type="submit"> <strong style="vertical-align:middle">Play with Friends</strong> </button>
	  			</form>
			</div>
		</div>
</div>

  <div id="rights">&copy; Copyright 2015 Bibliardar. Toate drepturile rezervate.</div>
  
</body>
</html>