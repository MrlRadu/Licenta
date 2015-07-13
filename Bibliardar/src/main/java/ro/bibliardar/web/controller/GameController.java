//package ro.bibliardar.web.controller;
//
//import java.util.List;
//
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import ro.bibliardar.variants.model.Variant;
//import ro.bibliardar.variants.service.VariantsService;
//
//
//@Controller
//public class GameController 
//{
//	@Autowired
//	private VariantsService variantsService;
//	
//	@RequestMapping(value = { "/getVariants" }, method = RequestMethod.GET)
//	public @ResponseBody List<Variant> getVariants() 
//	{		
//		List<Variant> variants = variantsService.getVariants();
//		
//		for(int i=0; i<variants.size(); i++)
//		{
//			System.out.println(variants.get(i));		
//		}
//			
//		return variants;
//	}
//
//}