<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	List<Map<String, Object>> orderslist = (List<Map<String, Object>>) request.getAttribute("ordersList");
	int currentPage = (int)request.getAttribute("currentPage");
	int lastPage = (int)request.getAttribute("lastPage");
%>
	<h1>주문리스트</h1>
	<table border="1">
		<tr>
			<td>ordersNo</td>
			<td>ebookNo</td>
			<td>ordersDate</td>
			<td>ordersState</td>
			<td>ebookTitle</td>
			<td>ebookPrice</td>
		</tr>
		<%
		for (Map m : orderslist) {
		%>
		<tr>
			<td><%=(Integer)(m.get("ordersNo"))%></td>
			<td><%=(Integer)(m.get("ebookNo"))%></td>
			<td><%=(String)(m.get("ordersDate"))%></td>
			<td><%=(String)(m.get("ordersState"))%></td>
			<td><%=(String)(m.get("ebookTitle"))%></td>
			<td><%=(Integer)(m.get("ebookPrice"))%></td>
		</tr>
		<%
		}
		%>
	</table>
	<!-- 페이징 -->
<%
	if(currentPage > 1) { // 첫페이지 이전버튼 비활성
%>
		<a href="<%=request.getContextPath()%>/OrdersListController?currentPage=<%=currentPage-1%>">이전</a>
<%
	}
	
	if(currentPage < lastPage) { // 마지막페이지 다음버튼 비활성
%>
		<a href="<%=request.getContextPath()%>/OrdersListController?currentPage=<%=currentPage+1%>">다음</a>
<%
	}
%>
</body>
</html>