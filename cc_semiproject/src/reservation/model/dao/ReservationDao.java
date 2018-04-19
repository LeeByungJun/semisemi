package reservation.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import reservation.model.vo.CarInsurance;
import reservation.model.vo.CarType;
import reservation.model.vo.NoMemberReservation;
import reservation.model.vo.ReservationList;
import visit.model.vo.Visit;

import static common.JDBCTemplate.*;


public class ReservationDao {

	private Properties prop;

	
	
	public int insertNoMeberReservation(Connection con, NoMemberReservation nmreservation, CarType ct, CarInsurance ci) {
			int result = 0;
			PreparedStatement pstmt = null;
		
			
				
			String query= "insert into nomemberreservation values ((select max(NORESERVATIONNUMBER)+1 from nomemberreservation),"
					+ "(select car_serial_number from cartype where carname=?),"
					+ "(select carinsurance_no from carinsurance where carinsurance_name=?),"
					+ "?,?,?,?,?,?,?,?,sysdate,?,((select carprice from cartype where carname=?)"
					+ "+(select carinsurance_price from carinsurance where carinsurance_name=?))*(to_date(?)-to_date(?)+1))"; 
			
		
			try {
						
				pstmt=con.prepareStatement(query);	
				
				System.out.println("DAO단"+ct.getCarName());
				
				pstmt.setString(1, ct.getCarName());
				pstmt.setString(2, ci.getCarInsurnace_Name());
				pstmt.setString(3, nmreservation.getNoMemberName());
				pstmt.setInt(4, nmreservation.getNoMemberAge());
				pstmt.setString(5, nmreservation.getNoMemberGender());
				pstmt.setString(6, nmreservation.getNoMemberEmail());
			    pstmt.setString(7, nmreservation.getNoMemberNumber());
			    pstmt.setString(8, nmreservation.getNoMemberTell());
			        
				pstmt.setDate(9, nmreservation.getCarStartDate());
				pstmt.setDate(10, nmreservation.getCarEndDate());
				
				pstmt.setString(11, nmreservation.getCarNote());			
				
				pstmt.setString(12,ct.getCarName());
				pstmt.setString(13, ci.getCarInsurnace_Name());
				
				pstmt.setDate(14, nmreservation.getCarEndDate());
				
				pstmt.setDate(15, nmreservation.getCarStartDate());
				
				
				
				
		       /* pstmt.setDate(9, nmreservation.getCarStartDate());
		        pstmt.setDate(10, nmreservation.getCarEndDate());
		        pstmt.setString(11, nmreservation.getCarNote());
		        pstmt.setInt(12, nmreservation.getCarPrice());*/
		       
				
		        result = pstmt.executeUpdate();
		        
		        
		        
		        
			} catch (Exception e) {
				e.printStackTrace();
			
			}finally {
				close(pstmt);
			}
			
			
		return result;
	}



