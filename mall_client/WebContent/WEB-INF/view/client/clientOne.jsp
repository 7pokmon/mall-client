<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mall.client.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Client clientOne = (Client)(request.getAttribute("clientOne"));
%>
	<!-- 메인메뉴 상단 -->
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	 <h1>회원정보</h1>
	 <table border="1">
	 	<tr>
	 		<td>clientNo</td>
	 		<td>clientMail</td>
	 		<td>clientDate</td>
	 	</tr>
	 	<tr>
	 		<td><%=clientOne.getClientNo()%></td>
	 		<td><%=clientOne.getClientMail()%></td>
	 		<td><%=clientOne.getClientDate().substring(0, 10)%></td>
	 	</tr> 
	 </table>
	 <!-- UpdateClientPwController.doGet() -> updateClientPw.jsp -->
	 <!-- UpdateClientPwController.doPost() -> ClientDao.updateClientPw() - session.invalidate() -> redirect:IndexController -->
	 <a href="<%=request.getContextPath()%>/UpdateClientPwController">비밀번호수정</a>
	 <!-- DeleteClientController -> CartDao.deleteCartAll(mail),ClientDao.deleteClient() - session.invalidate() -> redirect:IndexController -->
	 <a href="<%=request.getContextPath()%>/DeleteClientController">회원탈퇴</a>
</body>
</html>