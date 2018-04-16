package reservation.model.vo;

public class CarInsurance implements java.io.Serializable{
	
	private final static long serialVersionUID = 95L;
	
	private int carInsurance_No;
	private String carInsurnace_Name;
	private String carInsurance_Information;
	private int carInsurance_Price;
	
	public CarInsurance() {}

	public CarInsurance(int carInsurance_No, String carInsurnace_Name, String carInsurance_Information,
			int carInsurance_Price) {
		super();
		this.carInsurance_No = carInsurance_No;
		this.carInsurnace_Name = carInsurnace_Name;
		this.carInsurance_Information = carInsurance_Information;
		this.carInsurance_Price = carInsurance_Price;
	}
	
	

	public int getCarInsurance_No() {
		return carInsurance_No;
	}

	public void setCarInsurance_No(int carInsurance_No) {
		this.carInsurance_No = carInsurance_No;
	}

	public String getCarInsurnace_Name() {
		return carInsurnace_Name;
	}

	public void setCarInsurnace_Name(String carInsurnace_Name) {
		this.carInsurnace_Name = carInsurnace_Name;
	}

	public String getCarInsurance_Information() {
		return carInsurance_Information;
	}

	public void setCarInsurance_Information(String carInsurance_Information) {
		this.carInsurance_Information = carInsurance_Information;
	}

	public int getCarInsurance_Price() {
		return carInsurance_Price;
	}

	public void setCarInsurance_Price(int carInsurance_Price) {
		this.carInsurance_Price = carInsurance_Price;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	};

	
	@Override
	public String toString() {
		
		
		return this.carInsurnace_Name;
	}
	
	
	
	
}
