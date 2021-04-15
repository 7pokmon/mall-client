package mall.client.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mall.client.model.ClientDao;
import mall.client.vo.Client;

@WebServlet("/UpdateClientPwController")
public class UpdateClientPwController extends HttpServlet {
	private ClientDao clientDao;
	// a href -> updateClientPw.jsp 연결
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 유효성검사
		HttpSession session = request.getSession();
		if(session.getAttribute("loginClient") == null) {
			response.sendRedirect(request.getContextPath()+"/IndexController");
			return;
		}	
		// forward updateClientPw.jsp 비밀번호 수정으로 연결
		request.getRequestDispatcher("/WEB-INF/view/client/updateClientPw.jsp").forward(request, response);
		}
	
	// updateClientPw.jsp form
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 유효성검사
		HttpSession session = request.getSession();
		if(session.getAttribute("loginClient") == null) {
			response.sendRedirect(request.getContextPath()+"/IndexController");
			return;
		}
		
		// 정보수집
		String clientPw = request.getParameter("clientPw");
		
		Client client = new Client();
		client.setClientMail(((Client)session.getAttribute("loginClient")).getClientMail());	
		client.setClientPw(request.getParameter("clientPw")); 
		
		// 수정메서드
		this.clientDao = new ClientDao();
		clientDao.updateClientPw(client);
		
		// 세션 초기화
		session.invalidate();
		// forward
		response.sendRedirect(request.getContextPath()+"/IndexController");
	}

}
