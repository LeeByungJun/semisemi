package rentreview.model.dao;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import notice.model.vo.Notice;

import static common.JDBCTemplate.*;

import rentreview.model.vo.ReviewRent;
import rentreview.model.vo.ReviewRentComment;

public class ReviewRentDao {
	
	public ReviewRentDao() {}

	
	//전체 목록 갯수 조회 select문 
	public int getListCount(Connection con) {
		int listCount=0;
		Statement stmt = null;
		ResultSet rset = null;
		String qurey = "select count(*) from RentReview";
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

	//전체 목록 갯수 조회 select문 
	public int getCommentCount(Connection con,int rr_num) {
		int listCount=0;
		Statement stmt = null;
		ResultSet rset = null;
		String qurey = "select count(*) from ReviewComment";
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
	public ArrayList<ReviewRentComment> selectComment(Connection con, int currentPage, int limit, int rr_num) {
		ArrayList<ReviewRentComment> comment_list = new ArrayList<ReviewRentComment>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;


		String query = "select * from ReviewComment where ROWNUM >= ? AND ROWNUM <= ? AND rc_parent_num = ? order by rc_num asc";
		

		int startRow = (currentPage-1) * limit;
		int endRow = currentPage * limit;
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, rr_num);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {				

				ReviewRentComment rc = new ReviewRentComment();
				rc.setRc_num(rset.getInt("rc_num"));
				rc.setRc_parent_num(rr_num);
				rc.setRc_writer(rset.getString("rc_writer"));
				rc.setRc_content(rset.getString("rc_content"));
				rc.setRc_date(rset.getDate("rc_date"));
				
				comment_list.add(rc);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return comment_list;
	}
	
	
	//공지글의 전체목록 조회 select문
	public ArrayList<ReviewRent> selectList(Connection con, int currentPage, int limit) {
		ArrayList<ReviewRent> list = new ArrayList<ReviewRent>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;


		String query = "select * from RentReview where ROWNUM >= ? AND ROWNUM <= ? order by rr_num asc";
		
		int startRow = (currentPage-1) * limit;
		int endRow = currentPage * limit;
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);


			rset=pstmt.executeQuery();
			
			while(rset.next()) {				

				ReviewRent rr = new ReviewRent();
				

				rr.setRr_num(rset.getInt("rr_num"));
				rr.setRr_subject(rset.getString("rr_subject"));
				rr.setRr_writer(rset.getString("rr_writer"));
				rr.setRr_content(rset.getString("rr_content"));
				rr.setRr_original_filename(rset.getString("rr_original_filename"));
				rr.setRr_original_filename(rset.getString("rr_rename_filename"));
				rr.setRr_date(rset.getDate("rr_date"));
				rr.setRr_hits(rset.getInt("rr_hits"));
				list.add(rr);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;

		


	}
	public ArrayList<ReviewRent> selectSearchTitle(Connection con, int currentPage, int limit, String keyword, int category) {
		ArrayList<ReviewRent> list = new ArrayList<ReviewRent>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = null;

		
		if(category==1) {
			query = "select * from RentReview where ROWNUM >= ? AND ROWNUM <= ? and rr_subject like ? order by rr_num asc";
		}else if(category==2) {
			query = "select * from RentReview where ROWNUM >= ? AND ROWNUM <= ? and rr_writer like ? order by rr_num asc";
		}
		
		
		
		
		int startRow = (currentPage-1) * limit;
		int endRow = currentPage * limit;
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, "%"+keyword+"%");


			rset=pstmt.executeQuery();
			
			while(rset.next()) {				

				ReviewRent rr = new ReviewRent();
				rr.setRr_num(rset.getInt("rr_num"));
				rr.setRr_subject(rset.getString("rr_subject"));
				rr.setRr_writer(rset.getString("rr_writer"));
				rr.setRr_content(rset.getString("rr_content"));
				rr.setRr_original_filename(rset.getString("rr_original_filename"));
				rr.setRr_original_filename(rset.getString("rr_rename_filename"));
				rr.setRr_date(rset.getDate("rr_date"));
				rr.setRr_hits(rset.getInt("rr_hits"));
				list.add(rr);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;

		

	}
	public ReviewRent selectReviewRent(Connection con, int rr_num) {
		
		
		ReviewRent ReviewRent = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from RentReview where rr_num=?";				
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, rr_num);
			
			rset=pstmt.executeQuery();	
			if(rset.next()) {
				ReviewRent = new ReviewRent();
				ReviewRent.setRr_num(rset.getInt("rr_num"));
				ReviewRent.setRr_subject(rset.getString("rr_subject"));
				ReviewRent.setRr_writer(rset.getString("rr_writer"));
				ReviewRent.setRr_content(rset.getString("rr_content"));
				ReviewRent.setRr_original_filename(rset.getString("rr_original_filename"));
				ReviewRent.setRr_rename_filename(rset.getString("rr_rename_filename"));
				ReviewRent.setRr_date(rset.getDate("rr_date"));
				ReviewRent.setRr_hits(rset.getInt("rr_hits"));
				//System.out.println(notice.toString());
			}			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return ReviewRent;
	}


	public int insertReviewRentComment(Connection con, ReviewRentComment rc) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "insert into reviewcomment values (" 
				+ "((select COALESCE(MAX(rc_num), 0) from reviewcomment) + 1), "
				+ "?,?,sysdate,?)";
		

		try {
			

			pstmt = con.prepareStatement(query);

			pstmt.setString(1, rc.getRc_writer()); 
			pstmt.setString(2, rc.getRc_content()); 
			pstmt.setInt(3, rc.getRc_parent_num()); 
			
			System.out.print("asdasdasdasd"+rc.getRc_content());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			
			
			
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}		
		return result;
	}
	
