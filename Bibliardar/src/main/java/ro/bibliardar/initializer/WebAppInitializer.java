package ro.bibliardar.initializer;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import ro.bibliardar.config.AppWebConfig;

public class WebAppInitializer implements WebApplicationInitializer 
{
	public void onStartup(ServletContext servletContext) throws ServletException 
	{  
        AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();  
        ctx.register(AppWebConfig.class);  
        ctx.setServletContext(servletContext); 
        
        Dynamic dynamic = servletContext.addServlet("web-dispatcher", new DispatcherServlet(ctx));  
        dynamic.addMapping("/");  
        dynamic.setLoadOnStartup(1);  
        dynamic.setAsyncSupported(true);
   }  
} 