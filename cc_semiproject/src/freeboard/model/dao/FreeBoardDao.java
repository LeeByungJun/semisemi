package freeboard.model.dao;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import static common.JDBCTemplate.*;

import freeboard.model.vo.FreeBoard;
import freeboard.model.vo.FreeBoardComment;

public class FreeBoardDao {
	
	public FreeBoardDao() {}

	
	//전체 목록 갯수 조회 select문 
	public int getListCount(Connection con) {
		int listCount=0;
		Statement stmt = null;
		ResultSet rset = null;
		String qurey = "select count(*) from FreeBoard";
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
	public int getCommentCount(Connection con,int fb_num) {
		int listCount=0;
		Statement stmt = null;
		ResultSet rset = null;
		String qurey = "select count(*) from FreeBoardComment";
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
	public ArrayList<FreeBoardComment> selectComment(Connection con, int currentPage, int limit, int fb_num) {
		ArrayList<FreeBoardComment> comment_list = new ArrayList<FreeBoardComment>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;


		String query = "select * from FreeBoardComment where ROWNUM >= ? AND ROWNUM <= ? AND fbc_parent_num = ? order by fbc_num asc";
		

		int startRow = (currentPage-1) * limit;
		int endRow = currentPage * limit;
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, fb_num);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {				

				FreeBoardComment fbc = new FreeBoardComment();
				fbc.setFbc_num(rset.getInt("fbc_num"));
				fbc.setFbc_parent_num(fb_num);							
				fbc.setFbc_writer(rset.getString("fbc_writer"));
				fbc.setFbc_content(rset.getString("fbc_content"));
				fbc.setFbc_date(rset.getDate("fbc_date"));
				
				comment_list.add(fbc);
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
	public ArrayList<FreeBoard> selectList(Connection con, int currentPage, int limit) {
		ArrayList<FreeBoard> list = new ArrayList<FreeBoard>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;


		String query = "select * from FreeBoard where ROWNUM >= ? AND ROWNUM <= ? order by fb_num asc";
		
		int startRow = (currentPage-1) * limit;
		int endRow = currentPage * limit;
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);


			rset=pstmt.executeQuery();
			
			while(rset.next()) {				

				FreeBoard fb = new FreeBoard();
				

				fb.setFb_num(rset.getInt("fb_num"));
				fb.setFb_subject(rset.getString("fb_subject"));
				fb.setFb_writer(rset.getString("fb_writer"));
				fb.setFb_content(rset.getString("fb_content"));
				fb.setFb_date(rset.getDate("fb_date"));
				fb.setFb_hits(rset.getInt("fb_hits"));
				list.add(fb);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;

		


	}
	public ArrayList<FreeBoard> selectSearchTitle(Connection con, int currentPage, int limit, String keyword, int category) {
		ArrayList<FreeBoard> list = new ArrayList<FreeBoard>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = null;

		
		if(category==1) {
			query = "select * from FreeBoard where ROWNUM >= ? AND ROWNUM <= ? and fb_subject like ? order by fb_num asc";
		}else if(category==2) {
			query = "select * from FreeBoard where ROWNUM >= ? AND ROWNUM <= ? and fb_writer like ? order by fb_num asc";
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

				FreeBoard fb = new FreeBoard();
				fb.setFb_num(rset.getInt("fb_num"));
				fb.setFb_subject(rset.getString("fb_subject"));
				fb.setFb_writer(rset.getString("fb_writer"));
				fb.setFb_content(rset.getString("fb_content"));
				fb.setFb_date(rset.getDate("fb_date"));
				fb.setFb_hits(rset.getInt("fb_hits"));
				list.add(fb);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;

		

	}
	public FreeBoard selectFreeBoard(Connection con, int fb_num) {
		
		
		FreeBoard FreeBoard = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from FreeBoard where fb_num=?";				
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, fb_num);
			
			rset=pstmt.executeQuery();	
			if(rset.next()) {
				FreeBoard = new FreeBoard();
				FreeBoard.setFb_num(rset.getInt("fb_num"));
				FreeBoard.setFb_subject(rset.getString("fb_subject"));
				FreeBoard.setFb_writer(rset.getString("fb_writer"));
				FreeBoard.setFb_content(rset.getString("fb_content"));
				FreeBoard.setFb_date(rset.getDate("fb_date"));
				FreeBoard.setFb_hits(rset.getInt("fb_hits"));
			}			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return FreeBoard;
	}


	public int insertFreeBoardComment(Connection con, FreeBoardComment fbc) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "insert into FreeBoardComment values (" 
				+ "((select COALESCE(MAX(fbc_num), 0) from FreeBoardComment) + 1), "
				+ "?,?,sysdate,?)";
		

		try {
			

			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "12313"); 
			pstmt.setString(2, fbc.getFbc_content()); 
			pstmt.setInt(3, fbc.getFbc_parent_num()); 
			
			//System.out.print("asdasdasdasd"+fbc.getFbc_content());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			
			
			
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}		
		return result;
	}
	
	public int insertFreeBoard(Connection con, FreeBoard FreeBoard) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into FreeBoard values (" 
				+ "((select COALESCE(MAX(fb_num), 0) from FreeBoard) + 1), "
				+ "?,?,?,0,sysdate)";
		

		try {
			

			pstmt = con.prepareStatement(query);


			pstmt.setString(1, FreeBoard.getFb_subject()); 
			pstmt.setString(2, FreeBoard.getFb_writer()); 
			pstmt.setString(3, FreeBoard.getFb_content()); 


			result = pstmt.executeUpdate();
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}		
		return result;
	}
	
	public int updateFreeBoard(Connection con, FreeBoard FreeBoard, int fb_num) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = "update FreeBoard set fb_subject = ?,"
					+ "fb_content = ? "					
					+ "where fb_num = ?";
		 
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, FreeBoard.getFb_subject());
			System.out.print("asdsdsdsdsd" + FreeBoard.getFb_subject());
			pstmt.setString(2, FreeBoard.getFb_content());
			pstmt.setInt(3, fb_num);
			/*if(FreeBoard.getRr_original_filename() != null) {
				pstmt.setString(3, ReviewRent.getRr_original_filename());
				pstmt.setString(4, ReviewRent.getRr_rename_filename());
				pstmt.setInt(5, rr_num);				
			} else {
				pstmt.setInt(3, rr_num);
			}*/
			result = pstmt.executeUpdate();	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteFreeBoard(Connection con, int fb_num) {
	
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = "delete from FreeBoard where fb_num = ? ";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, fb_num);
			
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	

	
	public List<FreeBoard> selectSearchDate(Connection con, Date start, Date end) {
		List<FreeBoard> list = new ArrayList<FreeBoard>();		
		
		return list;
	}
	
	public List<FreeBoard> selectSearchWriter(Connection con, String keyword) {
		List<FreeBoard> list = new ArrayList<FreeBoard>();		
		
		return list;
	}
}
