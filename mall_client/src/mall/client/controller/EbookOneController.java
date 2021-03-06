package mall.client.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mall.client.model.EbookDao;
import mall.client.vo.Ebook;

@WebServlet("/EbookOneController")
public class EbookOneController extends HttpServlet {
	private EbookDao ebookDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 수집코드 구현
		int ebookNo = Integer.parseInt(request.getParameter("ebookNo"));
		// 호출
		this.ebookDao = new EbookDao();
		Ebook ebook = this.ebookDao.selectEbookOne(ebookNo);
		//View foward
		request.setAttribute("ebook", ebook);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/ebook/ebookOne.jsp");
		rd.forward(request, response);
	}

}
