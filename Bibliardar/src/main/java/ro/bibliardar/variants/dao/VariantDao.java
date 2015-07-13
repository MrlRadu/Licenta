package ro.bibliardar.variants.dao;

import java.util.List;

import ro.bibliardar.variants.model.Variant;

public interface VariantDao 
{
	public List<Variant> getVariants();

	public Variant getVariant(int id);

	public void addVariant(String q, String a1, String a2, String a3,String a4, String ac);
	
}