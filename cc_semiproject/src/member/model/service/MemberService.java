package member.model.service;

import member.model.dao.MemberDao;
import member.model.vo.Member;
import member.model.vo.MemberAdmin;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class MemberService {
	public MemberService() {

	}

	public Member selectLogin(String email, String pwd) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		Member loginUser = new MemberDao().selectLogin(conn, email, pwd);
		close(conn);
		return loginUser;
	}

	public int updatePwd(String to_email, StringBuffer sb) {
		Connection conn = getConnection();
		int result = new MemberDao().updatePwd(conn, to_email, sb);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int insertMember(Member member) {
		Connection conn = getConnection();
		int result = new MemberDao().insertMember(conn, member);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public String selectFindId(String username, String userbirth) {
		Connection conn = getConnection();
		String userid = new MemberDao().selectFindId(conn, username, userbirth);
		close(conn);
		return userid;
	}

	public int updateMemberPwd(String to_email, String sb) {
		// 임시 비밀번호로 유저 정보 갱신
		Connection conn = getConnection();
		int result = new MemberDao().updateMemberPwd(conn, to_email, sb);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// grade용 윤희누나 꺼 메소드
	public int updateMember(Member member) {
		Connection con = getConnection();
		int result = new MemberDao().updatetMember(con, member);
		if (result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public int deleteMember(String m_num) {
		Connection con = getConnection();
		int result = new MemberDao().deleteMember(con, m_num);
		if (result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public Member mypageSelect(String email) {
		Connection con = getConnection();
		Member member = new MemberDao().mypageSelect(con, email);
		close(con);
		return member;
	}

	// 관리자 페이지용 메소드들
	public ArrayList<MemberAdmin> selectAllMember() {
		Connection conn = getConnection();
		ArrayList<MemberAdmin> all = new MemberDao().selectAllMember(conn);
		close(conn);
		return all;
	}

	public ArrayList<MemberAdmin> selectCSMember() {
		Connection conn = getConnection();
		ArrayList<MemberAdmin> cansell = new MemberDao().selectCSMember(conn);
		close(conn);
		return cansell;
	}

	public ArrayList<MemberAdmin> selectCountMember() {
		Connection conn = getConnection();
		ArrayList<MemberAdmin> count = new MemberDao().selectCountMember(conn);
		close(conn);
		return count;
	}

	// 관리자 회원탈퇴 처리용 메소드
	public int adminDelMember(String email) {
		Connection conn = getConnection();
		int result = new MemberDao().adminDelMember(conn, email);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 신고카운트 증가
	public int addMemberReportCount(String addReporter) {
		Connection conn = getConnection();
		int result = new MemberDao().addMemberReportCount(conn, addReporter);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	//// 한진코드
	public void codeupdate(String email) {
		Connection conn = getConnection();
		Member g_rank = new MemberDao().codeupdate(conn, email);
		close(conn);
	}

	public int cansellUpdate(String email) {
		//cansell update 용 메소드
		Connection conn = getConnection();
		int result = new MemberDao().cansellUpdate(conn,email);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
