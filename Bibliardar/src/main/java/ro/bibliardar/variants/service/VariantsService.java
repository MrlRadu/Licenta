package ro.bibliardar.variants.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ro.bibliardar.variants.model.Variant;
import ro.bibliardar.variants.dao.VariantDao;

@Service("variantDetailsService")
@Transactional
public class VariantsService
{
	@Autowired
	private VariantDao variantDAO;

	public List<Variant> getVariants() 
	{
		return variantDAO.getVariants();
	}

	public Variant getVariant(int id) 
	{
		return variantDAO.getVariant(id);
	}

	public void addVariant(String q, String a1, String a2, String a3, String a4, String ac) 
	{
		variantDAO.addVariant(q, a1, a2, a3, a4, ac);
	}

}