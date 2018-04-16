package grade.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import static common.JDBCTemplate.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import grade.model.vo.Grade;

public class GradeDao {
	public GradeDao() {
	}

	public ArrayList<Grade> selectList(Connection con) {
		ArrayList<Grade> list = new ArrayList<Grade>();

		Grade g = null;
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select * from grade";

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			while (rset.next()) {
				g = new Grade();
				g.setG_code(rset.getString("g_code"));
				g.setG_rank(rset.getString("g_rank"));
				g.setG_rate(rset.getInt("g_rate"));
				g.setG_comment(rset.getString("g_comments"));
				g.setG_comment2(rset.getString("g_comments2"));

				list.add(g);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	public Grade selectGrade(Connection con, String g_code) {

		System.out.println(g_code);
		Grade grade = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select grade.g_rank from member, grade where member.g_code = grade.g_code and member.g_code = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, g_code);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				grade = new Grade();
				grade.setG_code(g_code);
				grade.setG_rank(rset.getString("g_rank"));
				// grade.setG_rate(rset.getInt("g_rate"));
				// grade.setG_comment(rset.getString("g_comment"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return grade;
	}

}
