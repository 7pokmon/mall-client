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
import mall.client.vo.Ebook;

@WebServlet("/SearchIndexController")
public class SearchIndexController extends HttpServlet {
	private EbookDao ebookDao;
	private CategoryDao categoryDao;
	private OrdersDao ordersDao;
	// 검색후 페이징
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// model 호출
		this.ebookDao = new EbookDao();
		this.categoryDao = new CategoryDao();
		this.ordersDao = new OrdersDao();
		Ebook ebook = new Ebook();

		// 수집
		String searchWord = request.getParameter("searchWord");
		String categoryName = null;

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
		int totalRow = ebookDao.searchTotalCount(searchWord);
		// 마지막페이지
		int lastPage = totalRow / rowPerPage;
		if (totalRow % rowPerPage != 0) {
			lastPage += 1;
		}

		// 검색어별 목록 호출
		List<Ebook> ebookList = this.ebookDao.selectEbookListByPage(beginRow, rowPerPage, searchWord);
		// 카테고리목록 호출
		List<String> categoryList = this.categoryDao.categoryList();
		// 인기상품목록 호출
		List<Map<String, Object>> bestOrdersList = this.ordersDao.selectBestOrdersList();
		
		// View forward
		// request안에 데이터담기
		request.setAttribute("bestOrdersList", bestOrdersList);
		request.setAttribute("searchWord", searchWord);
		request.setAttribute("categoryName", ebook.getCategoryName());
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("lastPage", lastPage);
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("ebookList", ebookList);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/index.jsp");
		rd.forward(request, response); // request안에 ebookList 저장된채로 forward
	}

	// 검색시도
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글인코딩
		request.setCharacterEncoding("UTF-8");
		// model 호출
		this.ebookDao = new EbookDao();
		this.categoryDao = new CategoryDao();
		this.ordersDao = new OrdersDao();
		Ebook ebook = new Ebook();

		// 수집
		String searchWord = request.getParameter("searchWord");
		String categoryName = null;

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
		int totalRow = ebookDao.searchTotalCount(searchWord);
		// 마지막페이지
		int lastPage = totalRow / rowPerPage;
		if (totalRow % rowPerPage != 0) {
			lastPage += 1;
		}

		// 검색어별 목록 호출
		List<Ebook> ebookList = this.ebookDao.selectEbookListByPage(beginRow, rowPerPage, searchWord);
		// 카테고리목록 호출
		List<String> categoryList = this.categoryDao.categoryList();
		// 인기상품목록 호출
		List<Map<String, Object>> bestOrdersList = this.ordersDao.selectBestOrdersList();
		
		// View forward
		// request안에 데이터담기
		request.setAttribute("bestOrdersList", bestOrdersList);
		request.setAttribute("searchWord", searchWord);
		request.setAttribute("categoryName", ebook.getCategoryName());
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("lastPage", lastPage);
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("ebookList", ebookList);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/index.jsp");
		rd.forward(request, response); // request안에 ebookList 저장된채로 forward
	}

}
