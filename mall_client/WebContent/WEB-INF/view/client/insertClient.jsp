<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertClient</title>
</head>
<body>
	<!-- 메인메뉴 상단 -->
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<h1>회원가입</h1>
	<form action="${pageContext.request.contextPath}/InsertClientController" method="post">
		ID : <input type="text" name="clientMail">
		PW : <input type="text" name="clientPw">
		<button type="submit">회원가입</button>
	</form>
</body>
</html>