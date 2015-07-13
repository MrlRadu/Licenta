package ro.bibliardar.config;

import java.util.List;

import org.springframework.context.annotation.Configuration;import org.springframework.messaging.converter.ByteArrayMessageConverter;
import org.springframework.messaging.converter.MessageConverter;
import org.springframework.messaging.converter.StringMessageConverter;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig extends AbstractWebSocketMessageBrokerConfigurer 
{
	@Override
	public void configureMessageBroker(MessageBrokerRegistry config) 
	{
		config.enableSimpleBroker("/topic");
		config.setApplicationDestinationPrefixes("/game", "/play");
	}

	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) 
	{
		registry.addEndpoint("/startChat").withSockJS();
		registry.addEndpoint("/startPracticeGame").withSockJS();
	}
	
	/*@Override
	public boolean configureMessageConverters(List<MessageConverter> messageConverters) {
	    messageConverters.add(new StringMessageConverter());
	    messageConverters.add(new ByteArrayMessageConverter());
	    return false;
	}*/
}