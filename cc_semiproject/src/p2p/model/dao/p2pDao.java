package p2p.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import p2p.model.vo.p2p;

public class p2pDao {

	//p2p게시판의 게시글 전체목록의 갯수를 불러옴	
	public int getP2PCount(Connection con) {
		int result=0;
		Statement stmt = null;
		ResultSet rset = null;
		String  query = "select count(*) from p2p";
		
		try {
			stmt=con.createStatement();
			rset=stmt.executeQuery(query);
			
			if(rset.next()) {
				result=rset.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();			
		}finally {
			close(rset);
			close(stmt);			
		}
		return result;
	}
	
	//P2P 페이지에 출력될 목록 조회 
	public ArrayList<p2p> selectP2PList(Connection con, int currentPage, int limit) {
		ArrayList<p2p> list = new ArrayList<p2p>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from (select rownum rnum, p_num, p_board, p_sysdate, p_title, p_context, p_original_filename, p_rename_filename, p_image, p.mem_num, p.g_code,m.name,m.email from (select * from p2p order by p_board desc) p,member m where p.mem_num = m.mem_num) where rnum>=? and rnum<=?";
		int startRow = (currentPage-1)*limit+1; 
		int endRow = startRow+limit-1;
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset=pstmt.executeQuery();						
			while(rset.next()) {
				p2p p = new p2p();
				p.setP_num(rset.getInt("p_num"));
				p.setP_board(rset.getInt("p_board"));
				p.setP_sysdate(rset.getDate("p_sysdate"));
				p.setP_title(rset.getString("p_title"));
				p.setP_context(rset.getString("p_context"));
				p.setP_original_filename(rset.getString("p_original_filename"));
				p.setP_rename_filename(rset.getString("p_rename_filename"));
				p.setP_image(rset.getString("p_image"));
				p.setMem_num(rset.getInt("mem_num"));
				p.setG_code(rset.getString("g_code"));
				p.setName(rset.getString("name"));
				p.setEmail(rset.getString("email"));
				list.add(p);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	//선택된 게시글의 상세보기 
	public p2p getp2pDetail(Connection con, int board_no) {
		p2p p = null;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String query = "select * from p2p where p_board=?";
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, board_no);
			rset=pstmt.executeQuery();
			/*P_NUM	p2p고객번호
			P_BOARD	게시판번호
			P_SYSDATE	작성일
			P_TITLE	제목
			P_CONTEXT	설명
			P_ORIGINAL_FILENAME	첨부파일
			P_RENAME_FILENAME	선정기준
			P_IMAGE	이미지
			MEM_NUM	회원번호
			G_CODE	등급번호*/
			if(rset.next()) {
				p = new p2p();
				p.setP_num(rset.getInt("p_num"));
				p.setP_board(board_no);
				p.setP_sysdate(rset.getDate("p_sysdate"));
				p.setP_title(rset.getString("p_title"));
				p.setP_context(rset.getString("p_context"));
				p.setP_original_filename(rset.getString("p_original_filename"));
				p.setP_rename_filename(rset.getString("p_rename_filename"));
				p.setP_image(rset.getString("p_image"));
				p.setMem_num(rset.getInt("mem_num"));
				p.setG_code(rset.getString("g_code"));				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}

	
	//p2p게시판글의 번호를 보내어 글을 삭제하기 
	public int delp2pWrite(Connection con, int selectDelNo) {
		int delresult=0;
		PreparedStatement pstmt=null;
		String delquery = "delete from p2p where p_board=?";
		
		try {
			pstmt=con.prepareStatement(delquery);
			pstmt.setInt(1, selectDelNo);
			delresult=pstmt.executeUpdate();
			System.out.println("1개의 행의 삭제가 완료되었습니다.");
		}catch(Exception e){
			e.printStackTrace();		
		}finally {
			close(pstmt);
		}
		return delresult;
	}

	//p2p게시판의 새로운 글 신규등록
	public int insertWrite(Connection con, p2p p) {
		int result=0;
		PreparedStatement pstmt=null;
		String insertquery = "insert into p2p values((select max(p_num)+1 from p2p),(select max(p_board)+1 from p2p), sysdate, ?, ?, ?, ?, ?, ?, 'G4')";
		
		try {
			pstmt=con.prepareStatement(insertquery);
			pstmt.setString(1, p.getP_title());
			pstmt.setString(2, p.getP_context());
			pstmt.setString(3, p.getP_original_filename());
			pstmt.setString(4, p.getP_rename_filename());
			pstmt.setString(5, p.getP_image());
			pstmt.setInt(6, p.getMem_num());
			result=pstmt.executeUpdate();
			System.out.println("이미지 저장경로 출력 : "+p.getP_image());
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	//p2p게시판의 수정을 진행하는 메소드
	public int finalUpdate(Connection con, p2p p2) {
		int result=0;
		PreparedStatement pstmt=null;
		String query = "update p2p set p_title=?, p_context=?, p_image=? where p_board=?";
		
		//boardNo, ptitle, pcontents, imageRoot
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, p2.getP_title());
			pstmt.setString(2, p2.getP_context());
			pstmt.setString(3, p2.getP_image());
			pstmt.setInt(4, p2.getP_board());
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	/*
	P_NUM	p2p고객번호
	P_BOARD	게시판번호
	P_SYSDATE	작성일
	P_TITLE	제목
	P_CONTEXT	설명
	P_ORIGINAL_FILENAME	첨부파일
	P_RENAME_FILENAME	리네임
	P_IMAGE	이미지
	MEM_NUM	회원번호
	G_CODE	등급번호*/


	
	
	
	
/*	p.setP_title(ptitle);
	p.setP_context(pcontents);
	p.setP_image(imageRoot);
	p.setP_original_filename(originFileName);
	p.setP_rename_filename(renameFileName);	*/	

	
}










