package member.reservation.model.vo;

import java.sql.Date;

public class ReservationView {
	private int mem_num;
	private int reser_no;
	private Date reser_startday;
	private Date reser_endday;
	private String reser_office;
	private String reser_car;
	private int reser_cash;
	private String reser_pay;
	private String reser_insurance;
	
	public ReservationView() {}

	public ReservationView(int mem_num, int reser_no, Date reser_startday, Date reser_endday, String reser_office, String reser_car, int reser_cash,
			String reser_pay, String reser_insurance) {
		super();
		this.mem_num = mem_num;
		this.reser_no = reser_no;
		this.reser_startday = reser_startday;
		this.reser_endday = reser_endday;
		this.reser_office = reser_office;
		this.reser_car = reser_car;
		this.reser_cash = reser_cash;
		this.reser_pay = reser_pay;
		this.reser_insurance = reser_insurance;
	}

	

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public int getReser_no() {
		return reser_no;
	}

	public void setReser_no(int reser_no) {
		this.reser_no = reser_no;
	}

	public Date getReser_startday() {
		return reser_startday;
	}

	public void setReser_startday(Date reser_startday) {
		this.reser_startday = reser_startday;
	}

	public Date getReser_endday() {
		return reser_endday;
	}

	public void setReser_endday(Date reser_endday) {
		this.reser_endday = reser_endday;
	}

	public String getReser_office() {
		return reser_office;
	}

	public void setReser_office(String reser_office) {
		this.reser_office = reser_office;
	}

	public String getReser_car() {
		return reser_car;
	}

	public void setReser_car(String reser_car) {
		this.reser_car = reser_car;
	}

	public int getReser_cash() {
		return reser_cash;
	}

	public void setReser_cash(int reser_cash) {
		this.reser_cash = reser_cash;
	}

	public String getReser_pay() {
		return reser_pay;
	}

	public void setReser_pay(String reser_pay) {
		this.reser_pay = reser_pay;
	}

	public String getReser_insurance() {
		return reser_insurance;
	}

	public void setReser_insurance(String reser_insurance) {
		this.reser_insurance = reser_insurance;
	}

	@Override
	public String toString() {
		return this.mem_num + ", " + this.reser_no + ", " + this.reser_startday + ", " + this.reser_endday + ", " 
	+ this.reser_office + ", " + this.reser_car+", " + this.reser_cash + ", " + this.reser_pay + ", " + this.reser_insurance;
	}
	
	
}
