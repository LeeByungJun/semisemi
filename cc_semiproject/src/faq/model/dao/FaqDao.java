package faq.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import faq.model.vo.Faq;

import static common.JDBCTemplate.*;

public class FaqDao {
	public FaqDao() {
		
	}

	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select count(*) from faq";
		int listCount = 0;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		
		return listCount;
	}

	public ArrayList<Faq> selectList(Connection conn, int currentPage, int limit) {
		ArrayList<Faq> list = new ArrayList<Faq>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//rownum
		String query = "select * from "
				+ "(select rownum rnum,f_no,f_category,f_title,f_contents from faq) "
				+ "where rnum >= ? and rnum <= ?";
		
		int startRow = (currentPage-1) * limit + 1; //시작행
		int endRow = startRow + limit - 1; //끝행
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Faq f = new Faq();
				f.setF_no(rs.getInt("f_no"));
				f.setF_category(rs.getString("f_category"));
				f.setF_title(rs.getString("f_title"));
				f.setF_contents(rs.getString("f_contents"));
				
				list.add(f);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Faq> selectSearchList(Connection conn, String category) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Faq> list = new ArrayList<Faq>();
		String query = "select * from faq where f_category = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Faq f = new Faq();
				f.setF_no(rs.getInt("f_no"));
				f.setF_category(rs.getString("f_category"));
				f.setF_title(rs.getString("f_title"));
				f.setF_contents(rs.getString("f_contents"));
				
				list.add(f);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	//관리자 faq 게시글 상세보기용 메소드
	public Faq adminFaqDetail(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from faq where f_no = ?";
		Faq f = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				f = new Faq();
				f.setF_no(no);
				f.setF_category(rs.getString("f_category"));
				f.setF_title(rs.getString("f_title"));
				f.setF_contents(rs.getString("f_contents"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return f;
	}
	
	//관리자가 FAQ 게시글 삭제했을 시 사용하는 메소드
	public int adminFaqDelete(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from faq where f_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	//관리자가 FAQ 게시글 수정했을 시 사용하는 메소드
	public int adminFaqUpdate(Connection conn, Faq f) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update faq set f_title = ?,f_contents=? where f_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, f.getF_title());
			pstmt.setString(2, f.getF_contents());
			pstmt.setInt(3, f.getF_no());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int adminFaqInsert(Connection conn, String category, String title, String contents) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into faq values ((select max(f_no)+1 from faq),?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, category);
			pstmt.setString(2, title);
			pstmt.setString(3, contents);
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}
