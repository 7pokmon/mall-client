<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="mall.client.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<!-- 출력부 View -->
<body>
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<!-- 메뉴1 로그인/회원가입/내정보/장바구니(세션)/캘린더-->
	<!-- 추천/베스트셀러(주문량) -->
	<!-- 메뉴2 카테고리 -->
	<!-- 캘린더(이번달에 나온 책들) -->
	<!-- 상품리스트 -->
	<h1>index</h1>
	<%
	List<Ebook> ebookList = (List<Ebook>) (request.getAttribute("ebookList")); // ebook목록,검색어
	int currentPage = (int) request.getAttribute("currentPage"); // 현재페이지
	int lastPage = (int) request.getAttribute("lastPage"); // 마지막페이지
	// 수집
	String categoryName = (String) request.getAttribute("categoryName");
	String searchWord = null;

	if (request.getAttribute("searchWord") != null) { // 검색어가있으면
		searchWord = (String) request.getAttribute("searchWord"); // 검색어저장
	}
	//카테고리 리스트
	List<String> categoryList = (List<String>) (request.getAttribute("categoryList"));
	%>
	<a href="<%=request.getContextPath()%>/IndexController">전체</a>
	<%
	for (String ct : categoryList) {
	%>
	<a
		href="<%=request.getContextPath()%>/IndexController?categoryName=<%=ct%>"><%=ct%></a>
	<%
	}
	%>
	<!-- ebookTitle로 검색하기 -->
	<form action="<%=request.getContextPath()%>/SearchIndexController">
		Search Title : <input type="text" name="searchWord">
		<button type="submit">검색</button>
	</form>
	<table border="1">
		<tr>
			<%
			int i = 0;
			for (Ebook ebook : ebookList) {
				i += 1;
			%>
			<td>
				<div>
					<img src="<%=request.getContextPath()%>/img/default.jpg">
				</div> <!-- ebookOneController -> ebookDao.selectEbookOne() -> ebookOne.jsp -->
				<div>
					<a
						href="<%=request.getContextPath()%>/EbookOneController?ebookNo=<%=ebook.getEbookNo()%>">
						<%=ebook.getEbookTitle()%>
					</a>
				</div>
				<div>
					￦<%=ebook.getEbookPrice()%></div>
			</td>
			<%
			// 5개보여주고 줄바꿈
			if (i % 5 == 0) {
			%>
		</tr>
		<tr>
			<%
			}
			}
			%>
		</tr>
	</table>
	<!-- 페이징 -->
	<!-- 카테고리 페이징 -->
	<!-- 검색에 페이징 -->
	<%
	if (currentPage > 1) { // 첫번째 페이지는 이전버튼 비활성
		if (categoryName == null) {
			if (searchWord == null) {
	%>
		<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=currentPage-1%>">이전</a>
	<%
	} else {
	%>
		<a href="<%=request.getContextPath()%>/SearchIndexController?currentPage=<%=currentPage-1%>&searchWord=<%=searchWord%>">이전</a>
	<%
	}
			
	} else {
	%>
		<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=currentPage-1%>&categoryName=<%=categoryName%>">이전</a>
	<%
	}
	
	}
	if (currentPage < lastPage) { // 마지막 페이지는 다음버튼 비활성
		if (categoryName == null) {
			if (searchWord == null) {
	%>
		<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=currentPage+1%>">다음</a>
	<%
	} else {
	%>
		<a href="<%=request.getContextPath()%>/SearchIndexController?currentPage=<%=currentPage+1%>&searchWord=<%=searchWord%>">다음</a>
	<%
	}
	} else {
	%>
		<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=currentPage+1%>&categoryName=<%=categoryName%>">다음</a>
	<%
	}
	}
	%>
</body>
</html>