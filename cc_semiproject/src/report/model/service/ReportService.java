package report.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import report.model.dao.ReportDao;
import report.model.vo.Report;

public class ReportService {

	// 기본생성자 선언
	public ReportService() {
		// TODO Auto-generated constructor stub
	}

	// 공지글의 전체목록 조회 + 페이징처리 - select문
	public ArrayList<Report> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Report> list = new ReportDao().selectList(con, currentPage, limit);
		close(con);
		return list;
	}

	// 불량고객 식고 게시판전체 목록 갯수 조회
	public int getListCount() {
		Connection con = getConnection();
		int result = new ReportDao().getListCount(con);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	// 불량고객 신고 게시판 이메일 검색 목록 갯수 조회
	public int getEmailListCount(String email) {
		Connection con = getConnection();
		int result = new ReportDao().getEmailListCount(con,email);
		close(con);
		return result;
	}

	// 불량고객 신고 게시판 제목 검색 목록 갯수 조회
	public int getTitleListCount(String title) {
		Connection con = getConnection();
		int result = new ReportDao().getTitleListCount(con,title);
		close(con);
		return result;
	}

	// 글을 클릭시 조횟수 1증가처리 - update문
	public void addReadCount(int reportNo) {
		Connection con = getConnection();
		int result = new ReportDao().addReadCount(con, reportNo);
		if (result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
	}

	// 등록번호(PrimaryKey)고유값으로 Report객체리턴 - select문
	public Report selectReport(int reportNo) {
		Connection con = getConnection();
		Report report = new ReportDao().selectReport(con, reportNo);
		close(con);
		return report;
	}

	// 새로운 글 등록 - insert문
	public int insertReport(Report report) {
		Connection con = getConnection();
		int result = new ReportDao().insertReport(con, report);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	// 기존의 글 삭제 - delete문
	public int deleteReport(int reportNo) {
		Connection con = getConnection();
		int result = new ReportDao().deleteReport(con, reportNo);
		if (result > 0) {
			close(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	// 기존의 글 수정 - update문
	public int updateReport(Report rp) {
		Connection con = getConnection();
		int result = new ReportDao().updateReport(con, rp);
		if (result > 0) {
			close(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	// 이메일로 검색해서 결과 리스트로 받아오기
	public ArrayList<Report> searchByEmail(String inputsearch,int limit) {
		Connection con = getConnection();
		ArrayList<Report> list = new ReportDao().searchByEmail(con, inputsearch, limit);
		close(con);
		return list;
	}

	// 글 제목으로 검색하여 결과 받아오기
	public ArrayList<Report> searchByTitle(String inputsearch, int limit) {
		Connection con = getConnection();
		ArrayList<Report> list = new ReportDao().searchByTitle(con, inputsearch, limit);
		close(con);
		return list;
	}

	// 게시글 목록중 조회수가 가장 많은 Top4 가져오기 - select
	public ArrayList<Report> getTop4List() {
		Connection con = getConnection();
		ArrayList<Report> list2 = new ReportDao().getTop4List(con);
		close(con);
		return list2;
	}

}
