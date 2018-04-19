package rentreview.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import rentreview.model.dao.ReviewRentDao;
import rentreview.model.vo.ReviewRent;
import rentreview.model.vo.ReviewRentComment;


public class ReviewRentService {
	public ReviewRentService() { //기본생성자 
		// TODO Auto-generated constructor stub
	}
	
	//전체 목록 갯수 조회 
	public int getListTotal() {
		Connection con = getConnection();	
		int result = new ReviewRentDao().getListTotal(con);
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}		
		return result;
	}
	
	//전체 목록 갯수 조회 
	public int getCommentCount(int rr_num) {
		Connection con = getConnection();	
		int result = new ReviewRentDao().getCommentCount(con,rr_num);
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}		
		return result;
	}
	
	
	public ArrayList<ReviewRentComment> selectComment(int currentPage, int limit, int id) {
		Connection con = getConnection();
		ArrayList<ReviewRentComment> comment = new ReviewRentDao().selectComment(con,currentPage,limit,id);
		close(con);
		return comment;
	}
	
	
	public ArrayList<ReviewRent> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<ReviewRent> list = new ReviewRentDao().selectList(con,currentPage,limit);
		close(con);
		return list;
	}
	
	public ArrayList<ReviewRent> selectSearchTitle(int currentPage, int limit, String keyword, int category) {
		Connection con = getConnection();
		ArrayList<ReviewRent> list = new ReviewRentDao().selectSearchTitle(con, currentPage, limit, keyword, category);
		close(con);
		return list;
	}
	
	
	
	public ReviewRent selectReviewRent(int rr_num) {
		Connection con = getConnection();
		ReviewRent ReviewRent = new ReviewRentDao().selectReviewRent(con, rr_num);
		close(con);
				
		return ReviewRent;
	}
	
	
	public int insertReviewRentComment(ReviewRentComment ReviewRentComment) {
		Connection con = getConnection();
		int result = new ReviewRentDao().insertReviewRentComment(con, ReviewRentComment);
		
		System.out.print("insert reveiw rent comment");
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public int insertReviewRent(ReviewRent ReviewRent) {
		Connection con = getConnection();
		int result = new ReviewRentDao().insertReviewRent(con, ReviewRent);
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public int updateReviewRent(ReviewRent ReviewRent, int rr_num) {
		
		Connection con = getConnection();
		int result = new ReviewRentDao().updateReviewRent(con, ReviewRent, rr_num);
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}

	public int deleteReviewRent(int rr_num) {
	
		Connection con = getConnection();
		int result = new ReviewRentDao().deleteReviewRent(con, rr_num);
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}
	

	public List<ReviewRent> selectSearchDate(Date start, Date end) {
		
		Connection con = getConnection();
		List<ReviewRent> list = new ReviewRentDao().selectSearchDate(con, start, end);
		close(con);
		
		return list;
	}
	
	public List<ReviewRent> selectSearchWriter(String keyword) {
		
		Connection con = getConnection();
		List<ReviewRent> list = new ReviewRentDao().selectSearchWriter(con, keyword);
		close(con);
		
		return list;
	}

}

