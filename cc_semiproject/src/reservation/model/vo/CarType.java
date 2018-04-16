package reservation.model.vo;

public class CarType implements java.io.Serializable{

	private final static long serialVersionUID = 97L;
	
	
	private int car_Serial_Number;
	private int carType_No;
	private String carName;
	private int carNum;
	private int carPrice;
	private String carInformation;
	private String carCompany;
	
	public CarType() {};
	
	
	public CarType(int car_Serial_Number, int carType_No, String carName, int carNum, int carPrice,
			String carInformation, String carCompany) {
		super();
		this.car_Serial_Number = car_Serial_Number;
		this.carType_No = carType_No;
		this.carName = carName;
		this.carNum = carNum;
		this.carPrice = carPrice;
		this.carInformation = carInformation;
		this.carCompany = carCompany;
	}


	public int getCar_Serial_Number() {
		return car_Serial_Number;
	}


	public void setCar_Serial_Number(int car_Serial_Number) {
		this.car_Serial_Number = car_Serial_Number;
	}


	public int getCarType_No() {
		return carType_No;
	}


	public void setCarType_No(int carType_No) {
		this.carType_No = carType_No;
	}


	public String getCarName() {
		return carName;
	}


	public void setCarName(String carName) {
		this.carName = carName;
	}


	public int getCarNum() {
		return carNum;
	}


	public void setCarNum(int carNum) {
		this.carNum = carNum;
	}


	public int getCarPrice() {
		return carPrice;
	}


	public void setCarPrice(int carPrice) {
		this.carPrice = carPrice;
	}


	public String getCarInformation() {
		return carInformation;
	}


	public void setCarInformation(String carInformation) {
		this.carInformation = carInformation;
	}


	public String getCarCompany() {
		return carCompany;
	}


	public void setCarCompany(String carCompany) {
		this.carCompany = carCompany;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.getCarName();
	}
	
	
}
