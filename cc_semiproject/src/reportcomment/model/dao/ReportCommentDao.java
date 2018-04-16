package reportcomment.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import reportcomment.model.vo.ReportComment;

public class ReportCommentDao {

	//댓글테이블의 모든 목록조회 - select문
	public ArrayList<ReportComment> selectCommentAllList(Connection con) {
		ArrayList<ReportComment> list = new ArrayList<ReportComment>();
		//PreparedStatement pstmt=null;
		Statement stmt = null;
		ResultSet rset=null;
		String query = "select * from newreport_comment ORDER BY RC_NO desc";
		
		try {
			stmt=con.createStatement();
			rset=stmt.executeQuery(query);
			/*private int reportcommentno; //댓글의 원글 고유번호(Primary key)
			private int reportno; //외부테이블의 참고하는 report의 고유번호 
			private String userEmail; //외부테이블 참고하는 UserEmail
			private String userName; //외부테이블 참고하는 UserName
			private String userLevel; //외부테이블 참고하는 유저의등급
			private String reportcommentcontents; //댓글테이블 상세내용
			private Date inputDate;*/			
			/*RC_NO	NUMBER(5,0)
			R_NO	NUMBER(5,0)
			EMAIL	VARCHAR2(50 BYTE)
			RC_CONTENTS	VARCHAR2(400 BYTE)
			RC_SYSDATE	DATE*/

			while(rset.next()) {
				ReportComment rpc = new ReportComment();
				rpc.setReportcommentno(rset.getInt("rc_no"));
				rpc.setReportno(rset.getInt("r_no"));
				rpc.setUserEmail(rset.getString("email"));
				rpc.setReportcommentcontents(rset.getString("rc_contents"));
				rpc.setInputDate(rset.getDate("rc_sysdate"));
				
				list.add(rpc);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return list;
	}
	
	

	//신규 댓글등록을 하여 댓글 테이블에 추가됨 - insert문
	public int addComment(Connection con, ReportComment rc) {
		int result = 0;
		PreparedStatement pstmt = null;
		String insertquery = "insert into newreport_comment values((select max(rc_no)+1 from newreport_comment), ?, ?, ?, sysdate)";
		/*RC_NO	NUMBER(5,0)
		R_NO	NUMBER(5,0)
		EMAIL	VARCHAR2(50 BYTE)
		RC_CONTENTS	VARCHAR2(400 BYTE)
		RC_SYSDATE	DATE*/
		
		try {
			pstmt=con.prepareStatement(insertquery);
			pstmt.setInt(1, rc.getReportno());
			pstmt.setString(2, rc.getUserEmail());
			pstmt.setString(3, rc.getReportcommentcontents());
			
			result=pstmt.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	//기존 댓글을 삭제하는 메소드 - delete
	public int deleteComment(Connection con, int reportCommentNo) {
		int result=0;
		PreparedStatement pstmt=null;
		String query = "delete from newreport_comment where rc_no=?";	
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, reportCommentNo);
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			
		}
		return result;
	}

	//댓글 고유번호로 ReportComment객체를 조회 - select
	public ReportComment checkReply(Connection con, int checkReplyNo) {
		ReportComment rec = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String select = "select * from newreport_comment where rc_no=?";
		
		try {
			pstmt=con.prepareStatement(select);
			pstmt.setInt(1, checkReplyNo);
			rset=pstmt.executeQuery();
			/*private int reportcommentno; //댓글의 원글 고유번호(Primary key)
			private int reportno; //외부테이블의 참고하는 report의 고유번호 
			private String userEmail; //외부테이블 참고하는 UserEmail
			private String reportcommentcontents; //댓글테이블 상세내용
			private Date inputDate;*/		
			
			/*RC_NO	NUMBER(5,0)
			R_NO	NUMBER(5,0)
			EMAIL	VARCHAR2(50 BYTE)
			RC_CONTENTS	VARCHAR2(400 BYTE)
			RC_SYSDATE	DATE*/			
			if(rset.next()) {
				//System.out.println("DAO의 시작");
				rec=new ReportComment();
				rec.setReportcommentno(rset.getInt("rc_no"));
				rec.setReportno(rset.getInt("r_no"));
				rec.setUserEmail(rset.getString("email"));
				rec.setReportcommentcontents(rset.getString("rc_contents"));
				rec.setInputDate(rset.getDate("rc_sysdate"));
				//System.out.println("변경하려는 댓글정보 출력");
				//System.out.println(rec.toString());
				//System.out.println("DAO의 끝");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return rec;
	}

	//댓글객체를 전달하여 해당객체의 있는 내용으로수정하기 - update 
	public int realUpdateCommit(Connection con, ReportComment rec) {
		int result=0;
		PreparedStatement pstmt=null;
		String query = "update newreport_comment set r_no=?, email=?, rc_contents=? where rc_no=?";
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, rec.getReportno());
			pstmt.setString(2, rec.getUserEmail());
			pstmt.setString(3, rec.getReportcommentcontents());
			pstmt.setInt(4, rec.getReportcommentno());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	//댓글 목록의 총 갯수를 불러온다. - select문
	public int getCommentListCount(Connection con,int reportNo) {
		int result=0;
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		
		String query = "select count(r_no) from newreport_comment where r_no=?";
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, reportNo);
			rset=pstmt.executeQuery();			
			if(rset.next()) {
				result=rset.getInt(1);
			}
			System.out.println(result);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}	
		return result;
	}

	//댓글테이블의 모든 목록조회(페이징처리) - select문
	public ArrayList<ReportComment> selectCommentAllList2(Connection con, int ccurrentPage, int commentlimit , int reportNo) {
		ArrayList<ReportComment> list = new ArrayList<ReportComment>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
				
		/*
		RC_NO	NUMBER(5,0)
		R_NO	NUMBER(5,0)
		EMAIL	VARCHAR2(50 BYTE)
		RC_CONTENTS	VARCHAR2(400 BYTE)
		RC_SYSDATE	DATE*/
		
		String query = "select * from (select rownum rnum, rc_no, r_no, email, rc_contents, rc_sysdate from (select * from newreport_comment order by rc_no desc)) where r_no=? and rnum>=? and rnum<=?";
		/*private int reportcommentno; //댓글의 원글 고유번호(Primary key)
		private int reportno; //외부테이블의 참고하는 report의 고유번호 
		private String userEmail; //외부테이블 참고하는 UserEmail
		private String reportcommentcontents; //댓글테이블 상세내용
		private Date inputDate;*/	
		
		int startRow = (ccurrentPage-1)*commentlimit+1; 
		int endRow = startRow+commentlimit-1;	
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, reportNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset=pstmt.executeQuery();
			while(rset.next()) {
				ReportComment rc = new ReportComment();
				rc.setReportno(rset.getInt("r_no"));
				rc.setReportcommentno(rset.getInt("rc_no"));
				rc.setUserEmail(rset.getString("email"));
				rc.setReportcommentcontents(rset.getString("rc_contents"));
				rc.setInputDate(rset.getDate("rc_sysdate"));
				list.add(rc);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}


	//기존댓글을 바로 수정(Ajax)적용 - update
	public int renewCommnet(Connection con, ReportComment rc) {
		int result=0;
		PreparedStatement pstmt=null;
		String query = "update newreport_comment set r_no=? email=? rc_contents=? where rc_no=?";
		/*RC_NO	NUMBER(5,0)
		R_NO	NUMBER(5,0)
		EMAIL	VARCHAR2(50 BYTE)
		RC_CONTENTS	VARCHAR2(400 BYTE)
		RC_SYSDATE	DATE*/
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, rc.getReportno());
			pstmt.setString(2, rc.getUserEmail());
			pstmt.setString(3, rc.getReportcommentcontents());
			pstmt.setInt(4, rc.getReportcommentno());
			result = pstmt.executeUpdate();			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}




















