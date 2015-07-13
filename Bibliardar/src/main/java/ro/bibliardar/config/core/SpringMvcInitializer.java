package ro.bibliardar.config.core;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import ro.bibliardar.config.AppWebConfig;

public class SpringMvcInitializer extends AbstractAnnotationConfigDispatcherServletInitializer 
{
	@Override
	protected Class<?>[] getRootConfigClasses() 
	{
		return new Class[] { AppWebConfig.class };
	}

	@Override
	protected Class<?>[] getServletConfigClasses() 
	{
		return null;
	}

	@Override
	protected String[] getServletMappings() 
	{
		return new String[] { "", "/" };
	}
	
}