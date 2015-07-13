package ro.bibliardar.web.controller;

import java.util.List;import java.util.Random;

import org.apache.commons.lang.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;



import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;

import ro.bibliardar.variants.model.Variant;
import ro.bibliardar.variants.service.VariantsService;

@Controller
public class WebSocketController 
{
	@Autowired
	private VariantsService variantsService;
	
	private Variant variant = new Variant();
	private int[] randVariants;	
	
	@MessageMapping("/getVariant")
    @SendTo("/topic/showVariant")
	public Variant getVariant(int wait) throws Exception 
	{
		List<Variant> variants = null;
		Thread.sleep(wait);

		if(wait == 0 || randVariants.length == 0)
		{
			variants = variantsService.getVariants();
			
			System.out.println("Lista cu id-ul variantelor: ");
			for(int i=0; i<variants.size(); i++)
			{
				variant = variants.get(i);
				System.out.println(variant.getId() + " ");
			}
			
			
			randVariants = new int[variants.size()];
			System.out.println("Lvariants: " + variants.size());
			System.out.println("LrandVariants: " + randVariants.length);
			for(int i=0; i<randVariants.length; i++)
				randVariants[i] = i + 1;
		}

		int r = new Random().nextInt(randVariants.length);
		r = randVariants[r];

		variant = variantsService.getVariant(r);
		randVariants =(int[])ArrayUtils.removeElement(randVariants, r);
		
		return variant;
    }
	
	@MessageMapping("/verifyAnswer")
    @SendTo("/topic/showAnswer")
	public int[] verifyAnswer(int no) throws Exception 
	{
		int[] ok = new int[3];
		
		// the answer is (true / false)
		if(variant.getAnswerc().equals(no))
			ok[0] = 1;
        else
        	ok[0] = 0;
		
		// user choice
		ok[1] = no;
		
		// corect choice
		ok[2] = variant.getAnswerc();
		
		return ok;
    }
	
	@RequestMapping(value = { "/addVariant" }, method = RequestMethod.GET)
	@ResponseStatus(value = HttpStatus.OK)
	public void addVariant(@RequestParam("question") String q,
			@RequestParam("answer1") String a1,
			@RequestParam("answer2") String a2,
			@RequestParam("answer3") String a3,
			@RequestParam("answer4") String a4,
			@RequestParam("answerc") String ac) throws Exception
	{
		if (q=="" || a1=="" || a2=="" || a3=="" || a4=="") 
		{
			throw new Exception();
		}
		if (ac=="")
		{
			throw new Exception();
		}
		else
		{
			variantsService.addVariant(q, a1, a2, a3, a4, ac);
		}
	}
	
}
