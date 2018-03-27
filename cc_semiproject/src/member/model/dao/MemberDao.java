package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import member.model.vo.Member;
import static common.JDBCTemplate.*;

public class MemberDao {
	public MemberDao() {
		
	}

	public Member selectLogin(Connection conn, String email, String pwd) {
		// TODO Auto-generated method stub
		Member loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from member where email = ? and password = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				loginUser = new Member();
				
				loginUser.setMem_num(rs.getInt("mem_num"));
				loginUser.setEmail(rs.getString("email"));
				loginUser.setPassword(rs.getString("password"));
				loginUser.setName(rs.getString("name"));
				loginUser.setBirthday(rs.getString("birthday"));
				loginUser.setPhone(rs.getString("phone"));
				loginUser.setAddress(rs.getString("address"));
				loginUser.setCount(rs.getInt("count"));
				loginUser.setCansell(rs.getString("cansell"));
				loginUser.setG_Code(rs.getString("g_code"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return loginUser;
	}

	public int updatePwd(Connection conn, String to_email, StringBuffer sb) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update member set password = ? where email = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, sb.toString());
			pstmt.setString(2, to_email);
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int insertMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		/*MEM_NUM	NUMBER(5,0)
		EMAIL	VARCHAR2(50 BYTE)
		PASSWORD	VARCHAR2(250 BYTE)
		NAME	VARCHAR2(20 BYTE)
		BIRTHDAY	VARCHAR2(15 BYTE)
		PHONE	VARCHAR2(30 BYTE)
		ADDRESS	VARCHAR2(300 BYTE)
		COUNT	NUMBER(3,0)
		CANSELL	CHAR(1 BYTE)
		G_CODE	VARCHAR2(2 BYTE)*/
		String query = "insert into member values((select max(mem_num)+1 from member),?,?,?,?,?,?,default,default,'G4')";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getBirthday());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getAddress());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public String selectFindId(Connection conn, String username, String userbirth) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String userid = null;
		String query = "select email from member where name = ? and birthday = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, username);
			pstmt.setString(2, userbirth);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				userid = rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return userid;
	}

	public int updateMemberPwd(Connection conn, String to_email, String tempPwd) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update member set password = ? where email = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, tempPwd);
			pstmt.setString(2, to_email);
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}
