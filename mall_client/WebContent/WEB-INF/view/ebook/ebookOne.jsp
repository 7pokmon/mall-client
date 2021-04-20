<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 상단메뉴 네비게이션 -->
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<h1>ebookOne</h1>
	<table border="1">
		<tr>
			<td>ebookNo</td>
			<td>${ebook.ebookNo}</td>
		</tr>
		<tr>
			<td>ISBN</td>
			<td>${ebook.ebookISBN}</td>
		</tr>
		<tr>
			<td>categoryName</td>
			<td>${ebook.categoryName}</td>
		</tr>
		<tr>
			<td>Title</td>
			<td>${ebook.ebookTitle}</td>
		</tr>
		<tr>
			<td>Author</td>
			<td>${ebook.ebookAuthor}</td>
		</tr>
		<tr>
			<td>Company</td>
			<td>${ebook.ebookCompany}</td>
		</tr>
		<tr>
			<td>Img</td>
			<td><img src="${pageContext.request.contextPath}/img/default.jpg"></td>
		</tr>
		<tr>
			<td>Summary</td>
			<td>${ebook.ebookSummary}</td>
		</tr>
		<tr>
			<td>PageCount</td>
			<td>${ebook.ebookPageCount}</td>
		</tr>
		<tr>
			<td>Price</td>
			<td>${ebook.ebookPrice}</td>
		</tr>
		<tr>
			<td>State</td>
			<td>${ebook.ebookState}</td>
		</tr>
		<tr>
			<td>Date</td>
			<td>${ebook.ebookDate}</td>
		</tr>
	</table>
	<!-- InsertCartController?ebookNo - CartDao.insertCart() - redirect:CartListController -->
	<a href="${pageContext.request.contextPath}/InsertCartController?ebookNo=${ebook.ebookNo}">
		<c:if test="${loginClient == null 
		|| ebook.ebookState == '품절' 
		|| ebook.ebookState == '절판' 
		|| ebook.ebookState == '구편절판'}">
			<button type="button" disabled="disabled">장바구니추가</button>
		</c:if>
		<c:if test="${loginClient != null}">
			<button type="button">장바구니추가</button>
		</c:if>
	</a>
</body>
</html>