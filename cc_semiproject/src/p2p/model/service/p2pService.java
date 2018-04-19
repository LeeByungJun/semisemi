package p2p.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import p2p.model.dao.p2pDao;
import p2p.model.vo.p2p;

public class p2pService {

	//p2p게시판의 게시글 전체목록의 갯수를 불러옴
	public int getP2PCount() {
		Connection con = getConnection();
		int result = new p2pDao().getP2PCount(con);
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}

	//P2P 페이지에 출력될 목록 조회 
	public ArrayList<p2p> selectP2PList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<p2p> list = new p2pDao().selectP2PList(con,currentPage,limit);
		close(con);
		return list;
	}

	//선택된 게시글의 상세보기 
	public p2p getp2pDetail(int board_no) {
		Connection con = getConnection();
		p2p p = new p2pDao().getp2pDetail(con,board_no);
		close(con);
		return p;
	}

	//p2p게시판글의 번호를 보내어 글을 삭제하기 
	public int delp2pWrite(int selectDelNo) {
		Connection con = getConnection();
		int delresult = new p2pDao().delp2pWrite(con,selectDelNo);
		if(delresult>0) {
			commit(con);
		}else {
			rollback(con);
		}
		return delresult;
	}

	//p2p게시판의 새로운 글 신규등록
	public int insertWrite(p2p p) {
		Connection con = getConnection();
		int insertresult = new p2pDao().insertWrite(con,p);
		if(insertresult>0) {
			commit(con);
		}else {
			rollback(con);
		}
		return insertresult;
	}

	//p2p게시판의 수정을 진행하는 메소드
	public int finalUpdate(p2p p2) {
		Connection con = getConnection();
		int finalresult = new p2pDao().finalUpdate(con,p2);
		if(finalresult>0) {
			commit(con);
		}else {
			rollback(con);
		}
		return finalresult;
	}


}

























