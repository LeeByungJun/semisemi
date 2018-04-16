package notice.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import notice.model.vo.Notice;

public class NoticeDao {
	

	public NoticeDao() {
		// TODO Auto-generated constructor stub
	}
	
	//전체 목록 갯수 조회 select문 
	public int getListCount(Connection con) {
		int listCount=0;
		Statement stmt = null;
		ResultSet rset = null;
		String qurey = "select count(*) from newnotice";
		try {
			stmt=con.createStatement();
			rset=stmt.executeQuery(qurey);
			
			if(rset.next()) {
				listCount=rset.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}		
		return listCount;
	}



	//공지글의 전체목록 조회 select문
	public ArrayList<Notice> selectList(Connection con, int currentPage, int limit) {
		ArrayList<Notice> list = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
			
		String query = "select * from "
				+ "(select rownum rnum, n_no,"
				+ "n_title, n_writer, n_contents, "
				+ "n_sysdate,readcount from (select * from newnotice order by n_no desc))"
				+ "where rnum >=? and rnum <=?";
		
		/*N_NO	NUMBER(3,0)
		N_TITLE	VARCHAR2(150 BYTE)
		N_WRITER	VARCHAR2(60 BYTE)
		N_CONTENTS	VARCHAR2(4000 BYTE)
		N_SYSDATE	DATE
		READCOUNT	NUMBER(4,0)*/
		int startRow = (currentPage-1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {				

				Notice n = new Notice();
				n.setN_no(rset.getInt("n_no"));
				n.setN_title(rset.getString("n_title"));
				n.setN_writer(rset.getString("n_writer"));
				n.setN_contents(rset.getString("n_contents"));
				n.setN_sysdate(rset.getDate("n_sysdate"));
				n.setReadCount(rset.getInt("readcount"));
				list.add(n);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	//공지글 등록(운영자) insert문
	public int insertNotice(Connection con, Notice notice) {
		int result=0;
		PreparedStatement pstmt = null;
		System.out.println(notice.getN_title());
		System.out.println(notice.getN_writer());
		System.out.println(notice.getN_contents());
		
		/*
		notice.setN_title(mrequest.getParameter("title"));
		notice.setN_contents(mrequest.getParameter("contents"));
		notice.setN_writer(mrequest.getParameter("nwriter"));
		notice.setN_original_filename(originFileName);
		notice.setN_rename_filename(renameFileName);*/
		
	
		String query = "insert into newnotice values((select max(n_no)+1 from newnotice), ?, ?, ?, sysdate, default)";
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, notice.getN_title());
			pstmt.setString(2, notice.getN_writer());
			pstmt.setString(3, notice.getN_contents());
			result = pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();	
		}finally {
			close(pstmt);
		}
		/*N_NO	NUMBER(3,0)
		N_TITLE	VARCHAR2(150 BYTE)
		N_WRITER	VARCHAR2(60 BYTE)
		N_CONTENTS	VARCHAR2(4000 BYTE)
		N_SYSDATE	DATE
		READCOUNT	NUMBER(4,0)*/

		return result;
	}

	//등록번호(PrimaryKey)고유값으로 Notice객체리턴 - select문
	public Notice selectNotice(Connection con, int notice_no) {		
		Notice notice = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from newnotice where n_no=?";				
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, notice_no);
			
			rset=pstmt.executeQuery();	
			if(rset.next()) {
				notice = new Notice();
				notice.setN_no(notice_no);
				notice.setN_title(rset.getString("n_title"));
				notice.setN_writer(rset.getString("n_writer"));
				notice.setN_contents(rset.getString("n_contents"));
				notice.setN_sysdate(rset.getDate("n_sysdate"));
				notice.setReadCount(rset.getInt("readcount"));
				//System.out.println(notice.toString());
			}			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return notice;
	}

	
	//선택공지글 수정하기 - update문 
	public int updateNotice(Connection con, Notice n) {
		int result=0;
		PreparedStatement pstmt = null;
		String query = "update newnotice set n_title=?, n_contents=? where n_no=?";
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, n.getN_title());
			pstmt.setString(2, n.getN_contents());
			pstmt.setInt(3, n.getN_no());	
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}
	
	//공지 글 삭제 delete문
	public int deleteNotice(Connection con, int noticeNo) {
		int result=0;
		PreparedStatement pstmt=null;
		String query = "delete from newnotice where n_no=?";	
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, noticeNo);	
			result=pstmt.executeUpdate();
			System.out.println(result+"개의 수정이 이루어졌습니다.(1행정보 삭제완료)");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	//글을 클릭시 조횟수 1증가처리 - update문
	public int addReadCount(Connection con, int noticeNo) {
		int result=0;
		PreparedStatement pstmt = null;
		String query = "update newnotice set readcount=readcount+1 "
				+ "where n_no=?";
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();	
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Notice> noticeTop5(Connection con) {
		 ArrayList<Notice> list = new ArrayList<Notice>();
	     PreparedStatement pstmt= null;
	     ResultSet rset=null;
	     
	     //String query = "select * from (select rownum rnum, n_no, n_title, n_writer, n_contents, n_sysdate, readcount from newnotice order by readcount desc) where rnum>=1 and rnum<=5";
	     String query = "select * from (select rownum rnum, n_no, n_title, n_writer, n_contents, n_sysdate, readcount from (select * from newnotice order by readcount desc)) where rnum>=1 and rnum<=5";
	     
	     try {
	        pstmt=con.prepareStatement(query);
	        rset=pstmt.executeQuery();
	         
	        while(rset.next()) {
		         Notice n = new Notice();
		         n.setN_no(rset.getInt("n_no"));
		         n.setN_title(rset.getString("n_title"));
		         n.setN_writer(rset.getString("n_writer"));
		         n.setN_contents(rset.getString("n_contents"));
		         n.setN_sysdate(rset.getDate("n_sysdate"));
		         n.setReadCount(rset.getInt("readcount"));
		         list.add(n);      
		         System.out.println("list = "+list);
	         }               
	     }catch(Exception e) {
	        e.printStackTrace();
	     }finally {
	        close(rset);
	        close(pstmt);
	     }
	     return list;

	}



	
}























