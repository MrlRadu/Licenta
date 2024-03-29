package ro.bibliardar.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController 
{
	@RequestMapping(value = { "/", "/index**", "/welcome**" }, method = RequestMethod.GET)
	public ModelAndView defaultPage() 
	{
		ModelAndView model = new ModelAndView();
		model.setViewName("index");
		return model;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request) 
	{
		// Verify if the user is logged in
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) 
		{
		    return new ModelAndView("forward:/index");
		}
		
		ModelAndView model = new ModelAndView();
		if (error != null) 
		{
			model.addObject("error", getErrorMessage(request, "SPRING_SECURITY_LAST_EXCEPTION"));
		}

		if (logout != null) 
		{
			model.addObject("msg", "You've been logged out successfully.");
		}
		
		model.setViewName("login");

		return model;
	}
	
	@RequestMapping(value = "/singup", method = RequestMethod.GET)
	public ModelAndView signup(@RequestParam(value = "error", required = false) String error, HttpServletRequest request) 
	{
		// Verify if the user is logged in
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) 
		{
		    return new ModelAndView("forward:/index");
		}
		
		ModelAndView model = new ModelAndView();
		if (error != null) 
		{
			model.addObject("error", getErrorMessage(request, "SPRING_SECURITY_LAST_EXCEPTION"));
		}
		
		model.setViewName("index");

		return model;
	}
	
	@RequestMapping(value = "/play**", method = RequestMethod.GET)
	public ModelAndView adminPage() 
	{
		ModelAndView model = new ModelAndView();
		model.setViewName("play");

		return model;
	}
	
	@RequestMapping(value = "/play/PracticeRoom**", method = RequestMethod.GET)
	public ModelAndView playForPracticePage() 
	{
		ModelAndView model = new ModelAndView();
		model.setViewName("game/practice");

		return model;
	}
	
	@RequestMapping(value = "/adm/CreateVariants**", method = RequestMethod.GET)
	public ModelAndView admCreateVariants() 
	{
		ModelAndView model = new ModelAndView();
		model.setViewName("adm/createVariants");

		return model;
	}

	// customize the error message
	private String getErrorMessage(HttpServletRequest request, String key) 
	{
		Exception exception = (Exception) request.getSession().getAttribute(key);

		String error = "";
		if (exception instanceof BadCredentialsException) 
		{
			error = "Invalid username or password!";
		} 
		else if (exception instanceof LockedException) 
		{
			error = exception.getMessage();
		} 
		else 
		{
			error = "Invalid username or password!";
		}

		return error;
	}

	// for 403 access denied page
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied() 
	{
		ModelAndView model = new ModelAndView();

		// check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) 
		{
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);

			model.addObject("username", userDetail.getUsername());
		}

		model.setViewName("403");
		return model;
	}
	
}