<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateClientPw</title>
</head>
<body>
<!-- 메인메뉴 네비게이션 -->
<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
<h1>updateClientPw</h1>
	<form action="${pageContext.request.contextPath}/UpdateClientPwController" method="post">
		<div>
		변경할 비밀번호 : <input type="text" name="clientPw">
		</div>
		<button type="submit">변경</button>
	</form>
</body>
</html>