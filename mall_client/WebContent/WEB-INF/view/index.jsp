<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
	<a href="${pageContext.request.contextPath}/IndexController">전체</a>
	<c:forEach var="ct" items="${categoryList}">
		<a href="${pageContext.request.contextPath}/IndexController?categoryName=${ct}">${ct}</a>
	</c:forEach>
	<!-- ebookTitle로 검색하기 -->
	<form action="${pageContext.request.contextPath}/SearchIndexController">
		Search Title : <input type="text" name="searchWord">
		<button type="submit">검색</button>
	</form>
	<h1>Best Ebook</h1>
	<table border="1">
		<tr>
			<c:forEach var="m" items="${bestOrdersList}">
				<td>
					<div><img src="${pageContext.request.contextPath}/img/default.jpg"></div>
					<div>
						<a href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${m.ebookNo}">
						${m.ebookTitle}
						</a>
					</div>
					<div>${m.ebookPrice}</div>
				</td>
			</c:forEach>
		</tr>
	</table>
	<h1>Ebook List</h1>
	<table border="1">
		<tr>
			<c:set var = "i" value = "0"/>
			<c:forEach var="m" items="${ebookList}">
				<c:set var = "i" value = "${i+1}"/>
				<td>
					<div>
						<img src="${pageContext.request.contextPath}/img/default.jpg">
					</div>
					<div>
					<a href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${m.ebookNo}">
						${m.ebookTitle}
					</a>
					</div>
					<div>￦${m.ebookPrice}</div>
				</td>
				<c:if test="${i%5 == 0}">
					</tr><tr>
				</c:if>
			</c:forEach>
		</tr>		
	</table>
	<!-- 페이징 -->
	<!-- 카테고리 페이징 -->
	<!-- 검색에 페이징 -->
	<!-- 첫번쨰 페이지는 이전버튼 비활성 -->
	<c:if test="${currentPage > 1}">
		<c:if test="${categoryName == null}">
			<c:if test="${serchWord == null}">
				<a href="${pageContext.request.contextPath}/IndexController?currentPage=${currentPage-1}">이전</a>
			</c:if>
			<c:if test="${serchWord != null}">
				<a href="${pageContext.request.contextPath}/SearchIndexController?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
			</c:if>
		</c:if>
		<c:if test="${categoryName != null}">
			<a href="${pageContext.request.contextPath}/IndexController?currentPage=${currentPage-1}&categoryName=${categoryName}">이전</a>
		</c:if>
	</c:if>
	<!-- 마지막 페이지는 다음버튼 비활성 -->
	<c:if test="${currentPage < lastPage}">
		<c:if test="${categoryName == null}">
			<c:if test="${serchWord == null}">
				<a href="${pageContext.request.contextPath}/IndexController?currentPage=${currentPage+1}">다음</a>
			</c:if>
			<c:if test="${serchWord != null}">
				<a href="${pageContext.request.contextPath}/SearchIndexController?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>
			</c:if>
		</c:if>
		<c:if test="${categoryName != null}">
			<a href="${pageContext.request.contextPath}/IndexController?currentPage=${currentPage+1}&categoryName=${categoryName}">다음</a>
		</c:if>
	</c:if>
</body>
</html>