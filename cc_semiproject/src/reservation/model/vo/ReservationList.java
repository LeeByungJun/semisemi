package reservation.model.vo;

import java.sql.Date;

public class ReservationList implements java.io.Serializable{

	private final static long serialVersionUID = 94L;
		
	private int reservationNumber;
	private int noReservationNumber;
	private int car_Serial_Number;
	private int carInsurance_No;
	private int mem_Num;
	private String g_Code;
	private Date carStarDate;
	private Date carEndDate;
	private Date carSysDate;
	private String carBranch;
	private String carNote;
	private int carPrice;
	
	private int s_edate;
	
	
	
	public ReservationList() {};
	
	
	public ReservationList(int reservationNumber, int noReservationNumber, int car_Serial_Number, int carInsurance_No,
			int mem_Num, String g_Code, Date carStarDate, Date carEndDate, Date carSysDate, String carBranch,
			String carNote, int carPrice,int s_edate) {
		super();
		this.reservationNumber = reservationNumber;
		this.noReservationNumber = noReservationNumber;
		this.car_Serial_Number = car_Serial_Number;
		this.carInsurance_No = carInsurance_No;
		this.mem_Num = mem_Num;
		this.g_Code = g_Code;
		this.carStarDate = carStarDate;
		this.carEndDate = carEndDate;
		this.carSysDate = carSysDate;
		this.carBranch = carBranch;
		this.carNote = carNote;
		this.carPrice = carPrice;
		this.s_edate=s_edate;
	}
	
	
	
	public int getReservationNumber() {
		return reservationNumber;
	}
	public void setReservationNumber(int reservationNumber) {
		this.reservationNumber = reservationNumber;
	}
	public int getNoReservationNumber() {
		return noReservationNumber;
	}
	public void setNoReservationNumber(int noReservationNumber) {
		this.noReservationNumber = noReservationNumber;
	}
	public int getCar_Serial_Number() {
		return car_Serial_Number;
	}
	public void setCar_Serial_Number(int car_Serial_Number) {
		this.car_Serial_Number = car_Serial_Number;
	}
	public int getCarInsurance_No() {
		return carInsurance_No;
	}
	public void setCarInsurance_No(int carInsurance_No) {
		this.carInsurance_No = carInsurance_No;
	}
	public int getMem_Num() {
		return mem_Num;
	}
	public void setMem_Num(int mem_Num) {
		this.mem_Num = mem_Num;
	}
	public String getG_Code() {
		return g_Code;
	}
	public void setG_Code(String g_Code) {
		this.g_Code = g_Code;
	}
	public Date getCarStarDate() {
		return carStarDate;
	}
	public void setCarStarDate(Date carStarDate) {
		this.carStarDate = carStarDate;
	}
	public Date getCarEndDate() {
		return carEndDate;
	}
	public void setCarEndDate(Date carEndDate) {
		this.carEndDate = carEndDate;
	}
	public Date getCarSysDate() {
		return carSysDate;
	}
	public void setCarSysDate(Date carSysDate) {
		this.carSysDate = carSysDate;
	}
	public String getCarBranch() {
		return carBranch;
	}
	public void setCarBranch(String carBranch) {
		this.carBranch = carBranch;
	}
	public String getCarNote() {
		return carNote;
	}
	public void setCarNote(String carNote) {
		this.carNote = carNote;
	}
	public int getCarPrice() {
		return carPrice;
	}
	public void setCarPrice(int carPrice) {
		this.carPrice = carPrice;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	public int getS_edate() {
		return s_edate;
	}


	public void setS_edate(int s_edate) {
		this.s_edate = s_edate;
	}


	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	
}
