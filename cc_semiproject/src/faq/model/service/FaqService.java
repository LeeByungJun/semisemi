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
}
