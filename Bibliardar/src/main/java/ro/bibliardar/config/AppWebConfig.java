package ro.bibliardar.config;

import java.util.Properties;

import org.apache.commons.dbcp.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration 
@ComponentScan("ro.bibliardar") 
@EnableWebMvc
@EnableTransactionManagement
@Import({ WebSocketConfig.class })
public class AppWebConfig extends WebMvcConfigurerAdapter 
{
	@Bean
    public SessionFactory sessionFactory() 
	{
        LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(dataSource());
        builder
        	.scanPackages("ro.bibliardar.users.model", "ro.bibliardar.variants.model")
            .addProperties(getHibernateProperties());

        return builder.buildSessionFactory();
    }

	private Properties getHibernateProperties() 
	{
        Properties prop = new Properties();
        prop.put("hibernate.format_sql", "true");
        prop.put("hibernate.show_sql", "true");
        prop.put("hibernate.dialect", "org.hibernate.dialect.MySQL5Dialect");
        return prop;
    }
	
	@Bean(name = "dataSource")
	public BasicDataSource dataSource() 
	{
		BasicDataSource ds = new BasicDataSource();
	    ds.setDriverClassName("com.mysql.jdbc.Driver");
		ds.setUrl("jdbc:mysql://localhost:3306/BibliardarDB");
		ds.setUsername("mrlradu");
		ds.setPassword("mrlradu");
		return ds;
	}
	
	@Bean
    public HibernateTransactionManager transactionManager() 
	{
        return new HibernateTransactionManager(sessionFactory());
    }

	@Bean
	public InternalResourceViewResolver viewResolver() 
	{
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/WEB-INF/pages/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) 
	{
	    registry.addResourceHandler("/resources/css/**").addResourceLocations("/resources/css/");
	    registry.addResourceHandler("/resources/images/**").addResourceLocations("/resources/images/");
	    registry.addResourceHandler("/resources/javascript/**").addResourceLocations("/resources/javascript/");
	}
	
	@Bean
	public RequestMappingHandlerMapping useTrailingSlash() 
	{
	    return new RequestMappingHandlerMapping() {{ setUseTrailingSlashMatch(true); }};
	}
}