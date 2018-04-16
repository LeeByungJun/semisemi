package grade.model.vo;

import java.io.Serializable;

public class Grade implements Serializable{

	private static final long serialVersionUID = 19L;
	
	private String g_code;
	private String g_rank;
	private int g_rate;
	private String g_comment;
	private String g_comment2;
	
	public Grade() {}

	public Grade(String g_code, String g_rank, int g_rate, String g_comment, String g_comment2) {
		super();
		this.g_code = g_code;
		this.g_rank = g_rank;
		this.g_rate = g_rate;
		this.g_comment = g_comment;
		this.g_comment2 = g_comment2;
	}

	public String getG_code() {
		return g_code;
	}

	public void setG_code(String g_code) {
		this.g_code = g_code;
	}

	public String getG_rank() {
		return g_rank;
	}

	public void setG_rank(String g_rank) {
		this.g_rank = g_rank;
	}

	public int getG_rate() {
		return g_rate;
	}

	public void setG_rate(int g_rate) {
		this.g_rate = g_rate;
	}

	public String getG_comment() {
		return g_comment;
	}

	public void setG_comment(String g_comment) {
		this.g_comment = g_comment;
	}
	
	public String getG_comment2() {
		return g_comment2;
	}

	public void setG_comment2(String g_comment2) {
		this.g_comment2 = g_comment2;
	}

	@Override
	public String toString() {
		return this.g_code + ", " + this.g_rank + ", " + this.g_rate + ", " + this.g_comment + ", " + this.g_comment2;
	}
	
	
}