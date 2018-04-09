package grade.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static common.JDBCTemplate.*;
import grade.model.dao.GradeDao;
import grade.model.vo.Grade;

public class GradeService {
	public GradeService() {}

	public ArrayList<Grade> selectList() {
		Connection con = getConnection();
		ArrayList<Grade> list = new GradeDao().selectList(con);
		close(con);
		return list;
	}

	public Grade selectGrade(String g_code) {
		Connection con = getConnection();
		Grade grade = new GradeDao().selectGrade(con, g_code);
		close(con);
		return grade;
	}
	
}
