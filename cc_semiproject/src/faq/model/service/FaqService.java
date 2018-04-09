package faq.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import faq.model.dao.FaqDao;
import faq.model.vo.Faq;

import static common.JDBCTemplate.*;

public class FaqService {
	public FaqService() {
		
	}

	public int getListCount() {
		Connection conn = getConnection();
		int listCount = new FaqDao().getListCount(conn);
		close(conn);
		return listCount;
	}

	public ArrayList<Faq> selectList(int currentPage, int limit) {
		Connection conn = getConnection();
		ArrayList<Faq> list = new FaqDao().selectList(conn,currentPage,limit);
		close(conn);
		return list;
	}

	public ArrayList<Faq> selectSearchList(String category) {
		Connection conn = getConnection();
		ArrayList<Faq> list = new FaqDao().selectSearchList(conn,category);
		close(conn);
		return list;
	}
	
	//관리자가 faq 상세보기를 했을 때 사용되는 메소드
	public Faq adminFaqDetail(int no) {
		Connection conn = getConnection();
		Faq f = new FaqDao().adminFaqDetail(conn,no);
		close(conn);
		return f;
	}

	//관리자가 FAQ 게시글 삭제했을 시 사용하는 메소드
	public int adminFaqDelete(int no) {
		Connection conn= getConnection();
		int result = new FaqDao().adminFaqDelete(conn,no);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	//관리자가 FAQ 게시글 수정했을 시 사용하는 메소드
	public int adminFaqUpdate(Faq f) {
		Connection conn = getConnection();
		int result = new FaqDao().adminFaqUpdate(conn,f);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	//관리자 faq 게시글 추가용 메소드
	public int adminFaqInsert(String category, String title, String contents) {
		Connection conn = getConnection();
		int result = new FaqDao().adminFaqInsert(conn,category,title,contents);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
