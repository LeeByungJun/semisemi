package freeboard.model.vo;

import java.sql.Date;

public class FreeBoardComment implements java.io.Serializable{
	
	private  static final long serialVersionUID = 13L;
	private int fbc_num;						//게시글 번호(sequence)
	private int fbc_parent_num;						//게시글 번호(sequence)
	private String fbc_content; 				//게시글 제목
	private String fbc_writer; 				//게시글 작성자
	private Date fbc_date; 				//게시글 내용
	
	public FreeBoardComment() {}
	
	public int getFbc_num() {
		return fbc_num;
	}
	public void setFbc_num(int fbc_num) {
		this.fbc_num = fbc_num;
	}
	public int getFbc_parent_num() {
		return fbc_parent_num;
	}
	public void setFbc_parent_num(int fbc_parent_num) {
		this.fbc_parent_num = fbc_parent_num;
	}
	public String getFbc_content() {
		return fbc_content;
	}
	public void setFbc_content(String fbc_content) {
		this.fbc_content = fbc_content;
	}
	public String getFbc_writer() {
		return fbc_writer;
	}
	public void setFbc_writer(String fbc_writer) {
		this.fbc_writer = fbc_writer;
	}
	public Date getFbc_date() {
		return fbc_date;
	}
	public void setFbc_date(Date fbc_date) {
		this.fbc_date = fbc_date;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "FreeBoardComment [fbc_num=" + fbc_num + ", fbc_parent_num=" + fbc_parent_num + ", fbc_content="
				+ fbc_content + ", fbc_writer=" + fbc_writer + ", fbc_date=" + fbc_date + ", getFbc_num()="
				+ getFbc_num() + ", getFbc_parent_num()=" + getFbc_parent_num() + ", getFbc_content()="
				+ getFbc_content() + ", getFbc_writer()=" + getFbc_writer() + ", getFbc_date()=" + getFbc_date()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
}