<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Travel HTML-5 Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/img/favicon.png">
<!-- Place favicon.ico in the root directory -->
<!-- CSS here -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/slicknav.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/animate.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/fontawesome-all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/slick.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/nice-select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/responsive.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 메인메뉴 상단 -->
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>

	<div class="section-top-border">
		<h3 class=""><!-- UpdateClientPwController.doGet() -> updateClientPw.jsp -->
	 <!-- UpdateClientPwController.doPost() -> ClientDao.updateClientPw() - session.invalidate() -> redirect:IndexController -->
	 <a href="${pageContext.request.contextPath}/UpdateClientPwController" class="genric-btn primary-border">비밀번호수정</a>
	 <!-- DeleteClientController -> CartDao.deleteCartAll(mail),ClientDao.deleteClient() - session.invalidate() -> redirect:IndexController -->
	 <a href="${pageContext.request.contextPath}/DeleteClientController" class="genric-btn primary-border">회원탈퇴</a></h3>
		<div class="progress-table-wrap">
			<div class="progress-table">
				<div class="table-head">
	 				<div class="serial">No</div>
	 				<div class="country">clientMail</div>
	 				<div class="percentage">clientDate</div>
				</div>
	 			<div class="table-row">
	 				<div class="serial">${clientOne.clientNo}</div>
	 				<div class="country">${clientOne.clientMail}</div>
	 				<div class="percentage">${clientOne.clientDate}</div>
	 			</div>
			</div>
		</div>
	</div>		
	 <!-- footer include -->
	<div>
		<jsp:include page="/WEB-INF/view/inc/footer.jsp"></jsp:include>
	</div>
</body>
</html>