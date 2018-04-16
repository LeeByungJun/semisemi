package report.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import report.model.vo.Report;


public class ReportDao {
	
	//Report보고서 전체리스트 불러오기용 메소드 - select문(조회)
	public ArrayList<Report> selectList(Connection con, int currentPage, int limit) {
		ArrayList<Report> list = new ArrayList<Report>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from "
				+ "(select rownum rnum, r_no, "
				+ "email, r_title, r_contents, r_origin_file, "
				+ "r_re_file, r_sysdate, count from (select * from newreport order by r_no desc))"
				+ "where rnum>=? and rnum<=?";
			
		int startRow = (currentPage-1)*limit+1; 
		int endRow = startRow+limit-1;
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset=pstmt.executeQuery();			
			while(rset.next()) {
				Report r = new Report();
				r.setR_no(rset.getInt("r_no"));
				r.setEmail(rset.getString("email"));
				r.setR_title(rset.getString("r_title"));
				r.setR_contents(rset.getString("r_contents"));
				r.setR_original_filename(rset.getString("r_origin_file"));
				r.setR_rename_filename(rset.getString("r_re_file"));
				r.setR_sysdate(rset.getDate("r_sysdate"));
				r.setReadCount(rset.getInt("count"));
				list.add(r);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	//신고게시판 전체목록의 갯수[조회] - select문	
	public int getListCount(Connection con) {
		int result=0;
		Statement stmt=null;
		ResultSet rset = null;
		
		String query = "select count(*) from newreport";
		try {
			stmt=con.createStatement();
			rset=stmt.executeQuery(query);
			
			if(rset.next()) { //한줄씩 테이블정보를 읽어오는데 카운트를 1씩증가시킴
				result=rset.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return result;
	}

	//글을 클릭시 조횟수 1증가처리 - update문
	public int addReadCount(Connection con, int reportNo) {
		int result=0;
		PreparedStatement pstmt = null;
		String query = "update newreport set count = count+1 "
				+ "where r_no=?";
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, reportNo);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	//등록번호(PrimaryKey)고유값으로 Report객체리턴 - select문
	public Report selectReport(Connection con, int reportNo) {
		Report report = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from newreport where r_no=?";				
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, reportNo);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				report = new Report();
				report.setR_no(reportNo);
				report.setEmail(rset.getString("email"));		
				report.setR_title(rset.getString("r_title"));			
				report.setR_contents(rset.getString("r_contents"));
				report.setR_original_filename(rset.getString("r_origin_file"));
				report.setR_rename_filename(rset.getString("r_re_file"));
				report.setR_sysdate(rset.getDate("r_sysdate"));
				report.setReadCount(rset.getInt("count"));
				/*private int r_no; //게시글 번호(sequence) primary key
				private String email; //유저 이메일
				private String r_title; //게시글 제목
				private String r_contents; //게시글 내용
				private String r_original_filename; //첨부파일 원본이름
				private String r_rename_filename; //첨부파일 수정이름
				private Date r_sysdate; //글 작성날짜
				private int readCount; //조회수	
				*/		
			}			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return report;
	}

	//새로운 글을 등록 - insert
	public int insertReport(Connection con, Report report) {
		int result=0;
		//System.out.println("DAO진입 --------------");
		PreparedStatement pstmt = null;
		String query = "insert into newreport values((select max(r_no)+1 from newreport), ?, ?, ?, ?, ?, sysdate, 0)";	
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, report.getEmail());
			pstmt.setString(2, report.getR_title());
			pstmt.setString(3, report.getR_contents());
			pstmt.setString(4, report.getR_original_filename());
			pstmt.setString(5, report.getR_rename_filename());
			result=pstmt.executeUpdate();
			//System.out.println(result+"개의 행이 추가되었습니다.");
			//System.out.println("DAO끝 --------------");
		}catch(Exception e) {
			
		}finally {
			close(pstmt);			
		}
		return result;
	}

