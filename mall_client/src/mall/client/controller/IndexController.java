package mall.client.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mall.client.model.*;
import mall.client.vo.*;

// 실행부
// Controller -> Model -> View
@WebServlet("/IndexController")
public class IndexController extends HttpServlet {
	// model
	private EbookDao ebookDao;
	private CategoryDao categoryDao;
	private OrdersDao ordersDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// model 호출
		this.ebookDao = new EbookDao();
		this.categoryDao = new CategoryDao();
		this.ordersDao = new OrdersDao();
		Ebook ebook = new Ebook();
		
		// 카테고리별 페이징
		String categoryName = "";
		if (request.getParameter("categoryName") != null) { // 카테고리선택시
			categoryName = request.getParameter("categoryName"); // 카테고리불러옴
		}
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
		int totalRow = ebookDao.totalCount(categoryName);
		// 마지막페이지
		int lastPage = totalRow / rowPerPage;
		if (totalRow % rowPerPage != 0) {
			lastPage += 1;
		}

		// 카테리고리별 목록 호출
		List<Ebook> ebookList = this.ebookDao.selectCategoryByPage(beginRow, rowPerPage, categoryName);
		// 카테고리목록 호출
		List<String> categoryList = this.categoryDao.categoryList();
		// 인기상품목록 호출
		List<Map<String, Object>> bestOrdersList = this.ordersDao.selectBestOrdersList();
		
		// View forward
		// request안에 데이터담기
		request.setAttribute("bestOrdersList", bestOrdersList);
		request.setAttribute("categoryName", ebook.getCategoryName());
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("lastPage", lastPage);
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("ebookList", ebookList);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/index.jsp");
		rd.forward(request, response); // request안에 ebookList 저장된채로 forward
	}
}
