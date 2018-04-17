package freeboard.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import freeboard.model.dao.FreeBoardDao;
import freeboard.model.vo.FreeBoard;
import freeboard.model.vo.FreeBoardComment;


public class FreeBoardService {
	public FreeBoardService() { //기본생성자 
		// TODO Auto-generated constructor stub
	}
	
	//전체 목록 갯수 조회 
	public int getListCount() {
		Connection con = getConnection();	
		int result = new FreeBoardDao().getListCount(con);
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}		
		return result;
	}
	
	//전체 목록 갯수 조회 
	public int getCommentCount(int fb_num) {
		Connection con = getConnection();	
		int result = new FreeBoardDao().getCommentCount(con,fb_num);
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}		
		return result;
	}
	
	
	public ArrayList<FreeBoardComment> selectComment(int currentPage, int limit, int id) {
		Connection con = getConnection();
		ArrayList<FreeBoardComment> comment = new FreeBoardDao().selectComment(con,currentPage,limit,id);
		close(con);
		return comment;
	}
	
	
	public ArrayList<FreeBoard> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<FreeBoard> list = new FreeBoardDao().selectList(con,currentPage,limit);
		close(con);
		return list;
	}
	
	public ArrayList<FreeBoard> selectSearchTitle(int currentPage, int limit, String keyword, int category) {
		Connection con = getConnection();
		ArrayList<FreeBoard> list = new FreeBoardDao().selectSearchTitle(con, currentPage, limit, keyword, category);
		close(con);
		return list;
	}
	
	
	
	public FreeBoard selectFreeBoard(int fb_num) {
		Connection con = getConnection();
		FreeBoard FreeBoard = new FreeBoardDao().selectFreeBoard(con, fb_num);
		close(con);
				
		return FreeBoard;
	}
	
	
	public int insertFreeBoardComment(FreeBoardComment FreeBoardComment) {
		Connection con = getConnection();
		int result = new FreeBoardDao().insertFreeBoardComment(con, FreeBoardComment);
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}
	
	public int insertFreeBoard(FreeBoard FreeBoard) {
		Connection con = getConnection();
		int result = new FreeBoardDao().insertFreeBoard(con, FreeBoard);
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}
	
	public int updateFreeBoard(FreeBoard FreeBoard, int fb_num) {
		
		Connection con = getConnection();
		int result = new FreeBoardDao().updateFreeBoard(con, FreeBoard, fb_num);
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}

	public int deleteFreeBoard(int fb_num) {
	
		Connection con = getConnection();
		int result = new FreeBoardDao().deleteFreeBoard(con, fb_num);
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}
	

	public List<FreeBoard> selectSearchDate(Date start, Date end) {
		
		Connection con = getConnection();
		List<FreeBoard> list = new FreeBoardDao().selectSearchDate(con, start, end);
		close(con);
		
		return list;
	}
	
	public List<FreeBoard> selectSearchWriter(String keyword) {
		
		Connection con = getConnection();
		List<FreeBoard> list = new FreeBoardDao().selectSearchWriter(con, keyword);
		close(con);
		
		return list;
	}

}

