package badcustomer.model.vo;
import java.sql.Date;

//불량고객신고 게시판 객체
public class BadCustomer {
	private int r_no; //게시글 번호(sequence)
	private String r_title; //게시글 제목
	private String r_writer; //글 작성자
	private String r_contents; //게시글 내용
	private String r_original_path; //첨부파일 첫 경로
	private String r_rename_path; //첨부파일 수정된 경로
	private Date r_sysdate; //글 작성날짜
	private String email; 
	//이메일 외래키(Member테이블의 email참조), 
	// => email을 사용하여 어떤고객을 신고하는지 식별
	
	public BadCustomer() {
		// TODO Auto-generated constructor stub
	}
	
	public BadCustomer(int r_no, String r_title, String r_writer, String r_contents, String r_original_path,
			String r_rename_path, Date r_sysdate, String email) {
		super();
		this.r_no = r_no;
		this.r_title = r_title;
		this.r_writer = r_writer;
		this.r_contents = r_contents;
		this.r_original_path = r_original_path;
		this.r_rename_path = r_rename_path;
		this.r_sysdate = r_sysdate;
		this.email = email;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_writer() {
		return r_writer;
	}

	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}

	public String getR_contents() {
		return r_contents;
	}

	public void setR_contents(String r_contents) {
		this.r_contents = r_contents;
	}

	public String getR_original_path() {
		return r_original_path;
	}

	public void setR_original_path(String r_original_path) {
		this.r_original_path = r_original_path;
	}

	public String getR_rename_path() {
		return r_rename_path;
	}

	public void setR_rename_path(String r_rename_path) {
		this.r_rename_path = r_rename_path;
	}

	public Date getR_sysdate() {
		return r_sysdate;
	}

	public void setR_sysdate(Date r_sysdate) {
		this.r_sysdate = r_sysdate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String toString() {
		// TODO Auto-generated method stub
		return this.r_no+", "+this.r_title+", "+this.r_writer+", "
				+this.r_contents+", "+this.r_original_path+", "+this.r_rename_path+", "+this.r_sysdate+", "+this.email;
	}

	
}
