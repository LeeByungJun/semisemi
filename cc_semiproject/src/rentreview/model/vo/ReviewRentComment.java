package rentreview.model.vo;

import java.sql.Date;

public class ReviewRentComment implements java.io.Serializable{
	
	private  static final long serialVersionUID = 13L;
	private int rc_num;						//게시글 번호(sequence)
	private int rc_parent_num;						//게시글 번호(sequence)
	private String rc_content; 				//게시글 제목
	private String rc_writer; 				//게시글 작성자
	private Date rc_date; 				//게시글 내용
	
	public int getRc_num() {
		return rc_num;
	}
	public void setRc_num(int rc_num) {
		this.rc_num = rc_num;
	}
	public int getRc_parent_num() {
		return rc_parent_num;
	}
	public void setRc_parent_num(int rc_parent_num) {
		this.rc_parent_num = rc_parent_num;
	}
	public String getRc_content() {
		return rc_content;
	}
	public void setRc_content(String rc_content) {
		this.rc_content = rc_content;
	}
	public String getRc_writer() {
		return rc_writer;
	}
	public void setRc_writer(String rc_writer) {
		this.rc_writer = rc_writer;
	}
	public Date getRc_date() {
		return rc_date;
	}
	public void setRc_date(Date rc_date) {
		this.rc_date = rc_date;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "ReviewRentComment [rc_num=" + rc_num + ", rc_parent_num=" + rc_parent_num + ", rc_content=" + rc_content
				+ ", rc_writer=" + rc_writer + ", getRc_num()=" + getRc_num()
				+ ", getRc_parent_num()=" + getRc_parent_num() + ", getRc_content()=" + getRc_content()
				+ ", getRc_writer()=" + getRc_writer() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}/*+ ", rr_date=" + rr_date+ ", getRr_date()=" + getRr_date()*/

}
