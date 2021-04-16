package mall.client.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import mall.client.model.OrdersDao;
import mall.client.vo.*;

@WebServlet("/OrdersListController")
public class OrdersListController extends HttpServlet {
	private OrdersDao ordersDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 유효성검사
		HttpSession session = request.getSession();
	      if(session.getAttribute("loginClient") == null) {
	         response.sendRedirect(request.getContextPath()+"/IndexController");
	         return;
	      }
	    // 의존객체 생성 후 주입
		ordersDao = new OrdersDao();
		// 세션에서 client 가져오기
		Client client = (Client)session.getAttribute("loginClient");
		
		// 현재페이지
		
		int currentPage = 1;
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		// 페이지당 보여줄 수
		int rowPerPage = 15;
		// 첫페이지
		int beginRow = (currentPage - 1) * rowPerPage;
		// 전체페이지
		int totalRow = ordersDao.totalCount(client);
		// 마지막페이지
		int lastPage = totalRow / rowPerPage;
		if (totalRow % rowPerPage != 0) {
			lastPage += 1;
		}
		
		// model 호출
		List<Map<String, Object>> ordersList = this.ordersDao.selectOrderListByClient(beginRow, rowPerPage, client);
		
		// View forward
		request.setAttribute("ordersList", ordersList);	
		request.setAttribute("lastPage", lastPage);
		request.setAttribute("currentPage", currentPage);
		request.getRequestDispatcher("WEB-INF/view/orders/ordersList.jsp").forward(request, response);
	}

}
