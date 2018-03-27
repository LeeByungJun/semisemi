package faq.model.vo;

import java.io.Serializable;

public class Faq implements Serializable{

	private static final long serialVersionUID = 1L;

	private int f_no;
	private String f_category;
	private String f_title;
	private String f_contents;
	
	public Faq() {
		
	}

	public Faq(int f_no, String f_category, String f_title, String f_contents) {
		super();
		this.f_no = f_no;
		this.f_category = f_category;
		this.f_title = f_title;
		this.f_contents = f_contents;
	}

	public int getF_no() {
		return f_no;
	}

	public void setF_no(int f_no) {
		this.f_no = f_no;
	}

	public String getF_category() {
		return f_category;
	}

	public void setF_category(String f_category) {
		this.f_category = f_category;
	}

	public String getF_title() {
		return f_title;
	}

	public void setF_title(String f_title) {
		this.f_title = f_title;
	}

	public String getF_contents() {
		return f_contents;
	}

	public void setF_contents(String f_contents) {
		this.f_contents = f_contents;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return this.f_no + ", " + this.f_category + ", " + this.f_title + ", " + this.f_contents;
	}
	
}