	public int insertReviewRent(Connection con, ReviewRent ReviewRent) {
		int result = 0;
		PreparedStatement pstmt = null;
		

		
		String query = "insert into rentreview values (" 
				+ "((select COALESCE(MAX(rr_num), 0) from rentreview) + 1), "
				+ "?,?,?,?,?,?,sysdate)";
		

		try {
			

			pstmt = con.prepareStatement(query);

			System.out.println("getRr_original_filename : "+ReviewRent.getRr_original_filename());
			
			pstmt.setString(1, ReviewRent.getRr_subject()); 
			pstmt.setString(2, ReviewRent.getRr_writer()); 
			pstmt.setString(3, ReviewRent.getRr_content()); 
			pstmt.setString(4, ReviewRent.getRr_original_filename());
			pstmt.setString(5, ReviewRent.getRr_rename_filename());
			pstmt.setInt(6, ReviewRent.getRr_hits());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			
			
			
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}		
		return result;
	}
	
	public int updateReviewRent(Connection con, ReviewRent ReviewRent, int rr_num) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = null;			
		
		if(ReviewRent.getRr_original_filename() != null) { //첨부파일 변경시...
			query = "update RentReview set rr_subject = ?,"
					+ "rr_content = ?,"
					+ "rr_original_filename = ?,"
					+ "rr_rename_filename = ? "
					+ "where rr_num = ?";
		} else { //첨부 파일이 변경되지 않았다면...
			query = "update RentReview set rr_subject = ?,"
					+ "rr_content = ? "					
					+ "where rr_num = ?";
		}
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ReviewRent.getRr_subject());
			System.out.print("asdsdsdsdsd" + ReviewRent.getRr_subject());
			pstmt.setString(2, ReviewRent.getRr_content());
			
			if(ReviewRent.getRr_original_filename() != null) {
				pstmt.setString(3, ReviewRent.getRr_original_filename());
				pstmt.setString(4, ReviewRent.getRr_rename_filename());
				pstmt.setInt(5, rr_num);				
			} else {
				pstmt.setInt(3, rr_num);
			}
			result = pstmt.executeUpdate();	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteReviewRent(Connection con, int rr_num) {
	
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = "delete from RentReview where rr_num = ? ";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, rr_num);
			
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	

	
	public List<ReviewRent> selectSearchDate(Connection con, Date start, Date end) {
		List<ReviewRent> list = new ArrayList<ReviewRent>();		
		
		return list;
	}
	
	public List<ReviewRent> selectSearchWriter(Connection con, String keyword) {
		List<ReviewRent> list = new ArrayList<ReviewRent>();		
		
		return list;
	}
}
