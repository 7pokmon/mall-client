package mall.client.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import mall.client.model.StatsDao;

@WebListener
public class StatsListener implements HttpSessionListener {
	
	private StatsDao statsDao;
	
    public void sessionCreated(HttpSessionEvent se)  { 
    	if(se.getSession().isNew()) {
    		System.out.println("새로운 session이 생성되었습니다.");
    	
    		this.statsDao = new StatsDao();
    		
    		if(this.statsDao.selectStatsByToday() == null) {
    			// 오늘날자의 카운트가 없으면 1을 입력
    			this.statsDao.insertStats();
    		} else {
    			// 오늘날자의 카운트가 있으면 +1을 업데이트
    			this.statsDao.updateStats();
    		}
    	}
    }

	
    public void sessionDestroyed(HttpSessionEvent se)  { 
         
    }
}
