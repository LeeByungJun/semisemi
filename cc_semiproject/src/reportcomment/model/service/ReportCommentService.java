package reportcomment.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import reportcomment.model.dao.ReportCommentDao;
import reportcomment.model.vo.ReportComment;
import static common.JDBCTemplate.*;

public class ReportCommentService {

	//댓글테이블의 모든 목록조회 - select문
	public ArrayList<ReportComment> selectAllCommentList() {
		Connection con = getConnection();
		ArrayList<ReportComment> list = new ReportCommentDao().selectCommentAllList(con);
		close(con);		
		return list;
	}
	
	//신규 댓글등록을 하여 댓글 테이블에 추가됨 - insert 
	public int addComment(ReportComment rc) {
		Connection con = getConnection();
		int result = new ReportCommentDao().addComment(con,rc);
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}
	
	//기존 댓글을 삭제하는 메소드 - delete
	public int deleteComment(int reportCommentNo) {
		Connection con = getConnection();
		int result = new ReportCommentDao().deleteComment(con,reportCommentNo);
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}

	//댓글 고유번호로 ReportComment객체를 조회 - select 
	public ReportComment checkReply(int checkReplyNo) {
		Connection con = getConnection();
		ReportComment rec = new ReportCommentDao().checkReply(con,checkReplyNo);
		close(con);
		return rec;
	}

	//댓글객체를 전달하여 해당객체의 있는 내용으로수정하기 - update 
	public int realUpdateCommit(ReportComment rec) {
		Connection con = getConnection();
		int result = new ReportCommentDao().realUpdateCommit(con,rec);
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}

	//댓글 목록의 총 갯수를 불러온다. - select문
	public int getCommentListCount(int reportNo) {
		Connection con = getConnection();
		int result = new ReportCommentDao().getCommentListCount(con,reportNo);
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}

	//페이징처리를 하여 전체 목록을 불러옴(ArrayList)
	public ArrayList<ReportComment> selectAllCommentList2(int ccurrentPage, int commentlimit, int reportNo) {
		Connection con = getConnection();
		ArrayList<ReportComment> list = new ReportCommentDao().selectCommentAllList2(con,ccurrentPage,commentlimit,reportNo);
		close(con);	
		return list;
	}

	//신규 댓글등록을(Ajax) 적 하여 댓글 테이블에 추가됨 - insert
	public int insertComment(ReportComment rc) {
		Connection con = getConnection();
		int result = new ReportCommentDao().addComment(con,rc);
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}

	//기존댓글을 바로 수정(Ajax)적용 - update
	public int renewCommnet(ReportComment rc) {
		Connection con = getConnection();
		int result = new ReportCommentDao().renewCommnet(con,rc);
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}

	

	
	
	
	
}









