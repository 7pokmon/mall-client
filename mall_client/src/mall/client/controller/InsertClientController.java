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

@WebServlet("/InsertClientController")
public class InsertClientController extends HttpServlet {
	// model
	private ClientDao clientDao;
	// form : C -> V
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 유효성 검사
		HttpSession session = request.getSession();
		if(session.getAttribute("loginClient") != null) {
			response.sendRedirect(request.getContextPath()+"/IndexController");
			return;
		}
		
		request.getRequestDispatcher("/WEB-INF/view/client/insertClient.jsp").forward(request, response);
	}
	// action : C -> M -> redirect
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request 분석
		String ClientMail = request.getParameter("clientMail");
		String ClientPw = request.getParameter("clientPw");
		
		//model 호출
		this.clientDao = new ClientDao();
		// 중복검사
		String returnClient = this.clientDao.selectClientMail(ClientMail);
		if(returnClient != null) {
			System.out.println("중복된 Mail 입니다");
			response.sendRedirect(request.getContextPath()+"/IndexController");
			return;
		}
		// 회원가입
		Client client = new Client();
		client.setClientMail(ClientMail);
		client.setClientPw(ClientPw);
		// 회원가입 메서드 호출
		clientDao.insertClient(client);
		
		// View foward
		response.sendRedirect(request.getContextPath()+"/IndexController");
	}
}
