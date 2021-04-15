<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mall.client.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Ebook ebook = (Ebook)request.getAttribute("ebook");
%>
	<!-- 상단메뉴 네비게이션 -->
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<h1>ebookOne</h1>
	<table border="1">
		<tr>
			<td>ebookNo</td>
			<td><%=ebook.getEbookNo()%></td>
		</tr>
		<tr>
			<td>ISBN</td>
			<td><%=ebook.getEbookISBN()%></td>
		</tr>
		<tr>
			<td>categoryName</td>
			<td><%=ebook.getCategoryName()%></td>
		</tr>
		<tr>
			<td>Title</td>
			<td><%=ebook.getEbookTitle()%></td>
		</tr>
		<tr>
			<td>Author</td>
			<td><%=ebook.getEbookAuthor()%></td>
		</tr>
		<tr>
			<td>Company</td>
			<td><%=ebook.getEbookCompany()%></td>
		</tr>
		<tr>
			<td>Img</td>
			<td><img src="<%=request.getContextPath()%>/img/default.jpg"></td>
		</tr>
		<tr>
			<td>Summary</td>
			<td><%=ebook.getEbookSummary()%></td>
		</tr>
		<tr>
			<td>PageCount</td>
			<td><%=ebook.getEbookPageCount()%></td>
		</tr>
		<tr>
			<td>Price</td>
			<td><%=ebook.getEbookPrice()%></td>
		</tr>
		<tr>
			<td>State</td>
			<td><%=ebook.getEbookState()%></td>
		</tr>
		<tr>
			<td>Date</td>
			<td><%=ebook.getEbookDate()%></td>
		</tr>
	</table>
	<!-- InsertCartController?ebookNo - CartDao.insertCart() - redirect:CartListController -->
	<a href="<%=request.getContextPath()%>/InsertCartController?ebookNo=<%=ebook.getEbookNo()%>">
		<%
			if(session.getAttribute("loginClient") == null
				|| ebook.getEbookState().equals("품절")
				|| ebook.getEbookState().equals("절판")
				|| ebook.getEbookState().equals("구편절판")) {
		%>
				<button type="button" disabled="disabled">장바구니추가</button>
		<%		
			} else {
		%>
			<button type="button">장바구니추가</button>
		<%		
			}
		%>
	</a>
</body>
</html>