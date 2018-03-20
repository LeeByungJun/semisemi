package notice.model.vo;
import java.sql.Date;

//공지사항 객체
public class Notice {
	private int n_no; //공지글 식별번호(sequence)
	private String n_title; //공지글 제목
	private String n_writer; //공지글
	private String n_contents; //공지내용
	private String n_original_path; //첨부파일 첫 경로
	private String n_rename_path; //첨부파일 수정된 경로
	private Date  n_sysdate; //작성날짜
	
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public Notice(int n_no, String n_title, String n_writer, String n_contents, String n_original_path,
			String n_rename_path, Date n_sysdate) {
		super();
		this.n_no = n_no;
		this.n_title = n_title;
		this.n_writer = n_writer;
		this.n_contents = n_contents;
		this.n_original_path = n_original_path;
		this.n_rename_path = n_rename_path;
		this.n_sysdate = n_sysdate;
	}

	public int getN_no() {
		return n_no;
	}

	public void setN_no(int n_no) {
		this.n_no = n_no;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_writer() {
		return n_writer;
	}

	public void setN_writer(String n_writer) {
		this.n_writer = n_writer;
	}

	public String getN_contents() {
		return n_contents;
	}

	public void setN_contents(String n_contents) {
		this.n_contents = n_contents;
	}

	public String getN_original_path() {
		return n_original_path;
	}

	public void setN_original_path(String n_original_path) {
		this.n_original_path = n_original_path;
	}

	public String getN_rename_path() {
		return n_rename_path;
	}

	public void setN_rename_path(String n_rename_path) {
		this.n_rename_path = n_rename_path;
	}

	public Date getN_sysdate() {
		return n_sysdate;
	}

	public void setN_sysdate(Date n_sysdate) {
		this.n_sysdate = n_sysdate;
	}

	public String toString() {
		return this.n_no+", "+this.n_title+", "+this.n_writer+", "+this.n_contents+
				", "+this.n_original_path+", "+this.n_rename_path+", "+this.n_sysdate;
	}
}
