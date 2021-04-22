<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<!-- 장바구니 List -->
	<div class="slider-area ">
        <!-- Mobile Menu -->
        <div class="single-slider slider-height2 d-flex align-items-center" data-background="${pageContext.request.contextPath}/assets/img/hero/about.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>CartList</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     </div>
<div class="table-responsive">	
	<table class="table">
		<tr>
			<td>cartNo</td>
			<td>ebookNo</td>
			<td>ebookTitle</td>
			<td>cartDate</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<c:forEach var="m" items="${cartList}">
			<tr>
				<td>${m.cartNo}</td>
				<td>${m.ebookNo}</td>
				<td>${m.ebookTitle}</td>
				<td>${m.cartDate}</td>
				<!-- DeleteCartController -> CartDao.deleteCart() -> redirect:CartListController -->
				<td><a href="${pageContext.request.contextPath}/DeleteCartController?cartNo=${m.cartNo}" class="genric-btn link-border circle">삭제</a></td>
				<!-- InsertOrdersController -> insertOrders(),deleteCart()::ISSUE 트렌처리 -> redirect:OrdersListController -->
				<td><a href="${pageContext.request.contextPath}/InsertOrdersController?ebookNo=${m.ebookNo}" class="genric-btn link-border circle">주문</a></td>
			</tr>
		</c:forEach>
	</table>
</div>	
	<!-- footer include -->
	<div>
		<jsp:include page="/WEB-INF/view/inc/footer.jsp"></jsp:include>
	</div>
</body>
</html>