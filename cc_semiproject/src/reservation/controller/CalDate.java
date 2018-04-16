package reservation.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CalDate {

	int sun=0;
	
	
	public CalDate(String stratdate, String enddate) throws Exception {
		
		sun=(int) (diffOfDate(stratdate, enddate));
		   
		
		
	}

	 public static long diffOfDate(String stratdate, String enddate) throws Exception
	  {
	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

	 

	    Date beginDate = formatter.parse(stratdate);
	    Date endDate = formatter.parse(enddate);

	 

	    long diff = endDate.getTime() - beginDate.getTime();
	    long diffDays = diff / (24 * 60 * 60 * 1000);

	 

	    return diffDays;
	  }
}
