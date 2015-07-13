package ro.bibliardar.web.controller;

import java.security.Principal;

import javax.websocket.Session;

import org.springframework.messaging.converter.MessageConversionException;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;


@Controller
public class ChatController
{
	@MessageMapping("/addUserInBookOfLife")
	@SendTo("/topic/showUsersInBookOfLife")
	public void addUserInBookOfLife(Session session) throws Exception, MessageConversionException
	{
		//Session session = headerAccessor.getSessionId();
		//Map<String, Object> attrs = headerAccessor.getSessionAttributes();
		
		//ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		//HttpSession session = attrs.getRequest().getSession();
		//HttpSession session = request.getSession();
		//HttpSession session = request.getSession(true);
		System.out.println("userSession: " + session.getId());
		System.out.println("///////////////////////////////////////////////////////");
		System.out.println("addUsersInBookOfLife");
		System.out.println("///////////////////////////////////////////////////////");
		
		//chatroomUsers.add(sessionId);
	}
	
	@MessageMapping("/sendMessage")
	@SendTo("/topic/showMessage")
	public String sendMessage(SimpMessageHeaderAccessor headerAccessor, String message)
	{
		Principal userPrincipal = headerAccessor.getUser();
		String msg = userPrincipal.getName() + ": " + message;
		
		return msg;
	}
	
//	@MessageMapping("/addUserInBookOfLife")
//	@SendTo("/topic/showUsersInBookOfLife")
//	public void addUserInBookOfLife(SimpMessageHeaderAccessor headerAccessor) throws Exception
//	{
//		String sessionId = headerAccessor.getSessionId();
//		//Map<String, Object> attrs = headerAccessor.getSessionAttributes();
//		//HttpSession session = request.getSession();
//
//		System.out.println("userSession: " + sessionId);
//		System.out.println("///////////////////////////////////////////////////////");
//		System.out.println("addUsersInBookOfLife");
//		System.out.println("///////////////////////////////////////////////////////");
//		
//		chatroomUsers.add(sessionId);
//	}
}
	
//	@MessageMapping(value = { "/addUserInBookOfLife" })
//	public void addUserInBookOfLife() throws Exception
//	{
//		System.out.println("///////////////////////////////////////////////////////");
//		System.out.println("addUsersInBookOfLife");
//		System.out.println("///////////////////////////////////////////////////////");
//		
//		//chatroomUsers.add(userSession);
//	}	
//	//	Iterator<Session> iterator = chatroomUsers.iterator();
//	//	while (iterator.hasNext())
//	//		(iterator.next()).getBasicRemote().sendText(buildJsonUsersData());
//	//}
	
	/*private Set<String> getUserNames()
	{
		HashSet<String> returnSet = new HashSet<String>();
		Iterator<Session> iterator = chatroomUsers.iterator();
		while (iterator.hasNext())
			returnSet.add(iterator.next().getUserProperties().get("username").toString());
		
		return returnSet;
	}
	
	private String buildJsonUsersData()
	{
		Iterator<String> iterator = getUserNames().iterator();
		JsonArrayBuilder jsonArrayBuilder = Json.createArrayBuilder();
		while (iterator.hasNext())
			jsonArrayBuilder.add((String)iterator.next());

		return Json.createObjectBuilder().add("users", jsonArrayBuilder).build().toString();
	}
}*/