	/*(select max(r_no)+1 from newreport)*/
	//기존의 작성된 글 삭제 - delete문
	public int deleteReport(Connection con, int reportNo) {
		int result=0;
		PreparedStatement pstmt=null;
		String query = "delete from newreport where r_no=?";
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, reportNo);
			result = pstmt.executeUpdate();
			//System.out.println(result+"개의 공지가 삭제가 되었습니다.(삭제완료)");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	//기존의 글 수정 - update문
	public int updateReport(Connection con, Report rp) {
		int result=0;
		PreparedStatement pstmt=null;
		String query = "update newreport set r_title=?, r_contents=?, r_origin_file=?, r_re_file=? where r_no=?";
		/*
		R_NO	NUMBER(4,0)
		EMAIL	VARCHAR2(50 BYTE)
		R_TITLE	VARCHAR2(90 BYTE)
		R_CONTENTS	VARCHAR2(4000 BYTE)
		R_ORIGIN_FILE	VARCHAR2(90 BYTE)
		R_RE_FILE	VARCHAR2(90 BYTE)
		R_SYSDATE	DATE
		COUNT	NUMBER(3,0)
		*/
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, rp.getR_title());
			pstmt.setString(2, rp.getR_contents());
			pstmt.setString(3, rp.getR_original_filename());
			pstmt.setString(4, rp.getR_rename_filename());
			pstmt.setInt(5, rp.getR_no());
			result=pstmt.executeUpdate();
			//System.out.println(result+"행 업데이트 되었습니다.");
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	//이메일로 검색해서 결과 리스트로 받아오기 - 조건검색(select)
	public ArrayList<Report> searchByEmail(Connection con, String inputsearch, int limit) {
		ArrayList<Report> list = new ArrayList<Report>();
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		String query = "select * from (select rownum rnum,r_no,email,"
				+ "r_title,r_contents,r_origin_file,r_re_file,r_sysdate,"
				+ "count from newreport where email like ? order by r_no desc) where rnum>=? and rnum<=?";	
		
		int startRow = 1; 
		int endRow = startRow+limit-1;
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, "%"+inputsearch+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				Report r = new Report();
				r.setR_no(rset.getInt("r_no"));
				r.setEmail(rset.getString("email"));
				r.setR_title(rset.getString("r_title"));				
				r.setR_contents(rset.getString("r_contents"));
				r.setR_original_filename(rset.getString("r_origin_file"));
				r.setR_rename_filename(rset.getString("r_re_file"));
				r.setR_sysdate(rset.getDate("r_sysdate"));
				r.setReadCount(rset.getInt("count"));
				
				list.add(r);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Report> searchByTitle(Connection con, String inputsearch, int limit) {
		ArrayList<Report> list = new ArrayList<Report>();
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		/*String query = "select * from (select * from newreport where r_title like ?) order by r_no desc";*/	
		String query = "select * from (select rownum rnum,r_no,email,"
				+ "r_title,r_contents,r_origin_file,r_re_file,r_sysdate,"
				+ "count from newreport where r_title like ? order by r_no desc) where rnum>=? and rnum<=?";	
		
		int startRow = 1; 
		int endRow = startRow+limit-1;
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, "%"+inputsearch+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				Report r = new Report();
				r.setR_no(rset.getInt("r_no"));
				r.setEmail(rset.getString("email"));
				r.setR_title(rset.getString("r_title"));				
				r.setR_contents(rset.getString("r_contents"));
				r.setR_original_filename(rset.getString("r_origin_file"));
				r.setR_rename_filename(rset.getString("r_re_file"));
				r.setR_sysdate(rset.getDate("r_sysdate"));
				r.setReadCount(rset.getInt("count"));
				/*R_NO	NUMBER(4,0)
				EMAIL	VARCHAR2(50 BYTE)
				R_TITLE	VARCHAR2(90 BYTE)
				R_CONTENTS	VARCHAR2(4000 BYTE)
				R_ORIGIN_FILE	VARCHAR2(90 BYTE)
				R_RE_FILE	VARCHAR2(90 BYTE)
				R_SYSDATE	DATE
				COUNT	NUMBER(3,0)*/
				list.add(r);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;

	}

	//게시글 목록중 조회수가 가장 많은 Top5 가져오기 - select
	public ArrayList<Report> getTop4List(Connection con) {
		ArrayList<Report> list = new ArrayList<Report>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String qurey = "select * from (select rownum rnum, r_no, email, r_title, r_contents, r_origin_file, r_re_file, r_sysdate, count from (select * from newreport order by count desc)) where rnum>=1 and rnum<=5"; 	
		try {
			pstmt = con.prepareStatement(qurey);
			rset=pstmt.executeQuery();
			while(rset.next()) {
				Report r = new Report();
				r.setR_no(rset.getInt("r_no"));
				r.setEmail(rset.getString("email"));
				r.setR_title(rset.getString("r_title"));
				r.setR_contents(rset.getString("r_contents"));
				r.setR_original_filename(rset.getString("r_origin_file"));
				r.setR_rename_filename(rset.getString("r_re_file"));
				r.setR_sysdate(rset.getDate("r_sysdate"));
				r.setReadCount(rset.getInt("count"));
				list.add(r);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 불량고객 신고 게시판 이메일 검색 목록 갯수 조회
	public int getEmailListCount(Connection con, String email) {
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		String query = "select count(email) from (select email from newreport where email like ?)";
		int count = 0;
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, "%"+email+"%");
			rset=pstmt.executeQuery();
			System.out.println("밖");
			if(rset.next()) {
				System.out.println("안");
				System.out.println(rset.getInt(1));
				count = rset.getInt(1);
			}
			System.out.println("email dao count = " + count);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	// 불량고객 신고 게시판 제목 검색 목록 갯수 조회
	public int getTitleListCount(Connection con, String title) {
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		String query = "select count(r_title) from (select r_title from newreport where r_title like ?)";
		int count = 0;
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, "%"+title+"%");
			rset=pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt(1);
			}
			System.out.println("title dao count = " + count);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	
	
}















