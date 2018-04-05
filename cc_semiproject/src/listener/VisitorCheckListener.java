package listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import visit.model.service.VisitService;

/**
 * Application Lifecycle Listener implementation class VisitorCheckListener
 *
 */
@WebListener
public class VisitorCheckListener implements HttpSessionListener {

    /**
     * Default constructor. 
     */
    public VisitorCheckListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent arg0)  { 
        //세션이 생성될 시 동작
    	//System.out.println("sessionCreated 동작!");
    	
    	/*HttpSession session = arg0.getSession();
    	System.out.println("Session Created :: " + session.getId());*/
    	
    	/*if(arg0.getSession().isNew()) {
    		execute(arg0);
    	}*/
    	
    }
    
    private void execute(HttpSessionEvent sessionEven) {
    	
    	//인원 수 증가 쿼리 동작 -> 서비스 호출 -> dao 호출 고고싱
    	new VisitService().setVisitCount();
    	//누적 인원 수 구하기
    	
    	//오늘 방문 인원 수 구하기
    	int todayCount = new VisitService().todayCount();
    	System.out.println("todayCount = " + todayCount);
    	
    	HttpSession todayVisit = sessionEven.getSession();
    	todayVisit.setAttribute("todayVisit", todayCount);
    	
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent arg0)  { 
         // TODO Auto-generated method stub
    	System.out.println("sessionDestroyed 동작!");
    }
	
}
