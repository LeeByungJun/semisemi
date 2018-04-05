package visit.model.service;

import java.sql.*;
import java.util.ArrayList;

import visit.model.dao.VisitDao;
import visit.model.vo.Visit;

import static common.JDBCTemplate.*;

public class VisitService {
	public VisitService() {
		
	}

	public void setVisitCount() {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		int result = new VisitDao().setVisitCount(conn);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
	}

	public int todayCount() {
		Connection conn = getConnection();
		int todayCount = new VisitDao().todayCount(conn);
		close(conn);
		return todayCount;
	}

	public ArrayList<Visit> totalCount() {
		//차트용 데이터 수집
		Connection conn = getConnection();
		ArrayList<Visit> totalCount = new VisitDao().totalCount(conn);
		close(conn);
		return totalCount;
	}
}
