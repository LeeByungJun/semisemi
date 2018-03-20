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
}
