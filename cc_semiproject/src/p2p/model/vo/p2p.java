package p2p.model.vo;

import java.sql.Date;

public class p2p implements java.io.Serializable {
	private static final long serialVersionUID = 22L;
	
	public p2p() {
		// TODO Auto-generated constructor stub
	}
	
	private int p_num;
	private int p_board;
	private Date p_sysdate;
	private String p_title;
	private String p_context;
	private String p_original_filename;
	private String p_rename_filename;
	private String p_image;
	private int mem_num;
	private String g_code;
	private String name;
	private String email;
	
	public p2p(int p_num, int p_board, Date p_sysdate, String p_title, String p_context, String p_original_filename,
			String p_rename_filename, String p_image, int mem_num, String g_code,String name,String email) {
		super();
		this.p_num = p_num;
		this.p_board = p_board;
		this.p_sysdate = p_sysdate;
		this.p_title = p_title;
		this.p_context = p_context;
		this.p_original_filename = p_original_filename;
		this.p_rename_filename = p_rename_filename;
		this.p_image = p_image;
		this.mem_num = mem_num;
		this.g_code = g_code;
		this.name = name;
		this.email = email;
	}

	
	
	public p2p(int p_board, String p_title, String p_context, String p_image) {
		super();
		this.p_board = p_board;
		this.p_title = p_title;
		this.p_context = p_context;
		this.p_image = p_image;
	}



	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public int getP_board() {
		return p_board;
	}

	public void setP_board(int p_board) {
		this.p_board = p_board;
	}

	public Date getP_sysdate() {
		return p_sysdate;
	}

	public void setP_sysdate(Date p_sysdate) {
		this.p_sysdate = p_sysdate;
	}

	public String getP_title() {
		return p_title;
	}

	public void setP_title(String p_title) {
		this.p_title = p_title;
	}

	public String getP_context() {
		return p_context;
	}

	public void setP_context(String p_context) {
		this.p_context = p_context;
	}

	public String getP_original_filename() {
		return p_original_filename;
	}

	public void setP_original_filename(String p_original_filename) {
		this.p_original_filename = p_original_filename;
	}

	public String getP_rename_filename() {
		return p_rename_filename;
	}

	public void setP_rename_filename(String p_rename_filename) {
		this.p_rename_filename = p_rename_filename;
	}

	public String getP_image() {
		return p_image;
	}

	public void setP_image(String p_image) {
		this.p_image = p_image;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public String getG_code() {
		return g_code;
	}

	public void setG_code(String g_code) {
		this.g_code = g_code;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}



	@Override
	public String toString() {
		return "p2p [p_num=" + p_num + ", p_board=" + p_board + ", p_sysdate=" + p_sysdate + ", p_title=" + p_title
				+ ", p_context=" + p_context + ", p_original_filename=" + p_original_filename + ", p_rename_filename="
				+ p_rename_filename + ", p_image=" + p_image + ", mem_num=" + mem_num + ", g_code=" + g_code + "]" +
				this.name;
	}
}
