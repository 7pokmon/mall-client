package mall.client.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class DBListener implements ServletContextListener {
	// 톰캣이 꺼질떄 해야하는 행동
    public void contextDestroyed(ServletContextEvent sce)  { 
    	System.out.println("contextDestroyed"); // 메모리를 정리하는 부분
    }
    // 톰캣이 켜질때 해야하는 행동
    public void contextInitialized(ServletContextEvent sce)  { 
    	try {
			Class.forName("org.mariadb.jdbc.Driver");
			System.out.println("mairadb 로딩성공");
		} catch (ClassNotFoundException e) {
			System.out.println("mairadb 로딩실패");
			e.printStackTrace();
		}
    }
}
