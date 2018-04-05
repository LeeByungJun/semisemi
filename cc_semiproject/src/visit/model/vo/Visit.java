package visit.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Visit implements Serializable{

	private static final long serialVersionUID = 2L;
	
	private int visitCount;
	private String visitDate;
	
	public Visit() {
		
	}

	public Visit(int visitCount, String visitDate) {
		super();
		this.visitCount = visitCount;
		this.visitDate = visitDate;
	}

	public int getVisitCount() {
		return visitCount;
	}

	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}

	public String getVisitDate() {
		return visitDate;
	}

	public void setVisitDate(String visitDate) {
		this.visitDate = visitDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return visitCount + ", " + visitDate;
	}

}
