package mall.client.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mall.client.model.EbookDao;



@WebServlet("/EbookCalendarController")
public class EbookCalendarController extends HttpServlet {
	private EbookDao ebookDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.ebookDao = new EbookDao();
		// 년/월이 매개값으로 전달되지 않으면 
		Calendar dday = Calendar.getInstance();

		// 년도
		if(request.getParameter("currentYear") != null) {
			dday.set(Calendar.YEAR, Integer.parseInt(request.getParameter("currentYear")));
		}
		// 달
		if(request.getParameter("currentMonth") != null) {
			dday.set(Calendar.MONTH, Integer.parseInt(request.getParameter("currentMonth"))-1);
		}
		
		int currentYear = dday.get(Calendar.YEAR);
		int currentMonth = dday.get(Calendar.MONTH) + 1;
		
		// 마지막 일
		int endDay = dday.getActualMaximum(Calendar.DATE);
		
		// 현재달의 1일의 요일
		Calendar firstDay = Calendar.getInstance();
		firstDay.set(Calendar.YEAR, currentYear);
		firstDay.set(Calendar.MONTH, currentMonth-1);
		firstDay.set(Calendar.DATE, 1);
		int firstDayOfWeek = firstDay.get(Calendar.DAY_OF_WEEK);
		
		System.out.println(endDay+"<--endDay");
		System.out.println(currentYear+"<--currentYear");
		System.out.println(currentMonth+"<--currentMonth");
		System.out.println(firstDay.get(Calendar.DAY_OF_WEEK));
		
		// 이달의 신간 ebook
		List<Map<String, Object>> ebookListByMonth = this.ebookDao.selectEbookListByMonth(currentYear, currentMonth);
		
		// 이전달,년도 다음달,년도
		int preYear = currentYear;
		int preMonth = currentMonth - 1;
		if(preMonth == 0) {
			preMonth = 12;
			preYear -= 1;
			}
		System.out.println(preYear+"preYear");
		System.out.println(preMonth+"preMonth");
		
		int nextYear = currentYear;
		int nextMonth = currentMonth + 1;
		if(nextMonth == 13) {
		nextMonth = 1;
		nextYear += 1;
		}
		System.out.println(nextYear+"nextYear");
		System.out.println(nextMonth+"nextMonth");
		
		// request안에 데이터담기
		request.setAttribute("preYear", preYear);
		request.setAttribute("preMonth", preMonth);
		request.setAttribute("nextYear", nextYear);
		request.setAttribute("nextMonth", nextMonth);
		request.setAttribute("ebookListByMonth", ebookListByMonth);
		request.setAttribute("currentYear", currentYear);
		request.setAttribute("currentMonth", currentMonth);
		request.setAttribute("endDay", endDay);
		request.setAttribute("firstDayOfWeek", firstDayOfWeek);
		// View forward
		request.getRequestDispatcher("WEB-INF/view/ebook/ebookCalendar.jsp").forward(request, response);
	}
}
