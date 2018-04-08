package notice.model.vo;
import java.sql.Date;

//공지사항 객체(Notice)
public class Notice implements java.io.Serializable{
	private  static final long serialVersionUID = 13L;
	private int n_no; //공지글 식별번호(sequence)
	private String n_title; //공지글 제목
	private String n_writer; //글 작성자 
	private String n_contents; //공지 내부내용
	private String n_original_filename; //첨부파일 원본이름
	private String n_rename_filename; //첨부파일 수정이름
	private Date  n_sysdate; // 글 작성날짜
	private int readCount; //공지 클릭 조횟수 
	
	/*
	N_NO NUMBER(5,0)
	N_TITLE	VARCHAR2(30 BYTE)
	N_WRITER	VARCHAR2(60 BYTE)
	N_CONTENTS	VARCHAR2(690 BYTE)
	N_ORIGINAL_FILENAME	VARCHAR2(60 BYTE)
	N_RENAME_FILENAME	VARCHAR2(60 BYTE)
	N_SYSDATE	DATE
	READCOUNT	NUMBER(5,0)*/
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public Notice(int n_no, String n_title, String n_writer, String n_contents, String n_original_filename,
			String n_rename_filename, Date n_sysdate, int readCount) {
		super();
		this.n_no = n_no;
		this.n_title = n_title;
		this.n_writer = n_writer;
		this.n_contents = n_contents;
		this.n_original_filename = n_original_filename;
		this.n_rename_filename = n_rename_filename;
		this.n_sysdate = n_sysdate;
		this.readCount = readCount;
	}
	

	public Notice(int n_no, String n_title, String n_contents, String n_original_filename, String n_rename_filename) {
		super();
		this.n_no = n_no;
		this.n_title = n_title;
		this.n_contents = n_contents;
		this.n_original_filename = n_original_filename;
		this.n_rename_filename = n_rename_filename;
	}

	public Notice(int n_no, String n_title, String n_contents) {
		super();
		this.n_no = n_no;
		this.n_title = n_title;
		this.n_contents = n_contents;
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

	public String getN_original_filename() {
		return n_original_filename;
	}

	public void setN_original_filename(String n_original_filename) {
		this.n_original_filename = n_original_filename;
	}

	public String getN_rename_filename() {
		return n_rename_filename;
	}

	public void setN_rename_filename(String n_rename_filename) {
		this.n_rename_filename = n_rename_filename;
	}

	public Date getN_sysdate() {
		return n_sysdate;
	}

	public void setN_sysdate(Date n_sysdate) {
		this.n_sysdate = n_sysdate;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	

	@Override
	public String toString() {
		return "Notice [n_no=" + n_no + ", n_title=" + n_title + ", n_writer=" + n_writer + ", n_contents=" + n_contents
				+ ", n_original_filename=" + n_original_filename + ", n_rename_filename=" + n_rename_filename
				+ ", n_sysdate=" + n_sysdate + ", readCount=" + readCount + ", getN_no()=" + getN_no()
				+ ", getN_title()=" + getN_title() + ", getN_writer()=" + getN_writer() + ", getN_contents()="
				+ getN_contents() + ", getN_original_filename()=" + getN_original_filename()
				+ ", getN_rename_filename()=" + getN_rename_filename() + ", getN_sysdate()=" + getN_sysdate()
				+ ", getReadCount()=" + getReadCount() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}

	public void setRenameFilePath(String renameFileName) {
		
		
	}

	


}
