<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
	 		<td>${clientOne.clientNo}</td>
	 		<td>${clientOne.clientMail}</td>
	 		<td>${clientOne.clientDate}</td>
	 	</tr> 
	 </table>
	 <!-- UpdateClientPwController.doGet() -> updateClientPw.jsp -->
	 <!-- UpdateClientPwController.doPost() -> ClientDao.updateClientPw() - session.invalidate() -> redirect:IndexController -->
	 <a href="${pageContext.request.contextPath}/UpdateClientPwController">비밀번호수정</a>
	 <!-- DeleteClientController -> CartDao.deleteCartAll(mail),ClientDao.deleteClient() - session.invalidate() -> redirect:IndexController -->
	 <a href="${pageContext.request.contextPath}/DeleteClientController">회원탈퇴</a>
</body>
</html>