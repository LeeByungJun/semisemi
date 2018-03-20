package notice.model.service;

import java.sql.Connection;
import java.util.List;
import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;
import static common.JDBCTemplate.*;

public class NoticeService {
	
	public NoticeService() { //기본생성자 
		// TODO Auto-generated constructor stub
	}
	
	//공지글의 전체목록 조회
	public List<Notice> selectList(){
		Connection con = getConnection();
		List<Notice> list = new NoticeDao().selectList(con);
		close(con);	
		return list;		
	}
		
	//공지번호로 내용조회 - 공지번호(PrimaryKey)
	public Notice selectNotice(int n_no) {
		Connection con =  getConnection();
		Notice notice = new NoticeDao().selectNotice(con,n_no);
		close(con);
		return notice;
	}
	
	//공지글 등록(운영자)
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
	
	//공지글 수정,업데이트(운영자)
	
	//공지글 삭제 
	
	//키워드로 리스트 검색
	
	//날짜로 리스트 검색 
	
}
