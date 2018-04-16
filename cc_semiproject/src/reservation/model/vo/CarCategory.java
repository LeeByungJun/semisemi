package reservation.model.vo;

public class CarCategory implements java.io.Serializable{
	
	private final static long serialVersionUID = 96L;
	
	
	private int carType_no;
	private String car_Type;
	
	public CarCategory() {};
	
	
	
	public CarCategory(int carType_no, String car_Type) {
		super();
		this.carType_no = carType_no;
		this.car_Type = car_Type;
	}


	public int getCarType_no() {
		return carType_no;
	}


	public void setCarType_no(int carType_no) {
		this.carType_no = carType_no;
	}


	public String getCar_Type() {
		return car_Type;
	}


	public void setCar_Type(String car_Type) {
		this.car_Type = car_Type;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.getCar_Type();
	}
	
	
}
