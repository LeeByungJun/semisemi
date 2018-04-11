package admin.reservation.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ReservationList implements Serializable{

	private static final long serialVersionUID = 15L;

	private int reservationnumber;
	private int noreservationnumber;
	private int car_serial_number;
	private int carinsurance_no;
	private int mem_num;
	private String g_code;
	private Date carstartdate;
	private Date carenddate;
	private Date carsysdate;
	private String carbranch;
	private String carnote;
	private int carprice;
	private String name;
	private String email;
	private String g_rank;
	private String carname;
	
	public ReservationList() {
		
	}

	public ReservationList(int reservationnumber, int noreservationnumber, int car_serial_number, int carinsurance_no,
			int mem_num, String g_code, Date carstartdate, Date carenddate, Date carsysdate, String carbranch,
			String carnote, int carprice, String name, String email, String g_rank, String carname) {
		super();
		this.reservationnumber = reservationnumber;
		this.noreservationnumber = noreservationnumber;
		this.car_serial_number = car_serial_number;
		this.carinsurance_no = carinsurance_no;
		this.mem_num = mem_num;
		this.g_code = g_code;
		this.carstartdate = carstartdate;
		this.carenddate = carenddate;
		this.carsysdate = carsysdate;
		this.carbranch = carbranch;
		this.carnote = carnote;
		this.carprice = carprice;
		this.name = name;
		this.email = email;
		this.g_rank = g_rank;
		this.carname = carname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getReservationnumber() {
		return reservationnumber;
	}

	public void setReservationnumber(int reservationnumber) {
		this.reservationnumber = reservationnumber;
	}

	public int getNoreservationnumber() {
		return noreservationnumber;
	}

	public void setNoreservationnumber(int noreservationnumber) {
		this.noreservationnumber = noreservationnumber;
	}

	public int getCar_serial_number() {
		return car_serial_number;
	}

	public void setCar_serial_number(int car_serial_number) {
		this.car_serial_number = car_serial_number;
	}

	public int getCarinsurance_no() {
		return carinsurance_no;
	}

	public void setCarinsurance_no(int carinsurance_no) {
		this.carinsurance_no = carinsurance_no;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public String getG_code() {
		return g_code;
	}

	public void setG_code(String g_code) {
		this.g_code = g_code;
	}

	public Date getCarstartdate() {
		return carstartdate;
	}

	public void setCarstartdate(Date carstartdate) {
		this.carstartdate = carstartdate;
	}

	public Date getCarenddate() {
		return carenddate;
	}

	public void setCarenddate(Date carenddate) {
		this.carenddate = carenddate;
	}

	public Date getCarsysdate() {
		return carsysdate;
	}

	public void setCarsysdate(Date carsysdate) {
		this.carsysdate = carsysdate;
	}

	public String getCarbranch() {
		return carbranch;
	}

	public void setCarbranch(String carbranch) {
		this.carbranch = carbranch;
	}

	public String getCarnote() {
		return carnote;
	}

	public void setCarnote(String carnote) {
		this.carnote = carnote;
	}

	public int getCarprice() {
		return carprice;
	}

	public void setCarprice(int carprice) {
		this.carprice = carprice;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public String getG_rank() {
		return g_rank;
	}

	public void setG_rank(String g_rank) {
		this.g_rank = g_rank;
	}
	
	public String getCarname() {
		return carname;
	}

	public void setCarname(String carname) {
		this.carname = carname;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.reservationnumber + ", " +
			this.noreservationnumber + ", " +
			this.car_serial_number + ", " +
			this.carinsurance_no + ", " +
			this.mem_num + ", " +
			this.g_code + ", " +
			this.carstartdate + ", " +
			this.carenddate + ", " +
			this.carsysdate + ", " +
			this.carbranch + ", " +
			this.carnote + ", " +
			this.carprice + ", " + this.name + ", " + this.email + ", " + this.g_rank
			+ ", " + this.carname;
	}

}
