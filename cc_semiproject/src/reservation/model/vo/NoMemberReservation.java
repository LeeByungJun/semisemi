package reservation.model.vo;

import java.sql.Date;

public class NoMemberReservation  implements java.io.Serializable{
	private final static long serialVersionUID = 98L;
	   
	
	
	private int noReservationNumber;	
	private int car_Serial_Number;
	private int carInsurance_No;
	private String noMemberName;
	private int noMemberAge;
	private String noMemberGender;
	private String noMemberEmail;	
	private String noMemberNumber;
	private String noMemberTell;
	private Date carStartDate;
	private Date carEndDate;
	private Date carSysDate;
	private int carPrice;
	private String carNote;
	
	private int s_edate;
	
	
	
	public NoMemberReservation() {
		
		
		
	}


	public NoMemberReservation(int noReservationNumber, int car_Serial_Number, int carInsurance_No, String noMemberName,
			int noMemberAge, String noMemberGender, String noMemberEmail, String noMemberNumber, String noMemberTell,
			Date carStartDate, Date carEndDate, Date carSysDate, int carPrice, String carNote) {
		super();
		this.noReservationNumber = noReservationNumber;
		this.car_Serial_Number = car_Serial_Number;
		this.carInsurance_No = carInsurance_No;
		this.noMemberName = noMemberName;
		this.noMemberAge = noMemberAge;
		this.noMemberGender = noMemberGender;
		this.noMemberEmail = noMemberEmail;
		this.noMemberNumber = noMemberNumber;
		this.noMemberTell = noMemberTell;
		this.carStartDate = carStartDate;
		this.carEndDate = carEndDate;
		this.carSysDate = carSysDate;
		this.carPrice = carPrice;
		this.carNote = carNote;
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


	public String getNoMemberName() {
		return noMemberName;
	}


	public void setNoMemberName(String noMemberName) {
		this.noMemberName = noMemberName;
	}


	public int getNoMemberAge() {
		return noMemberAge;
	}


	public void setNoMemberAge(int noMemberAge) {
		this.noMemberAge = noMemberAge;
	}


	public String getNoMemberGender() {
		return noMemberGender;
	}


	public void setNoMemberGender(String noMemberGender) {
		this.noMemberGender = noMemberGender;
	}


	public String getNoMemberEmail() {
		return noMemberEmail;
	}


	public void setNoMemberEmail(String noMemberEmail) {
		this.noMemberEmail = noMemberEmail;
	}


	public String getNoMemberNumber() {
		return noMemberNumber;
	}


	public void setNoMemberNumber(String noMemberNumber) {
		this.noMemberNumber = noMemberNumber;
	}


	public String getNoMemberTell() {
		return noMemberTell;
	}


	public void setNoMemberTell(String noMemberTell) {
		this.noMemberTell = noMemberTell;
	}


	public Date getCarStartDate() {
		return carStartDate;
	}


	public void setCarStartDate(Date carStartDate) {
		this.carStartDate = carStartDate;
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


	public int getCarPrice() {
		return carPrice;
	}


	public void setCarPrice(int carPrice) {
		this.carPrice = carPrice;
	}


	public String getCarNote() {
		return carNote;
	}


	public void setCarNote(String carNote) {
		this.carNote = carNote;
	}

	
	public int getS_edate() {
		return s_edate;
	}


	public void setS_edate(int s_edate) {
		this.s_edate = s_edate;
	}
	
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	

	
}
