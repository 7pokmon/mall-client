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

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private ClientDao clientDao;
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 유효성 검사
		HttpSession session = request.getSession();
		if(session.getAttribute("loginClient") != null) {
			response.sendRedirect(request.getContextPath()+"/IndexController");
			return;
		}
		// 한글 인고딩
		request.setCharacterEncoding("utf-8");
		String ClientMail = request.getParameter("clientMail");
		String ClinetPw = request.getParameter("clientPw");
		Client client = new Client();
		client.setClientMail(ClientMail);
		client.setClientPw(ClinetPw);
		
		this.clientDao = new ClientDao();
		Client returnClient = this.clientDao.login(client);
		if(returnClient != null) {
			session.setAttribute("loginClient", returnClient);
		}
		// 로그인 성공시 화면으로
		response.sendRedirect(request.getContextPath()+"/IndexController");
	}
}
