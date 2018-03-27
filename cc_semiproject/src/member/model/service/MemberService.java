package member.model.service;

import member.model.dao.MemberDao;
import member.model.vo.Member;
import static common.JDBCTemplate.*;

import java.sql.Connection;

public class MemberService {
	public MemberService() {
		
	}

	public Member selectLogin(String email, String pwd) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		Member loginUser = new MemberDao().selectLogin(conn,email,pwd);
		close(conn);
		return loginUser;
	}

	public int updatePwd(String to_email, StringBuffer sb) {
		Connection conn = getConnection();
		int result = new MemberDao().updatePwd(conn,to_email,sb);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int insertMember(Member member) {
		Connection conn = getConnection();
		int result = new MemberDao().insertMember(conn,member);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public String selectFindId(String username, String userbirth) {
		Connection conn = getConnection();
		String userid = new MemberDao().selectFindId(conn,username,userbirth);
		close(conn);
		return userid;
	}

	public int updateMemberPwd(String to_email, StringBuffer sb) {
		//임시 비밀번호로 유저 정보 갱신
		Connection conn = getConnection();
		int result = new MemberDao().updateMemberPwd(conn,to_email,sb.toString());
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
