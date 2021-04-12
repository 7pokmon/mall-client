<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "mall.client.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<!-- 출력부 View -->
<body>
	<!-- 메뉴 -->
	
	<!-- 상품리스트 -->
	<h1>index</h1>
	<%
		List<Ebook> ebookList = (List<Ebook>)(request.getAttribute("ebookList"));
	%>
	<table border="1">
		<tr>
		<%
			int i = 0;
			for(Ebook ebook : ebookList){
				i += 1;
		%>
				<td>
					<div><img src="<%=request.getContextPath()%>/img/default.jpg"></div>
					<div><a href=""><%=ebook.getEbookTitle()%></a></div>
					<div>￦<%=ebook.getEbookPrice()%></div>
				</td>
		<%
			// 5개보여주고 줄바꿈
			if(i%5 == 0) {
		%>
			</tr><tr>
		<%		
				}
			}
		%>
		</tr>
	</table>
</body>
</html>