	public ArrayList<CarType> carTypeList(Connection con, int num) {
		ArrayList<CarType> list = new ArrayList<CarType>();
		
		PreparedStatement pstmt = null;
		//Statement stmt = null;
		ResultSet rset = null;
		
		String query="select * from cartype where cartype_no=?";
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			//System.out.println("daodaodaodaoadoadoadoadoado");
			
			rset = pstmt.executeQuery();
		    while(rset.next()){
		    	//System.out.println("daodaodaodaoadoadoadoadoado");
	        	CarType ct=new CarType();
	        	
	        	ct.setCar_Serial_Number(rset.getInt("CAR_SERIAL_NUMBER"));
	        	ct.setCarType_No(rset.getInt("CARTYPE_NO"));
	        	ct.setCarName(rset.getString("CARNAME"));
	        	ct.setCarNum(rset.getInt("CARNUM"));
	        	ct.setCarPrice(rset.getInt("CARPRICE"));
	        	ct.setCarInformation(rset.getString("CARINFORMATION"));
	        	ct.setCarCompany(rset.getString("CARCOMPANY"));
			
	        	list.add(ct);
	        	System.out.println("DAO--------"+list.get(0).toString());
	        }
			
		} catch (Exception e) {
			e.printStackTrace();
		
		}finally {
			close(rset);
			close(pstmt);	
			
		}
		
		
		return list;
	}



	public ArrayList<CarInsurance> insuranceList(Connection con) {
		
		ArrayList<CarInsurance> list=new ArrayList<CarInsurance>();
		
		Statement stmt= null;
		ResultSet rset= null;
		
		String query="select * from carinsurance";
		
		try {
			stmt=con.createStatement();
			rset=stmt.executeQuery(query);
			
			while(rset.next()) {
				CarInsurance ins=new CarInsurance();
				
				ins.setCarInsurance_No(rset.getInt("carinsurance_no"));
				ins.setCarInsurnace_Name(rset.getString("carinsurance_name"));	
				ins.setCarInsurance_Information(rset.getString("carinsurance_information"));
				ins.setCarInsurance_Price(rset.getInt("carinsurance_price"));
				
				list.add(ins);
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
			
		}
		
		
		return list;
	}



	public int insertShortReservation(Connection con, ReservationList rlist, CarType ct, CarInsurance ci) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query="insert into reservationlist values "
				+ "((select max(reservationnumber)+1 from reservationlist)"
				+ ",null,(select car_serial_number from cartype where carname=?)"
				+ ",(select carinsurance_no from carinsurance where carinsurance_name=?)"
				+ ",(select mem_num from member where mem_num=?)"
				+ ",(select g_code from grade where g_code=?)"
				+ ",?,?,sysdate,null,?,"
				+ "((select carprice from cartype where carname=?"
				+ ")+(select carinsurance_price from carinsurance where carinsurance_name=?"
				+ ")-((select carprice from cartype where carname=?"
				+ ")+(select carinsurance_price from carinsurance where carinsurance_name=?)"
				+ ")*(select g_rate from grade where g_code=?)*0.01)*(to_date(?)-to_date(?)+1))";
		 
			try {
			pstmt=con.prepareStatement(query);	
			
			System.out.println(rlist.getG_Code());
			
			
			pstmt.setString(1, ct.getCarName());
			pstmt.setString(2, ci.getCarInsurnace_Name());
			pstmt.setInt(3, rlist.getMem_Num());
			pstmt.setString(4, rlist.getG_Code());			
			pstmt.setDate(5, rlist.getCarStarDate());
			pstmt.setDate(6, rlist.getCarEndDate());			
			pstmt.setString(7, rlist.getCarNote());
			pstmt.setString(8, ct.getCarName());
			pstmt.setString(9, ci.getCarInsurnace_Name());
			pstmt.setString(10, ct.getCarName());
			pstmt.setString(11, ci.getCarInsurnace_Name());
			pstmt.setString(12, rlist.getG_Code());		
			
			pstmt.setDate(13, rlist.getCarEndDate());
			pstmt.setDate(14, rlist.getCarStarDate());
					
			
			
			
			result = pstmt.executeUpdate();
	        
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
		
		
		
		
		return result;
	}



	public int priceNoReservation(Connection con) {
		int price=0;
		
		Statement stmt= null;
		ResultSet rset= null;
		
		String query="select carprice from nomemberreservation where NORESERVATIONNUMBER = (select max(NORESERVATIONNUMBER) from nomemberreservation)";
		
		try {
				
			
			stmt=con.createStatement();
			rset=stmt.executeQuery(query);
			if(rset.next()) {
				price=rset.getInt(1);
			}
			
			
			System.out.println("차량가격  DAO"+price);
			
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(stmt);
				close(rset);
			}
		
		return price;
	}



	public int priceMembeRservation(Connection con) {
		int price=0;
		
		Statement stmt= null;
		ResultSet rset= null;
		
		
		String query="select carprice from reservationlist where reservationnumber = (select max(reservationnumber) from reservationlist)";
		try {
			stmt=con.createStatement();
			rset=stmt.executeQuery(query);
			if(rset.next()) {
				price=rset.getInt(1);
			}
			
			System.out.println("차량가격  DAO"+price);
			
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(stmt);
				close(rset);
			}
		
		return price;
	}


	public int countReservation(Connection conn) {
		Statement stmt = null;
		String query = "insert into reservationcount values (sysdate)";
		int result = 0;
		
		try {
			stmt = conn.createStatement();		
			result = stmt.executeUpdate(query);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(stmt);
		}
		return result;
	}


	public ArrayList<Visit> totalReservation(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Visit> list = new ArrayList<Visit>();
		
		String query1 = "select rccount,rcdate from (select count(to_char(rc_date,'YY-MM-DD')) as rccount,to_char(rc_date,'YY-MM-DD') as rcdate " 
		+ "from reservationcount group by to_char(rc_date,'YY-MM-DD') order by to_char(rc_date,'YY-MM-DD') desc) " 
		+ "where rownum <= 5";
		
		try {
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query1);

			
			while(rs.next()) {
				Visit v = new Visit();
				v.setVisitDate(rs.getString("rcdate"));
				v.setVisitCount(rs.getInt("rccount"));
				
				list.add(v);
				
				System.out.println("dao Date : " + v.getVisitDate());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return list;
	}

}
