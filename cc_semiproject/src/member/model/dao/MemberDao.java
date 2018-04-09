package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import member.model.vo.Member;
import member.model.vo.MemberAdmin;

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
	
	//윤희 누나꺼 메소드 grade
	public int updatetMember(Connection con, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		System.out.println(member.getPhone());
		System.out.println(member.getAddress());
		System.out.println(member.getPassword());
		System.out.println(member.getMem_num());
		
		String query = "update member set phone = ?, address = ?, password = ? where mem_num = ?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member.getPhone());
			pstmt.setString(2, member.getAddress());
			pstmt.setString(3, member.getPassword());
			pstmt.setInt(4, member.getMem_num());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteMember(Connection con, String m_num) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "delete from member where mem_num = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m_num);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Member mypageSelect(Connection con, String email) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from member where email = ?";
		Member member = new Member();
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				//member = new Member();
				member.setMem_num(rs.getInt("mem_num"));
				member.setEmail(email);
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setBirthday(rs.getString("birthday"));
				member.setPhone(rs.getString("phone"));
				member.setAddress(rs.getString("address"));
				member.setCount(rs.getInt("count"));
				member.setCansell(rs.getString("cansell"));
				member.setG_Code(rs.getString("g_code"));
				System.out.println(member);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return member;
	}
	
	//관리자 회원관리용 메소드
	public ArrayList<MemberAdmin> selectAllMember(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<MemberAdmin> all = new ArrayList<MemberAdmin>();
		String query = "select mem_num,email,name,phone,address,count,cansell,g_rank"
				+ " from member m,grade g where m.G_CODE = g.G_CODE order by g_rank";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				MemberAdmin m = new MemberAdmin();			
				m.setMem_num(rs.getInt("mem_num"));
				m.setEmail(rs.getString("email"));
				m.setName(rs.getString("name"));
				m.setPhone(rs.getString("phone"));
				m.setAddress(rs.getString("address"));
				m.setCount(rs.getInt("count"));
				m.setCansell(rs.getString("cansell"));
				m.setG_Rank(rs.getString("g_rank"));
				
				all.add(m);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return all;
	}

	public ArrayList<MemberAdmin> selectCSMember(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<MemberAdmin> cansell = new ArrayList<MemberAdmin>();
		String query = "select mem_num,email,name,phone,address,count,cansell,g_rank"
				+ " from member m,grade g where m.G_CODE = g.G_CODE and cansell = 'Y'";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				MemberAdmin m = new MemberAdmin();			
				m.setMem_num(rs.getInt("mem_num"));
				m.setEmail(rs.getString("email"));
				m.setName(rs.getString("name"));
				m.setPhone(rs.getString("phone"));
				m.setAddress(rs.getString("address"));
				m.setCount(rs.getInt("count"));
				m.setCansell(rs.getString("cansell"));
				m.setG_Rank(rs.getString("g_rank"));
				
				cansell.add(m);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return cansell;
	}

	public ArrayList<MemberAdmin> selectCountMember(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<MemberAdmin> count = new ArrayList<MemberAdmin>();
		String query = "select mem_num,email,name,phone,address,count,cansell,g_rank"
				+ " from member m,grade g where m.G_CODE = g.G_CODE and count >= 1 order by count desc";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				MemberAdmin m = new MemberAdmin();			
				m.setMem_num(rs.getInt("mem_num"));
				m.setEmail(rs.getString("email"));
				m.setName(rs.getString("name"));
				m.setPhone(rs.getString("phone"));
				m.setAddress(rs.getString("address"));
				m.setCount(rs.getInt("count"));
				m.setCansell(rs.getString("cansell"));
				m.setG_Rank(rs.getString("g_rank"));
				
				count.add(m);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return count;
	}

	public int adminDelMember(Connection conn, String email) {
		//관리자 회원 삭제 처리용 메소드
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from member where email = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}
