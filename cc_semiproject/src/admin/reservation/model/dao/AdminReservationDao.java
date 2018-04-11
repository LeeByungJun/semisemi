package admin.reservation.model.dao;

import static common.JDBCTemplate.*;

import java.sql.*;
import java.util.ArrayList;

import admin.reservation.model.vo.ReservationList;

public class AdminReservationDao {
	public AdminReservationDao() {
		
	}

	public ArrayList<ReservationList> selectReservationList(Connection conn) {
		//ReservationList 테이블 전체 정보 빼오는 데 사용되는 메소드
		Statement stmt = null;
		ResultSet rs = null;
		/*String query = "select m.name,m.email,RESERVATIONNUMBER,NORESERVATIONNUMBER,CAR_SERIAL_NUMBER,"
				+ "CARINSURANCE_NO,r.MEM_NUM,r.G_CODE,CARSTARTDATE,CARENDDATE,CARSYSDATE,CARBRANCH,CARNOTE,r.CARPRICE,g.g_rank,c.carname"
				+ " from member m,reservationlist r,grade g,cartype c where m.MEM_NUM = r.mem_num and r.g_code = g.G_CODE"
				+ " and r.car_serial_number = c.CAR_SERIAL_NUMBER";*/
		String query = "select m.name,m.email,RESERVATIONNUMBER,NORESERVATIONNUMBER,r.CAR_SERIAL_NUMBER," + 
				"CARINSURANCE_NO,r.MEM_NUM,r.G_CODE,CARSTARTDATE,CARENDDATE,CARSYSDATE,CARBRANCH,CARNOTE,r.CARPRICE,g.g_rank,c.carname" + 
				" from member m,reservationlist r,grade g,cartype c" + 
				" where m.MEM_NUM = r.mem_num and r.g_code = g.G_CODE and r.car_serial_number = c.CAR_SERIAL_NUMBER";
		ArrayList<ReservationList> list = new ArrayList<ReservationList>();
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				ReservationList r = new ReservationList();
				r.setReservationnumber(rs.getInt(3));
				r.setNoreservationnumber(rs.getInt(4));
				r.setCar_serial_number(rs.getInt(5));
				r.setCarinsurance_no(rs.getInt(6));
				r.setMem_num(rs.getInt(7));
				r.setG_code(rs.getString(8));
				r.setCarstartdate(rs.getDate(9));
				r.setCarenddate(rs.getDate(10));
				r.setCarsysdate(rs.getDate(11));
				r.setCarbranch(rs.getString(12));
				r.setCarnote(rs.getString(13));
				r.setCarprice(rs.getInt(14));
				r.setName(rs.getString(1));
				r.setEmail(rs.getString(2));
				r.setG_rank(rs.getString(15));
				r.setCarname(rs.getString(16));
				/*r.setReservationnumber(rs.getInt("reservationnumber"));
				r.setNoreservationnumber(rs.getInt("noreservationnumber"));
				r.setCar_serial_number(rs.getInt("car_serial_number"));
				r.setCarinsurance_no(rs.getInt("carinsurance_no"));
				r.setMem_num(rs.getInt("mem_num"));
				r.setG_code(rs.getString("g_code"));
				r.setCarstartdate(rs.getDate("carstartdate"));
				r.setCarenddate(rs.getDate("carenddate"));
				r.setCarsysdate(rs.getDate("carsysdate"));
				r.setCarbranch(rs.getString("carbranch"));
				r.setCarnote(rs.getString("carnote"));
				r.setCarprice(rs.getInt("carprice"));
				r.setName(rs.getString("name"));
				r.setEmail(rs.getString("email"));
				r.setCarname(rs.getString("carname"));*/
				
				list.add(r);
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
