package reportcomment.model.vo;

import java.sql.Date;

public class ReportComment {
	private int reportcommentno; //댓글의 원글 고유번호(Primary key)
	private int reportno; //외부테이블의 참고하는 report의 고유번호 
	private String userEmail; //외부테이블 참고하는 UserEmail
	private String reportcommentcontents; //댓글테이블 상세내용
	private Date inputDate; //댓글 작성날짜.
	
	public ReportComment() {
		// TODO Auto-generated constructor stub
	}
	
	public ReportComment(int reportcommentno, int reportno, String userEmail, String reportcommentcontents, Date inputDate) {
		super();
		this.reportcommentno = reportcommentno;
		this.reportno = reportno;
		this.userEmail = userEmail;
		this.reportcommentcontents = reportcommentcontents;
		this.inputDate = inputDate;
	}
	
	public ReportComment(int reportcommentno, int reportno, String userEmail, String reportcommentcontents) {
		super();
		this.reportcommentno = reportcommentno;
		this.reportno = reportno;
		this.userEmail = userEmail;
		this.reportcommentcontents = reportcommentcontents;
	}
	
	

	public ReportComment(int reportno, String userEmail, String reportcommentcontents) {
		super();
		this.reportno = reportno;
		this.userEmail = userEmail;
		this.reportcommentcontents = reportcommentcontents;
	}

	public int getReportcommentno() {
		return reportcommentno;
	}

	public void setReportcommentno(int reportcommentno) {
		this.reportcommentno = reportcommentno;
	}

	public int getReportno() {
		return reportno;
	}

	public void setReportno(int reportno) {
		this.reportno = reportno;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public String getReportcommentcontents() {
		return reportcommentcontents;
	}

	public void setReportcommentcontents(String reportcommentcontents) {
		this.reportcommentcontents = reportcommentcontents;
	}

	public Date getInputDate() {
		return inputDate;
	}

	public void setInputDate(Date inputDate) {
		this.inputDate = inputDate;
	}

	@Override
	public String toString() {
		return "ReportComment [reportcommentno=" + reportcommentno + ", reportno=" + reportno + ", userEmail="
				+ userEmail + " , reportcommentcontents="
				+ reportcommentcontents + ", inputDate=" + inputDate + "]";
	}
	

}
