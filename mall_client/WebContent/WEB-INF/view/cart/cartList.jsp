<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 메인메뉴 상단 -->
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<!-- 장바구니 List -->
	<h1>장바구니</h1>
<%
	List<Map<String, Object>> cartList = (List<Map<String, Object>>)(request.getAttribute("cartList"));
%>
	<table border="1">
		<tr>
			<td>cartNo</td>
			<td>ebookNo</td>
			<td>ebookTitle</td>
			<td>cartDate</td>
		</tr>
		<%
			for(Map<String, Object> map : cartList) {
		%>
			<tr>
				<td><%=map.get("cartNo") %></td>
				<td><%=map.get("ebookNo") %></td>
				<td><%=map.get("ebookTitle") %></td>
				<td><%=map.get("cartDate") %></td>
			</tr>
		<%
			}
		%>
	</table>
</body>
</html>