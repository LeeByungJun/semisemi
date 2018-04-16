package report.model.vo;
import java.sql.Date;

//불량고객신고 게시판 객체
public class Report {
	private int r_no; //게시글 번호(sequence) primary key
	private String email; //유저 이메일
	private String r_title; //게시글 제목
	private String r_contents; //게시글 내용
	private String r_original_filename; //첨부파일 원본이름
	private String r_rename_filename; //첨부파일 수정이름
	private Date r_sysdate; //글 작성날짜
	private int readCount; //조회수
	
	public Report() {
		// TODO Auto-generated constructor stub
	}

	public Report(int r_no, String email, String r_title, String r_contents, String r_original_filename,
			String r_rename_filename, Date r_sysdate, int readCount) {
		super();
		this.r_no = r_no;
		this.email = email;
		this.r_title = r_title;
		this.r_contents = r_contents;
		this.r_original_filename = r_original_filename;
		this.r_rename_filename = r_rename_filename;
		this.r_sysdate = r_sysdate;
		this.readCount = readCount;
	}
	
	//첨부파일이 존재할경우
	public Report(int r_no, String r_title, String r_contents, String r_original_filename, String r_rename_filename) {
		super();
		this.r_no = r_no;
		this.r_title = r_title;
		this.r_contents = r_contents;
		this.r_original_filename = r_original_filename;
		this.r_rename_filename = r_rename_filename;
	}
	
	//첨부파일이 없을경우 
	public Report(int r_no, String r_title, String r_contents) {
		super();
		this.r_no = r_no;
		this.r_title = r_title;
		this.r_contents = r_contents;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_contents() {
		return r_contents;
	}

	public void setR_contents(String r_contents) {
		this.r_contents = r_contents;
	}

	public String getR_original_filename() {
		return r_original_filename;
	}

	public void setR_original_filename(String r_original_filename) {
		this.r_original_filename = r_original_filename;
	}

	public String getR_rename_filename() {
		return r_rename_filename;
	}

	public void setR_rename_filename(String r_rename_filename) {
		this.r_rename_filename = r_rename_filename;
	}

	public Date getR_sysdate() {
		return r_sysdate;
	}

	public void setR_sysdate(Date r_sysdate) {
		this.r_sysdate = r_sysdate;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	@Override
	public String toString() {
		return "Report [r_no=" + r_no + ", email=" + email + ", r_title=" + r_title + ", r_contents=" + r_contents
				+ ", r_original_filename=" + r_original_filename + ", r_rename_filename=" + r_rename_filename
				+ ", r_sysdate=" + r_sysdate + ", readCount=" + readCount + "]";
	}

	
}
