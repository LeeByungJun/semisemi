package member.model.dao;

import java.sql.Connection;

import member.model.vo.Member;

public class MemberDao {
	public MemberDao() {
		
	}

	public Member selectLogin(Connection conn, String email, String pwd) {
		// TODO Auto-generated method stub
		Member loginUser = null;
		return loginUser;
	}
}
