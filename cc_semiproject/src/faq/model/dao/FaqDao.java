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
}
