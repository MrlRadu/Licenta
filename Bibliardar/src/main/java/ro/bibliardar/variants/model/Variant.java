package ro.bibliardar.variants.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Variants")
public class Variant
{
	private Integer id;
	private String question;
	private String answer1;
	private String answer2;
	private String answer3;
	private String answer4;
	private Integer answerc;

	@Id@GeneratedValue
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() 
    {
        return id;
    }
 
    public void setId(Integer id) 
    {
        this.id = id;
    }
	
	@Column(name = "question", nullable = false, length = 300)
	public String getQuestion() 
	{
		return this.question;
	}

	public void setQuestion(String question) 
	{
		this.question = question;
	}

	@Column(name = "answer1", nullable = false, length = 100)
	public String getAnswer1() 
	{
		return this.answer1;
	}

	public void setAnswer1(String answer1) 
	{
		this.answer1 = answer1;
	}
	
	@Column(name = "answer2", nullable = false, length = 100)
	public String getAnswer2() 
	{
		return this.answer2;
	}

	public void setAnswer2(String answer2) 
	{
		this.answer2 = answer2;
	}
	
	@Column(name = "answer3", nullable = false, length = 100)
	public String getAnswer3() 
	{
		return this.answer3;
	}

	public void setAnswer3(String answer3) 
	{
		this.answer3 = answer3;
	}
	
	@Column(name = "answer4", nullable = false, length = 100)
	public String getAnswer4() 
	{
		return this.answer4;
	}

	public void setAnswer4(String answer4) 
	{
		this.answer4 = answer4;
	}
	
	@Column(name = "answerc", nullable = false)
	public Integer getAnswerc() 
	{
		return this.answerc;
	}

	public void setAnswerc(Integer answerc) 
	{
		this.answerc = answerc;
	}
	
	public String toString()
	{
		return id + ". " + question + "\n[" + answer1 + ", " + answer2 + ", " + answer3  + ", " + answer4 + "]\nCorect: " + answerc;     
	}

}
