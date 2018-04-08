package notice.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;

public class NoticeService {
	
	public NoticeService() { //기본생성자 
		// TODO Auto-generated constructor stub
	}

	//전체 목록 갯수 조회 
	public int getListCount() {
		Connection con = getConnection();	
		int result = new NoticeDao().getListCount(con);
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}		
		return result;
	}
	
	//공지글의 전체목록 조회 + 페이징처리 - select문
	public ArrayList<Notice> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectList(con,currentPage,limit);
		close(con);
		return list;
	}
	
	//공지글 등록(운영자) - insert문
	public int insertNotice(Notice notice) {
		Connection con = getConnection();
		int result = new NoticeDao().insertNotice(con,notice);
		if(result>0) {
			close(con);
		}else {
			rollback(con);
		}
		return result;
	}
		
	//등록번호(PrimaryKey)고유값으로 Notice객체리턴 - select문
	public Notice selectNotice(int n_no) {
		Connection con =  getConnection();
		Notice notice = new NoticeDao().selectNotice(con,n_no);
		close(con);
		return notice;
	}
	
	//글을 클릭시 조횟수 1증가처리 - update문
	public void addReadCount(int noticeNo) {
		Connection con = getConnection();
		int result = new NoticeDao().addReadCount(con, noticeNo);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
	}

	//선택 공지글삭제 - delete문
	public int deleteNotice(int noticeNo) {
		Connection con = getConnection();
		int result = new NoticeDao().deleteNotice(con,noticeNo);
		if(result>0) {
			close(con);
		}else {
			rollback(con);
		}
		return result;
	}

	//////////////////////////////////////////////////////////
	//공지수정 - 공지번호(PrimaryKey)에 해당되는 객체수정 - update문
	public int updateNotice(Notice n) {
		Connection con = getConnection();
		int result = new NoticeDao().updateNotice(con, n);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}


	
	
}
