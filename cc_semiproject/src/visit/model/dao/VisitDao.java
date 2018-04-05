package visit.model.dao;

import java.sql.*;
import java.util.ArrayList;

import visit.model.vo.Visit;

import static common.JDBCTemplate.*;

public class VisitDao {
	public VisitDao() {
		
	}

	public int todayCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		int todayCount = 0;
		String query = "select count(v_date) from visit where to_date(v_date,'YYYY-MM-DD') = to_date(sysdate,'YYYY-MM-DD')";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			if(rs.next()) {
				todayCount = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return todayCount;
	}

	public int setVisitCount(Connection conn) {
		//방문자 수 증가용 메소드
		Statement stmt = null;
		int result = 0;
		String query = "insert into visit values (sysdate)";
		
		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(query);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(stmt);
		}
		return result;
	}

	public ArrayList<Visit> totalCount(Connection conn) {
		//누적 방문자 수 구하는 메소드
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Visit> totalCount = new ArrayList<Visit>();
		Visit v = null;
		String query = "select vcount,vdate from (select count(to_date(v_date,'YY-MM-DD')) as vcount,to_date(v_date,'YY-MM-DD') as vdate"
				+ " from visit group by to_date(v_date,'YY-MM-DD') order by to_date(v_date,'YY-MM-DD') desc)"
				+ " where rownum <= 5";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				v = new Visit();
				v.setVisitDate(rs.getDate(2).toString());
				v.setVisitCount(rs.getInt(1));
				
				totalCount.add(v);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return totalCount;
	}
}
